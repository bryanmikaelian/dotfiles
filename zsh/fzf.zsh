export FZF_DEFAULT_COMMAND="rg --files"

# Key bindings (ctrl+t, ctrl+r, alt+c) and completion
command -v fzf &>/dev/null && source <(fzf --zsh)
