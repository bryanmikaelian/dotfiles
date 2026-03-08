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

# Install Homebrew
install_homebrew() {
    if command -v brew &>/dev/null; then
        log_success "Homebrew already installed"
        return
    fi
    log_info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add brew to PATH for the rest of this script
    local os=$(detect_os)
    if [[ "$os" == "macos" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    fi
    log_success "Homebrew installed"
}

# Install Oh My Zsh
install_ohmyzsh() {
    if [[ -d "$HOME/.oh-my-zsh" ]]; then
        log_success "Oh My Zsh already installed"
        return
    fi
    log_info "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    log_success "Oh My Zsh installed"
}

# Install Oh My Zsh custom plugins
install_omz_plugins() {
    local ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

    local plugins=(
        "zsh-autosuggestions|https://github.com/zsh-users/zsh-autosuggestions"
        "zsh-syntax-highlighting|https://github.com/zsh-users/zsh-syntax-highlighting"
        "fast-syntax-highlighting|https://github.com/zdharma-continuum/fast-syntax-highlighting"
        "zsh-autocomplete|https://github.com/marlonrichert/zsh-autocomplete"
    )

    for entry in "${plugins[@]}"; do
        local name="${entry%%|*}"
        local url="${entry##*|}"
        local dest="$ZSH_CUSTOM/plugins/$name"
        if [[ -d "$dest" ]]; then
            log_success "Oh My Zsh plugin '$name' already installed"
        else
            log_info "Installing Oh My Zsh plugin: $name"
            git clone "$url" "$dest"
            log_success "Installed '$name'"
        fi
    done
}

# Install prerequisites
install_prerequisites() {
    local os=$(detect_os)
    log_info "Installing prerequisites for $os..."

    # Homebrew (macOS and Linux)
    install_homebrew

    # Kitty
    if command -v kitty &>/dev/null; then
        log_success "Kitty already installed"
    else
        if [[ "$os" == "macos" ]]; then
            log_info "Installing Kitty..."
            brew install --cask kitty
            log_success "Kitty installed"
        else
            log_warning "Kitty: install manually on Linux (https://sw.kovidgoyal.net/kitty/binary/)"
        fi
    fi

    # Starship
    if command -v starship &>/dev/null; then
        log_success "Starship already installed"
    else
        log_info "Installing Starship..."
        brew install starship
        log_success "Starship installed"
    fi

    # JetBrainsMono Nerd Font
    if [[ "$os" == "macos" ]]; then
        if brew list --cask font-jetbrains-mono-nerd-font &>/dev/null 2>&1; then
            log_success "JetBrainsMono Nerd Font already installed"
        else
            log_info "Installing JetBrainsMono Nerd Font..."
            brew install --cask font-jetbrains-mono-nerd-font
            log_success "JetBrainsMono Nerd Font installed"
        fi
    else
        log_warning "JetBrainsMono Nerd Font: install manually on Linux (https://www.nerdfonts.com/font-downloads)"
    fi

    # mise
    if command -v mise &>/dev/null; then
        log_success "mise already installed"
    else
        log_info "Installing mise..."
        brew install mise
        log_success "mise installed"
    fi

    # Oh My Zsh
    install_ohmyzsh

    # Oh My Zsh plugins
    install_omz_plugins

    log_success "Prerequisites installation complete!"
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

    # Install prerequisites before symlinking
    install_prerequisites

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
