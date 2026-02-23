# Overview

Dotfiles managed via symlinks. Files ending in `.symlink` are linked to their target locations by `bootstrap.sh`.

# Agentic Coding Rules

- **Always ask permission before significant changes** - Don't switch tools/editors (nvim→emacs), change shell configs, or modify core workflows without approval
- **Use plan mode heavily** - For any non-trivial changes, enter plan mode to explore and propose an approach before implementing

# Agents

**Repo-specific agents:** `./.claude/agents/` - Only for this dotfiles repo (e.g., dotbot)
**Global agents:** `claude/agents.symlink/global/` → `~/.claude/agents/global/` - Available in all projects

When creating new agents, put dotfiles-related agents in `./.claude/agents/` and cross-project agents in `claude/agents.symlink/global/`.

# Symlinking Rules

- `config/*.symlink` → `~/.config/`
- `claude/*.symlink` → `~/.claude/`
- `ssh/*.symlink` → `~/.ssh/`
- `home/*.symlink` → `~/.filename` (adds dot prefix)
- `zsh/functions/*` → autoloaded zsh functions

OS-specific: `home/gitconfig-{macos,linux}.symlink` → `~/.gitconfig-os`

# Commands

- `bootstrap.sh install` - create symlinks (backs up existing files)
- `bootstrap.sh uninstall` - remove symlinks and restore backups
