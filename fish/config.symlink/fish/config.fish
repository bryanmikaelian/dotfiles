# Editor
set -x EDITOR 'vim'

# Go
set -x GOROOT /usr/local/go
set -x GOPATH $HOME/Code/Go

# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme eclm

# PATH
set -gx PATH $PATH /usr/local/bin/elixir

# All built-in plugins can be found at ~/.oh-my-fish/plugins/
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Enable plugins by adding their name separated by a space to the line below.
set fish_plugins theme
set fish_plugins tmux
# set fish_plugins rails
set fish_plugins rbenv

# 
# set PATH $HOME/.rbenv/bin $PATH
# set PATH $HOME/.rbenv/shims $PATH
# rbenv rehash >/dev/null ^&1
# set -x RBENV_VERSION "2.2.2"


# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# rvm
