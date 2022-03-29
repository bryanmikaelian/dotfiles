return require('packer').startup(function()
  -- core
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nathom/filetype.nvim'

  -- packer
  use 'wbthomason/packer.nvim'

  -- fonts and UI
  use {
    'shaunsingh/nord.nvim',
    config = function() require('nord').set() end,
  }

  use 'kyazdani42/nvim-web-devicons'

  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('./configs/bufferline') end
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

  use 'glepnir/dashboard-nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require('./configs/lualine') end,
  }

  -- file manager
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
    'kyazdani42/nvim-tree.lua',
    config = function() require('./configs/nvimtree') end
  }

  -- tmux
  use {
    'aserowy/tmux.nvim',
    config = function() require('tmux').setup() end
  }

  use 'christoomey/vim-tmux-navigator'

  use 'edkolev/tmuxline.vim'

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function() require('gitsigns').setup() end
  }

  -- lsp

  use {
    "neovim/nvim-lspconfig",
    module = "lspconfig",
    setup = function()
      vim.defer_fn(function()
        require("packer").loader "nvim-lspconfig"
      end, 0)

      vim.defer_fn(function()
        vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
      end, 0)
    end,

    config = function() 
      require'lspconfig'.solargraph.setup{}
    end
  }

  use {
    "ray-x/lsp_signature.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("lsp_signature").setup({
        bind = true,
        doc_lines = 0,
        floating_window = true,
        fix_pos = true,
        hint_enable = true,
        hint_prefix = " ",
        hint_scheme = "String",
        hi_parameter = "Search",
        max_height = 22,
        max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
        handler_opts = {
           border = "single", -- double, single, shadow, none
        },
        zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
        padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
      })
    end
  }

  use {
    "andymass/vim-matchup",
    opt = true,
    setup = function()
      vim.defer_fn(function()
        require("packer").loader "vim-matchup"
      end, 0)
    end
  }

  use {
    "rafamadriz/friendly-snippets",
    module = "cmp_nvim_lsp",
    event = "InsertEnter",
    config = function()
    end
  }

  use {
    "hrsh7th/nvim-cmp",
    after = "friendly-snippets",
    config = function()
      local cmp = require'cmp'

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm {
             behavior = cmp.ConfirmBehavior.Replace,
             select = true,
          },
          ["<Tab>"] = cmp.mapping(function(fallback)
             if cmp.visible() then
                cmp.select_next_item()
             elseif require("luasnip").expand_or_jumpable() then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
             else
                fallback()
             end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
             if cmp.visible() then
                cmp.select_prev_item()
             elseif require("luasnip").jumpable(-1) then
                vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
             else
                fallback()
             end
          end, { "i", "s" }),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "nvim_lua" },
          { name = "path" },
        })
      })
    end
  }

  use {
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      require("luasnip").config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI"
      })
    end
  }

  use {
    "saadparwaiz1/cmp_luasnip",
    after = "LuaSnip"
  }

  use {
    "hrsh7th/cmp-nvim-lua",
    after = "cmp_luasnip"
  }

  use {
    "hrsh7th/cmp-nvim-lsp",
    after = "cmp-nvim-lua"
  }

  use {
    "hrsh7th/cmp-buffer",
    after = "cmp-nvim-lsp"
  }

  use {
    "hrsh7th/cmp-path",
    after = "cmp-buffer"
  }

  -- language specific
  use {
    'fatih/vim-go',
    run = ':GoUpdateBinaries' 
  }

  use 'guns/vim-sexp'
  use 'guns/vim-clojure-static'
  use 'guns/vim-clojure-highlight'
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
end)
