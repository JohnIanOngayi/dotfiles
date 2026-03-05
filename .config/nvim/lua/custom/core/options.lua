-- Tab and indentation settings
vim.opt.colorcolumn = "80"
vim.opt.wrap = true
vim.opt.background = "dark"

vim.opt.tabstop = 8
vim.opt.smarttab = true
vim.opt.shiftwidth = 8

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8 -- Scrolling lines offset
vim.opt.signcolumn = "yes"

-- File type detection and indentation
vim.cmd("filetype on")
vim.cmd("filetype indent on")

vim.opt.clipboard:append("unnamedplus")
vim.opt.hlsearch = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.mouse = "a"
vim.opt.signcolumn = "yes"
vim.opt.timeoutlen = 400

-- backup and undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
