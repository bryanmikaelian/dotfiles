export PATH="$PATH:/Applications/kitty.app/Contents/MacOS"

alias ks="kitty --session"

function edir() {
  export PROJECT_DIR="."
  ks ~/.config/kitty/profiles/default.conf
}
