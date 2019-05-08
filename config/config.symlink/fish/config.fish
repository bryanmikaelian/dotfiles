set -xg PATH "./bin:$HOME/.dotfiles/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:$HOME/.rvm/bin:$GOPATH/bin:/bin:$HOME/.cargo/bin:/usr/local/go/bin"

set -xU EDITOR vim
set -xU FZF_DEFAULT_COMMAND 'fd --type f'
set -xU GOROOT /usr/local/opt/go/libexec
set -xU GOPATH $HOME/Code/Go

set -xU GPG_TTY (tty)

status --is-interactive; and source (rbenv init -|psub)

alias git='hub'
alias gl='git pull'
alias gp='git push'
alias gcl='git clean -f'
alias gd='git diff'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'
alias gsiu='git submodule init && git submodule update'
alias gsu='git submodule foreach git pull'
