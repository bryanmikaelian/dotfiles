--------------------------------------------
-- Help guide:
-- https://github.com/nanotee/nvim-lua-guide
--------------------------------------------

require('plugins')

-- global variables
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

vim.g.nord_disable_background = false

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
require('onedark').setup({
  style = "darker"
})
require('onedark').load()
vim.opt.syntax = 'enable'
-- vim.opt.background = 'dark'
vim.opt.termguicolors = true

----------
-- keymaps
----------


-- completion

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

-- pane navigation
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', { noremap = true })

-- bufferline
vim.api.nvim_set_keymap('n', '<TAB>', ':BufferLineCycleNext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', { noremap = true })
