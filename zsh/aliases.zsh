# editor
alias e=nvim
alias vim=nvim

# cd
alias ..='cd ..'
alias c="cd ~/Code"
alias code=c

# ls
alias ls="ls -F"
alias l="ls -lAh"
alias ll="ls -l"
alias la='ls -A'

# dotfiles
alias mdf="cd ~/.dotfiles && mvim ~/.dotfiles"

# tmux
alias tmux="tmux -2"
alias tmuxkill="tmux kill-session"

# DBs
alias sup="mysqlstart; rup" 
# Docker
alias dockercleanup="docker rm `docker ps -aq`"

# MySQL + mycli
alias mysql="mycli"

# Hub
alias git="hub"

# k8
alias kc="kubectl"

# netlify
alias bbstg="gcloud container clusters get-credentials netlify-staging-dsm-1 --region us-central1 --project staging-267123; kubectl exec -n bitballoon-staging -it $(kubectl -n bitballoon-staging get pods --selector role=bitballoon-api -o jsonpath='{.items[0].metadata.name}') -- bash rails-console.sh"
alias bbsupport="~/Code/github.com/netlify/bitballoon/kubernetes/support-env.sh"

