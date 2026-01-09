# Overview

This repo is how I manage dotfiles across multiple machines.

# Pre-reqs

- `zsh` and oh my zsh have to be installed first
- I use the terminal kitty but any terminal should work
- It is OS agnostic (sans Windows)

# Directory Structure

```
.
├── claude/           - Claude Code configurations
│   ├── agents.symlink/     - Custom agent configurations
│   └── CLAUDE.md.symlink   - Global Claude preferences
├── config/           - Config files symlinked to ~/.config/
│   ├── doom.symlink/
│   ├── kitty.symlink/
│   ├── nvim.symlink/
│   ├── opencode.symlink/   - OpenCode configurations
│   │   └── agent.symlink   - Symlink to claude/agents.symlink
│   ├── tmuxinator.symlink/
│   └── zed.symlink/
├── emacs/            - Emacs configuration
│   └── emacs.d.symlink/
├── home/             - Files symlinked to ~/ with dot prefix
├── ssh/              - SSH configs symlinked to ~/.ssh/
└── zsh/              - Zsh shell configurations
    └── functions/
```

# Symlinking Rules

All files/directories ending in `.symlink` get symlinked based on their location:

1. **config/** → `~/.config/`
   - `config/kitty.symlink/` → `~/.config/kitty/`
   - `config/opencode.symlink/` → `~/.config/opencode/`
   - `config/starship.toml.symlink` → `~/.config/starship.toml`

2. **claude/** → `~/.claude/`
   - `claude/CLAUDE.md.symlink` → `~/.claude/CLAUDE.md`
   - `claude/agents.symlink/` → `~/.claude/agents/`

3. **ssh/** → `~/.ssh/`
   - `ssh/config.symlink` → `~/.ssh/config`

4. **home/** → `~/` (with dot prefix)
   - `home/zshrc.symlink` → `~/.zshrc`
   - `home/gitconfig.symlink` → `~/.gitconfig`
   - `home/gitconfig-macos.symlink` → `~/.gitconfig-os` (on macOS, via special logic)
   - `home/gitconfig-linux.symlink` → `~/.gitconfig-os` (on Linux, via special logic)
   - `home/tmux.conf.symlink` → `~/.tmux.conf`
   - `home/gitignore.symlink` → `~/.gitignore`

5. **Everything else** → `~/` (with dot prefix)

# Installation

- `bootstrap.sh install` runs the show when installing
- `bootstrap.sh uninstall` removes symlinks and restores backups
- The script automatically backs up existing files before symlinking
