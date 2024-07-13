-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
-- vim.opt.colorcolumn = "80"
-- :checkhealth nvim_treesitter
-- Tab and indentation settings
vim.opt.tabstop =  8
vim.opt.colorcolumn = "80"
vim.opt.shiftwidth =  8
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smarttab = true

-- Python-specific settings
vim.cmd([[
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
]])

-- Syntax highlighting
vim.cmd('syntax enable')

-- File type detection and indentation
vim.cmd('filetype on')
vim.cmd('filetype indent on')

-- Line wrapping
vim.opt.wrap = true
