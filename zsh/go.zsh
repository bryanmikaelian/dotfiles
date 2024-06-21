export GOPATH="$HOME/go"

# go binary
export PATH="$PATH:/opt/homebrew/opt/go@1.21/bin"

# third-party binaries
export PATH="$PATH:$(go env GOPATH)/bin"
