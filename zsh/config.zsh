plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete docker colorize)
fpath=($fpath $DOTFILES/zsh/functions $DOTFILES/zsh/functions/work)

# functions
autoload -U $DOTFILES/zsh/functions/*(:t)
autoload -U $DOTFILES/zsh/functions/work/*(:t)

setopt COMPLETE_ALIASES # no aliases until zsh-autocomplete is done
setopt COMPLETE_IN_WORD # move cursor to end of word after zsh-autocomplete
setopt EXTENDED_HISTORY # add timestamps to history
setopt HIST_IGNORE_ALL_DUPS # no duplicate history items
setopt HIST_REDUCE_BLANKS # remove blanks
setopt HIST_VERIFY # expand history instead of automatically executing

unsetopt correct # dont correct spelling errors
