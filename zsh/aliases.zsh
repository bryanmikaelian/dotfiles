# aliases - git
alias gl='git pull'
alias gp='git push'
alias gcl='git clean -f'
# alias gd='git diff'
# alias gca='git commit -a'
# alias gco='git checkout'
# alias gb='git branch'
alias gs='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'

# dotfiles
alias mdf="mvim ~/.dotfiles"
alias cdf="cd ~/.dotfiles"

# aliases - zshrc
alias zshconfig="mvim ~/.zshrc"

# cd
alias ..='cd ..'

# ls
alias ls="ls -F"
alias l="ls -lAh"
alias ll="ls -l"
alias la='ls -A'
