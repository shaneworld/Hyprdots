vim.opt.termguicolors = true
vim.opt.ttyfast = true
-- Set clipboard
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = false
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmode = false
vim.opt.virtualedit = 'block'
vim.opt.conceallevel = 0
vim.opt.showtabline = 0
vim.opt.laststatus = 3
vim.opt.signcolumn = 'yes'
vim.opt.spelloptions = 'camel'
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99
vim.opt.list = true
vim.opt.scrolloff = 8
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.redrawtime = 1500
-- vim.opt.colorcolumn = "100"
vim.opt.timeoutlen = 200
-- set leader key
vim.g.mapleader = ' '

-- restore cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local pos = vim.fn.getpos("'\"")
    if pos[2] > 0 and pos[2] <= vim.fn.line('$') then
      vim.api.nvim_win_set_cursor(0, { pos[2], pos[3] - 1 })
    end
  end
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile', 'FileType' }, {
  pattern = { 'c', 'cpp', 'txt', 'c.snippets', 'cpp.snippets' },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, { pattern = { '*.md', '*.txt' }, command = 'setlocal wrap', })

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
  end
})

