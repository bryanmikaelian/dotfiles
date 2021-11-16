return require('packer').startup(function()
  -- core
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'wbthomason/packer.nvim'

  -- third party
  use 'arcticicestudio/nord-vim'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  use 'aserowy/tmux.nvim'
  use 'christoomey/vim-tmux-navigator'
  use 'edkolev/tmuxline.vim'
  use 'ervandew/supertab'
  use {
    'fatih/vim-go', run = ':GoUpdateBinaries' 
  }

  use 'famiu/feline.nvim'
 use 'glepnir/dashboard-nvim'
 use 'guns/vim-sexp'
 use 'guns/vim-clojure-static'
 use 'guns/vim-clojure-highlight'
 use 'honza/vim-snippets'
 use 'kyazdani42/nvim-web-devicons'
 use 'kyazdani42/nvim-tree.lua'
 use 'lewis6991/gitsigns.nvim'
 use 'lukas-reineke/indent-blankline.nvim'
 use {
     'neoclide/coc.nvim',
     branch = 'release'
 }
 use 'nvim-telescope/telescope.nvim'
 use {
   'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'
 }
 use 'onsails/lspkind-nvim'
 use 'p00f/nvim-ts-rainbow'
 use 'preservim/nerdcommenter'
 use {
   'prettier/vim-prettier', run = 'yarn install'
 }
 use 'rust-lang/rust.vim'
 use 'sroelants/clojure-fancify-symbols.vim'
 use 'tpope/vim-fireplace'
 use 'tpope/vim-fugitive'
 use 'tpope/vim-repeat'
 use 'tpope/vim-salve'
 use 'tpope/vim-sensible'
 use 'tpope/vim-sexp-mappings-for-regular-people'
 use 'tpope/vim-surround'
 use 'venantius/vim-cljfmt'
 use 'windwp/nvim-autopairs'

end)
