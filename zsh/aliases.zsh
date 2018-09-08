# cd
alias ..='cd ..'
alias c="cd ~/Code"
alias code=c
alias cdl= "cd ~/Code/librato"

# ls
alias ls="ls -F"
alias l="ls -lAh"
alias ll="ls -l"
alias la='ls -A'

# dotfiles
alias mdf="cd ~/.dotfiles && mvim ~/.dotfiles"

# tmux
alias tmux="TERM=screen-256color-bce tmux"
alias mux="TERM=screen-256color-bce mux"
alias tmuxkill="tmux kill-session"

# DBs
alias sup="mysqlstart; rup"

# Docker
alias dockercleanup="docker rm `docker ps -aq`"

# MySQL + mycli
alias mysql="mycli"

# Hub
alias git="hub"

# ctags
alias ctags="`brew --prefix`/bin/ctags"
