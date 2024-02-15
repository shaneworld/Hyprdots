local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#CC',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#FABD2F',
  red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

-- ins_left {
--   function()
--     return '▊'
--   end,
--   color = { fg = 'D65D0E' },
--   padding = { right = 1 },
-- }

ins_left {
  -- mode component
  'mode',
  color = { fg = '#282828', bg = '#B8BB26', gui = 'bold'},
  separator = { right = '' }
}

ins_left {
  -- filesize component
  function()
    local icon = " 󰈢 "
    local filename = (vim.fn.expand "%" == "" and "Empty ") or vim.fn.expand "%:t"

    if filename ~= "Empty " then
      ---@type boolean ,{get_icon: fun(string) : string}
      local devicons_present, devicons = pcall(require, "nvim-web-devicons")

      if devicons_present then
        local ft_icon = devicons.get_icon(filename)
        icon = (ft_icon ~= nil and " " .. ft_icon) or ""
      end

      filename = " " .. filename .. " "
    end

    return icon .. filename
  end,
  color = { fg = '#83A598', bg = 'None', gui = 'bold' },
  -- separator = { right = '' }
}

ins_left {
  -- git
  function()
    ---@diagnostic disable-next-line: undefined-field
    if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then return "" end

    ---@diagnostic disable-next-line: undefined-field
    return "  " .. vim.b.gitsigns_status_dict.head .. "  "
  end,
  color = { fg = '#D3869B', bg = 'None', gui = 'bold' },
  -- separator = { right = '' }
}

ins_left {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = ' ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
  color = { bg = 'None', gui = 'bold' },
  -- separator = { right = '' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

ins_right {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { bg = 'None', fg = '#D79921', gui = 'bold' },
  -- separator = { left = '' },
}

-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { bg = 'None', fg = '#B16286',  gui = 'bold' },
  -- separator = { left = '' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { bg = '#689D6A', fg = '#282828', gui = 'bold' },
  separator = { left = '' },
}

-- ins_right {
--   function()
--     return '▊'
--   end,
--   color = { fg = '#D65D0E' },
--   padding = { left = 1 },
-- }

-- Now don't forget to initialize lualine
lualine.setup(config)
