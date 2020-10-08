alias rs='rails server'
alias rgc='rails generate controller'
alias rgm='rails generate model'
alias cdr='cd ~/Code/Rails'
alias migrate='rake db:migrate db:test:clone'
alias crb='cd ~/Code/Ruby'
alias rst='touch ~/.pow/restart.txt'
#
# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# rbenv
eval "$(rbenv init - --no-rehash)"
