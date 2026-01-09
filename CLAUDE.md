# Overview

This repo is how I manage dotfiles across multiple machines.

# Pre-reqs

- `zsh` and oh my zsh have to be installed first
- I use the terminal kitty but any terminal should work
- It is OS agnostic (sans Windows)

# Directory Structure

```
.
├── agents/           - Agent configurations
├── claude/           - Claude-specific files
├── config/           - Config files symlinked to ~/.config/
│   ├── doom.symlink/
│   ├── kitty.symlink/
│   ├── nvim.symlink/
│   ├── tmuxinator.symlink/
│   └── zed.symlink/
├── emacs/            - Emacs configuration
│   └── emacs.d.symlink/
├── git/              - Git OS-specific configs (special handling)
├── home/             - Files symlinked to ~/ with dot prefix
├── ssh/              - SSH configs symlinked to ~/.ssh/
└── zsh/              - Zsh shell configurations
    └── functions/
```

# Symlinking Rules

All files/directories ending in `.symlink` get symlinked based on their location:

1. **config/** → `~/.config/`
   - `config/kitty.symlink/` → `~/.config/kitty/`
   - `config/starship.toml.symlink` → `~/.config/starship.toml`

2. **ssh/** → `~/.ssh/`
   - `ssh/config.symlink` → `~/.ssh/config`

3. **home/** → `~/` (with dot prefix)
   - `home/zshrc.symlink` → `~/.zshrc`
   - `home/gitconfig.symlink` → `~/.gitconfig`
   - `home/tmux.conf.symlink` → `~/.tmux.conf`
   - `home/gitignore.symlink` → `~/.gitignore`

4. **git/** → OS-specific handling (special case)
   - `git/gitconfig-macos.symlink` → `~/.gitconfig-os` (on macOS)
   - `git/gitconfig-linux.symlink` → `~/.gitconfig-os` (on Linux)
   - Note: This should probably be moved to home/ for consistency

5. **Everything else** → `~/` (with dot prefix)

# Installation

- `bootstrap.sh install` runs the show when installing
- `bootstrap.sh uninstall` removes symlinks and restores backups
- The script automatically backs up existing files before symlinking
