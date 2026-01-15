export PATH="$PATH:/Applications/kitty.app/Contents/MacOS"

alias ks="kitty --session"
alias kitty3="kitty --session ~/.config/kitty/profiles/three-pane.conf"

function edir() {
  export PROJECT_DIR="${1:-.}"
  ks ~/.config/kitty/profiles/default.conf
}

function ed() {
  cd "${1:-.}"
  kitty3
}
