local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- normal mode
map('n', 'H', '0', opts)
map('n', 'L', '$', opts)
map('n', 'J', '5j', opts)
map('n', 'K', '5k', opts)
map('n', ';', ':', opts)
map('n', '<ESC>', ':nohl<cr>', opts)
map('n', '<TAB>', ':BufferLineCycleNext<cr>', opts)
map('n', '<S-TAB>', ':BufferLineCyclePrev<cr>', opts)
map('n', '<leader>x', ':bd<cr>', opts)
map('n', '<C-N>', ':NvimTreeToggle<cr>', opts)
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<leader>t', ':TodoTelescope<cr>', opts)

-- diagnostic setloclist
map("n", "<Leader>q", function()
  vim.diagnostic.setloclist({ open = true }) -- don't open and focus
  local window = vim.api.nvim_get_current_win()
  vim.cmd.lwindow() -- open+focus loclist if has entries, else close -- this is the magic toggle command
  vim.api.nvim_set_current_win(window) -- restore focus to window you were editing (delete this if you want to stay in loclist)
end, { buffer = bufnr })

-- insert mode
map('i', 'jj', '<ESC>', opts)

-- visual mode
map('v', 'H', '0', opts)
map('v', 'L', '$', opts)
map('v', 'J', '5j', opts)
map('v', 'K', '5k', opts)
map('v', '>', '>gv', opts)
map('v', '<', '<gv', opts)
