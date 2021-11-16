--------------------------------------------
-- Help guide:
-- https://github.com/nanotee/nvim-lua-guide
--------------------------------------------

require('plugins')

-- global variables
vim.g.airline_theme = 'nord'
vim.g.airline_powerline_fonts = 2
vim.g['prettier#autoFormat'] = 0
vim.g.dashboard_default_executive = 'telescope'
vim.g.dashboard_custom_shortcut = {
  ['last_session']      = '',
  ['find_history']      = '<Leader> f o',
  ['find_file']         = '<Leader> f f',
  ['new_file']           = '',
  ['change_colorscheme'] = '<Leader> f c',
  ['find_word']         = '<Leader> f g',
  ['book_marks']         = '<Leader> f b',
}
vim.g.nvim_tree_special_files = {
  ['README.md'] = true,
  ['Makefile'] = true
}

-- general config
vim.opt.compatible = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.mouse = { a = true }

-- ui
vim.opt.laststatus = 2
vim.opt.lazyredraw = false
vim.opt.showcmd = false
vim.opt.guifont = 'CaskaydiaCove Nerd Font Mono'

-- text and formatting
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smarttab = false
vim.opt.encoding = 'utf-8'
vim.opt.shortmess:append({ a = true })
vim.opt.autoread = true
vim.opt.wildmode = "list:longest,list:full"

-- visual
vim.opt.relativenumber = true
vim.opt.numberwidth = 3
vim.opt.showmatch = true
vim.opt.mat = 5
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.api.nvim_command([[
autocmd WinEnter,FocusGained * :setlocal number relativenumber
autocmd WinLeave,FocusLost   * :setlocal number norelativenumber
]])

-- colors
vim.api.nvim_command([[colorscheme nord]])
vim.opt.syntax = 'enable'
vim.opt.background = 'dark'
vim.opt.termguicolors = true

----------
-- keymaps
----------

-- splits
vim.api.nvim_set_keymap('', '<Leader>sc', ':close<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<Leader>sh', ':sp<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<Leader>sv', ':vsp<CR>', { noremap = true })

-- neovim tree
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>r', ':NvimTreeRefresh<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeFindFile<CR>', { noremap = true })

-- telescope
vim.api.nvim_set_keymap('n', '<Leader>fo', '<cmd>Telescope oldfiles<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fc', '<cmd>Telescope colorscheme<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>Telescope marks<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fbf', '<cmd>Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>fh', '<cmd>Telescope help_tags<CR>', { noremap = true })

-- fugitive
vim.api.nvim_set_keymap('n', '<Leader>g', ':Git<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ga', ':Git add<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gc', ':Git commit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gs', ':Git status<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gd', ':Git diff<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gb', ':Git blame<CR>', { noremap = true })

-- navigation
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>1', '1gt', {})
vim.api.nvim_set_keymap('n', '<Leader>2', '2gt', {})
vim.api.nvim_set_keymap('n', '<Leader>3', '3gt', {})
vim.api.nvim_set_keymap('n', '<Leader>4', '4gt', {})
vim.api.nvim_set_keymap('n', '<Leader>5', '5gt', {})
vim.api.nvim_set_keymap('n', '<Leader>6', '6gt', {})


-----------------
-- plugin configs
-----------------
require('gitsigns').setup()

require'indent_blankline'.setup {
    buftype_exclude = {"terminal"},
    show_current_context = true
}
require('lspkind').init({})

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    colors = {
      "#8fbcbb",
      "#88C0D0",
      "#81A1C1",
      "#5E81AC"
    }
  }
}

require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "node_modules", "target" }
  }
}

require('nvim-autopairs').setup{}

require('nvim-tree').setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  show_icons = {
    git = true,
    folders = true,
    files = true,
    folder_arrows = true
  },
  view = {
    width = 40,
    height = 30,
    hide_root_folder = false,
    side = 'right',
    auto_resize = false,
    ignore = {'.git', 'node_modules', '.cache'},
    gitignore = true,
    auto_open = false,
    auto_close = false,
    auto_ignore_ft = {'startify', 'dashboard'},
    quit_on_open = true,
    tree_follow = true,
    indent_markers = true,
    hide_dotfiles = true,
    git_hl = true,
    highlight_opened_files = true,
    root_folder_modifier = ':~',
    tab_open = true,
    auto_resize = false,
    disable_netrw = false,
    hijack_netrw = false,
    add_trailing = true,
    group_empty = true,
    lsp_diagnostics = true,
    disable_window_picker = true,
    hijack_cursor = false,
    icon_padding = ' ',
    symlink_arrorw = ' >> ',
    update_cwd = true,
    respect_buf_cwd = true,
    mappings = {
      custom_only = false,
      list = {}
    }
  },
  icons = {
    default =  '',
    symlink =  '',
    git =  {
      unstaged =  "✗",
      staged =  "✓",
      unmerged =  "",
      renamed =  "➜",
      untracked =  "★",
      deleted =  "",
      ignored =  "◌"
    },
    folder =  {
      arrow_open =  "",
      arrow_closed =  "",
      default =  "",
      open =  "",
      empty =  "",
      empty_open =  "",
      symlink =  "",
      symlink_open =  "",
    },
    lsp =  {
       hint =  "",
       info =  "",
       warning =  "",
       error =  "",
     }
  }
}

require("tmux").setup()
