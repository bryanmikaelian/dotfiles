set -xg PATH "./bin:$HOME/.dotfiles/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:$HOME/.rvm/bin:$GOPATH/bin:/bin:$HOME/.cargo/bin:/usr/local/go/bin"

set -xU EDITOR vim
set -xU FZF_DEFAULT_COMMAND 'fd --type f'
set -xU GOROOT /usr/local/opt/go/libexec
set -xU GOPATH $HOME/Code/Go

status --is-interactive; and source (rbenv init -|psub)
