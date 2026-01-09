#!/bin/bash

set -e  # Exit on any error

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Detect OS
detect_os() {
    case "$(uname -s)" in
        Darwin*)
            echo "macos"
            ;;
        Linux*)
            echo "linux"
            ;;
        *)
            log_error "Unsupported operating system: $(uname -s)"
            exit 1
            ;;
    esac
}

# Create backup of existing file
backup_file() {
    local file="$1"
    if [[ -e "$file" && ! -L "$file" ]]; then
        local backup="${file}.backup.$(date +%Y%m%d_%H%M%S)"
        log_warning "Backing up existing file: $file -> $backup"
        mv "$file" "$backup"
    fi
}

# Create symlink with proper handling
create_symlink() {
    local source="$1"
    local target="$2"

    # Create target directory if it doesn't exist
    local target_dir="$(dirname "$target")"
    if [[ ! -d "$target_dir" ]]; then
        log_info "Creating directory: $target_dir"
        mkdir -p "$target_dir"
    fi

    # Handle existing files/symlinks
    if [[ -L "$target" ]]; then
        log_info "Removing existing symlink: $target"
        rm "$target"
    elif [[ -e "$target" ]]; then
        backup_file "$target"
    fi

    # Create the symlink
    log_info "Linking $source -> $target"
    ln -sf "$source" "$target"
}

# Install dotfiles
install_dotfiles() {
    local os=$(detect_os)
    log_info "Detected OS: $os"

    log_info "Installing dotfiles from: $DOTFILES_DIR"

    # Find all .symlink files
    while IFS= read -r -d '' linkable; do
        # Extract the path components
        local rel_path="${linkable#$DOTFILES_DIR/}"
        local dir_name="$(dirname "$rel_path")"
        local file_name="$(basename "$rel_path")"
        local target_name="${file_name%.symlink}"

        # Skip if this is not actually a .symlink file
        if [[ "$file_name" != *.symlink ]]; then
            continue
        fi

        # Determine target location
        local target
        if [[ "$dir_name" == "config" ]]; then
            target="$HOME/.config/$target_name"
        elif [[ "$dir_name" == config/* ]]; then
            # Handle nested config directories
            local config_subdir="${dir_name#config/}"
            target="$HOME/.config/$config_subdir/$target_name"
        elif [[ "$dir_name" == "claude" ]]; then
            # Special case for Claude directory
            target="$HOME/.claude/$target_name"
        elif [[ "$dir_name" == claude/* ]]; then
            # Handle nested claude directories
            local claude_subdir="${dir_name#claude/}"
            target="$HOME/.claude/$claude_subdir/$target_name"
        elif [[ "$dir_name" == "ssh" ]]; then
            # Special case for SSH directory
            target="$HOME/.ssh/$target_name"
        elif [[ "$dir_name" == ssh/* ]]; then
            # Handle nested ssh directories
            local ssh_subdir="${dir_name#ssh/}"
            target="$HOME/.ssh/$ssh_subdir/$target_name"
        elif [[ "$dir_name" == "home" ]]; then
            # Special case for home directory
            target="$HOME/.$target_name"
        elif [[ "$dir_name" == home/* ]]; then
            # Handle nested home directories
            local home_subdir="${dir_name#home/}"
            target="$HOME/.$home_subdir/$target_name"
        else
            target="$HOME/.$target_name"
        fi

        create_symlink "$linkable" "$target"
    done < <(find "$DOTFILES_DIR" -name "*.symlink" -print0)

    # Handle OS-specific gitconfig
    log_info "Setting up OS-specific gitconfig"
    local gitconfig_os_source="$DOTFILES_DIR/home/gitconfig-${os}.symlink"
    local gitconfig_os_target="$HOME/.gitconfig-os"

    if [[ -f "$gitconfig_os_source" ]]; then
        create_symlink "$gitconfig_os_source" "$gitconfig_os_target"
        log_success "OS-specific gitconfig linked: $gitconfig_os_source -> $gitconfig_os_target"
    else
        log_warning "OS-specific gitconfig not found: $gitconfig_os_source"
    fi

    log_success "Dotfiles installation complete!"
}

# Uninstall dotfiles
uninstall_dotfiles() {
    log_info "Uninstalling dotfiles..."

    # Remove symlinks created by this script
    while IFS= read -r -d '' linkable; do
        local rel_path="${linkable#$DOTFILES_DIR/}"
        local dir_name="$(dirname "$rel_path")"
        local file_name="$(basename "$rel_path")"
        local target_name="${file_name%.symlink}"

        # Skip if this is not actually a .symlink file
        if [[ "$file_name" != *.symlink ]]; then
            continue
        fi

        local target
        if [[ "$dir_name" == "config" ]]; then
            target="$HOME/.config/$target_name"
        elif [[ "$dir_name" == config/* ]]; then
            # Handle nested config directories
            local config_subdir="${dir_name#config/}"
            target="$HOME/.config/$config_subdir/$target_name"
        elif [[ "$dir_name" == "claude" ]]; then
            # Special case for Claude directory
            target="$HOME/.claude/$target_name"
        elif [[ "$dir_name" == claude/* ]]; then
            # Handle nested claude directories
            local claude_subdir="${dir_name#claude/}"
            target="$HOME/.claude/$claude_subdir/$target_name"
        elif [[ "$dir_name" == "ssh" ]]; then
            # Special case for SSH directory
            target="$HOME/.ssh/$target_name"
        elif [[ "$dir_name" == ssh/* ]]; then
            # Handle nested ssh directories
            local ssh_subdir="${dir_name#ssh/}"
            target="$HOME/.ssh/$ssh_subdir/$target_name"
        elif [[ "$dir_name" == "home" ]]; then
            # Special case for home directory
            target="$HOME/.$target_name"
        elif [[ "$dir_name" == home/* ]]; then
            # Handle nested home directories
            local home_subdir="${dir_name#home/}"
            target="$HOME/.$home_subdir/$target_name"
        else
            target="$HOME/.$target_name"
        fi

        if [[ -L "$target" ]]; then
            log_info "Removing symlink: $target"
            rm "$target"

            # Restore backup if it exists
            local backup=$(find "$HOME" -name "$(basename "$target").backup.*" | head -1)
            if [[ -n "$backup" ]]; then
                log_info "Restoring backup: $backup -> $target"
                mv "$backup" "$target"
            fi
        fi
    done < <(find "$DOTFILES_DIR" -name "*.symlink" -print0)

    # Remove OS-specific gitconfig
    local gitconfig_os_target="$HOME/.gitconfig-os"
    if [[ -L "$gitconfig_os_target" ]]; then
        log_info "Removing OS-specific gitconfig symlink: $gitconfig_os_target"
        rm "$gitconfig_os_target"
    fi

    log_success "Dotfiles uninstallation complete!"
}

# Show help
show_help() {
    cat << EOF
Usage: $0 [COMMAND]

Commands:
    install     Install dotfiles
    uninstall   Remove dotfiles symlinks and restore backups
    help        Show this help message (default)

Examples:
    $0              # Show help
    $0 help         # Show help
    $0 install      # Install dotfiles
    $0 uninstall    # Uninstall dotfiles

This script will:
- Create symlinks for all .symlink files in your dotfiles directory
- Handle files in config/ directory by placing them in ~/.config/
- Handle files in claude/ directory by placing them in ~/.claude/
- Handle files in ssh/ directory by placing them in ~/.ssh/
- Handle files in home/ directory by placing them in ~/
- Create OS-specific gitconfig symlinks from home/ (gitconfig-macos/linux.symlink → ~/.gitconfig-os)
- Backup existing files before overwriting
- Create necessary directories

EOF
}

# Main script logic
main() {
    case "${1:-help}" in
        install)
            install_dotfiles
            ;;
        uninstall)
            uninstall_dotfiles
            ;;
        help|--help|-h)
            show_help
            ;;
        *)
            log_error "Unknown command: $1"
            show_help
            exit 1
            ;;
    esac
}

# Run main function with all arguments
main "$@"
