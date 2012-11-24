dotfiles
========
Inspired by [Zach Holman's setup](https://github.com/holman/dotfiles)

About
=====
These dotfiles were inspired by Zach Holman's dotfiles.  Everything with the .symlink extension will exist under ~ via a symlink to this repo.

Installation
============
For an exact setup of my machine, do the following:

1) Download and install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
2) Clone this repo to a directory of your choice. I use ~/.dotfiles.
3) cd into that directory
4) rake install

Boom.  All the files/directories that ended in .symlink will now exist under ~.  ZSH files will also link over.


Customization
=============

I have everything organized into folders but by no means is that required.  The rakefile simply looks for anything with a .symlink extension and performs an ln -s to the appropriate item under ~.  So for example, the directory git.symlink will link to ~/.git.
If you want additional files to be linked over or you install something that likes to live under ~ (such as tmuxinator), just create a directory ending in .symlink and throw all the apropriate files under there.  See tmux.symlink, git.symlink, or vim.symlink for examples.




Specifics
==========
- Shell: zsh
- Editor: vim
- Terminal: iTerm2
- Uses Tmux: Yes
- Color Scheme: Solarized Dark
- System: Mac OS X Mountain Lion


