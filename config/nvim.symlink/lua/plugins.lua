return require('packer').startup(function()
  -- core
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'wbthomason/packer.nvim'

  -- third party
  use {
    'shaunsingh/nord.nvim',
    config = function() require('nord').set() end,
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require('./configs/lualine') end,
  }

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('./configs/bufferline') end
  }
  use {
    'aserowy/tmux.nvim',
    config = function() require('tmux').setup() end
  }
  use 'christoomey/vim-tmux-navigator'
  use 'edkolev/tmuxline.vim'
  use {
    'fatih/vim-go',
    run = ':GoUpdateBinaries' 
  }

-- use {
  --  'famiu/feline.nvim',
  --  config = function() require('./configs/feline')
  -- }
  use 'glepnir/dashboard-nvim'
  use 'guns/vim-sexp'
  use 'guns/vim-clojure-static'
  use 'guns/vim-clojure-highlight'
  use 'honza/vim-snippets'
  use 'kyazdani42/nvim-web-devicons'
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require('./configs/nvimtree') end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require('gitsigns').setup() end
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('indent_blankline').setup({
          indentLine_enabled = 1,
          buftype_exclude = {"terminal", "dashboard"},
          show_current_context = true,
          show_first_indent_level = false,
    }) end,
  }
  use {
     'neoclide/coc.nvim',
     branch = 'release'
  }
  use {
    'nvim-telescope/telescope.nvim',
    config = function() require('./configs/telescope') end
  }
  use {
     'nvim-treesitter/nvim-treesitter',
     run = ':TSUpdate',
     config = function() require('.configs/treesitter') end
  }
  use {
    'onsails/lspkind-nvim',
    config = function() require('lspkind').init({}) end
  }
  use {
    'p00f/nvim-ts-rainbow',
    ft = {'clj', 'cljs', 'lsp'}
  }
  use {
   'prettier/vim-prettier',
   run = 'yarn install'
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

  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config =  function() require("trouble").setup({}) end,
  }

end)
