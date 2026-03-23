fpath=($HOME/.dotfiles/zsh/functions $HOME/.dotfiles/zsh/functions/work $fpath)
for func in $HOME/.dotfiles/zsh/functions/*(.N:t); do
  autoload -Uz $func
done
for func in $HOME/.dotfiles/zsh/functions/work/*(.N:t); do
  autoload -Uz $func
done
