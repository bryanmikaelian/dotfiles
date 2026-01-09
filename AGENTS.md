This repo contains all my dotfiles to configure my machine

# Workflow

- Clone this repo to ~/.dotfiles
- Run ./boostrap.sh

Anything with a .symlink extension will be symlinked to the same file under $HOME

# Key points

- ./config is a special directory and the first of its kind. We only symlink the relevant subdirectories. Not everything in ~/.config on a machine needs to be in this repo.
- Other directories that just need some files under itsymlinked follow the same pattern as config. For example, ./ssh will symlink all relevant files under it to .ssh
- This directory vs file under $HOME logic is in bootstrap.sh
- Any .zsh file is automagically loaded. See .zshrc
- Try to have each zsh/\*.zsh file scoped to a single role.
- This repo supports both MacOS and Linux machines. I use both.
- Anything with `work` in the name is ignored because that is specific to the machine.
- I don't really use emacs anymore but it's there in case I decide to go back.
- I use mise for dependencies
