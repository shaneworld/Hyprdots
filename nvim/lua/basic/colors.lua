vim.api.nvim_set_hl(0, 'Normal', { bg = 'None' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'None' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'None' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'None' })

-- seperater
vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'None' })
vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'None' })

-- SignColumn bg
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function() vim.cmd.highlight('clear SignColumn') end
})
