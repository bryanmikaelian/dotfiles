# cd
alias ..='cd ..'
alias c="cd ~/Code"

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

# Work
alias bsdev='mysql socialbooks_development -uroot'
alias cdrtb="cd ~/Code/rethinkbooks"
alias cdbs="cdrtb; cd getsocialbooks.com"
alias cdbsz="cdbs; zeus start"
alias sup="mysqlstart; rup"
