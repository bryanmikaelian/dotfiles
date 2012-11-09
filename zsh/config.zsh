# ZSH Configs
ZSH=$HOME/.oh-my-zsh
DISABLE_LS_COLORS="true"

source $ZSH/oh-my-zsh.sh

# NVM
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# BAD AUTOCORRECT
unsetopt correct_all

# tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
