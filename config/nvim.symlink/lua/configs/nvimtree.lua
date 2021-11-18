local nvimtree = require('nvim-tree')
local g = vim.g

g.nvim_tree_window_picker_exclude = {
   filetype = { 'notify', 'packer', 'qf' },
   buftype = { 'terminal' },
}

g.nvim_tree_show_icons = {
   folders = 1,
   folder_arrows = 1,
   files = 1,
   git = 1
}

g.nvim_tree_icons = {
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


nvimtree.setup {
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
}

