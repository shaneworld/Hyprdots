vim.api.nvim_set_hl(0, 'Normal', { bg = 'None' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'None' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'None' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'None' })
vim.api.nvim_set_hl(0, 'NonText', { bg = 'None' })
vim.api.nvim_set_hl(0, 'Conditional', { bg = 'None' })
vim.api.nvim_set_hl(0, 'Structure', { bg = 'None' })
vim.api.nvim_set_hl(0, 'String', { bg = 'None' })

-- seperater
vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'None' })

-- SignColumn bg
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.cmd.highlight('clear SignColumn')
    vim.api.nvim_set_hl(0, "Normal", {ctermbg = nil, guibg = nil})
  end
})
