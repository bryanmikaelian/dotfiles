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
alias tmux="tmux -2"
# alias ts="TERM=screen-256color-bce mux start"
alias tmuxkill="tmux kill-session"

# Work
alias bsdev='mysql socialbooks_development -uroot'
alias cdrtb="cd ~/Code/rethinkbooks"
alias cdbs="cdrtb; cd getsocialbooks.com"
alias cdbsz="cdbs; zeus start"
alias sup="mysqlstart; rup"
