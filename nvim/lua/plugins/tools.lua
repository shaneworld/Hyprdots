return {
  {
    'windwp/nvim-autopairs',
    lazy = true,
    event = 'InsertEnter',
    opts = {}
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  {
    "lervag/vimtex",
    ft = 'tex',
    config = function ()
        vim.g.vimtex_view_general_viewer = 'zathura'
        vim.g['vimtex_view_method'] = 'zathura'
        vim.g['vimtex_quickfix_mode'] = 0
        vim.g['vimtex_log_ignore'] = ({
          'Underfull',
          'Overfull',
          'specifier changed to',
          'Token not allowed in a PDF string',
        })
        vim.g.vimtex_compiler_latexmk_engines = {
            _ = '-xelatex'
        }
        vim.g.tex_comment_nospell = 1
        vim.g.vimtex_compiler_progname = 'nvr'
    end,
  },

  { "nvim-tree/nvim-web-devicons", lazy = true },

  { "nvim-lua/plenary.nvim", lazy = true },

  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
    event = { 'BufRead', 'BufNewFile' },
    config = function()
      require('gitsigns').setup {
        signs = {
          add          = { text = '┃' },
          change       = { text = '┃' },
          delete       = { text = '_' },
          topdelete    = { text = '▔' },
          changedelete = { text = '┃' },
          untracked    = { text = '┃' },
        },
      }
      vim.keymap.set('n', 'g[', '<cmd>silent lua require"gitsigns".prev_hunk()<CR>', { silent = true })
      vim.keymap.set('n', 'g]', '<cmd>silent lua require"gitsigns".next_hunk()<CR>', { silent = true })
      vim.keymap.set('n', '<leader>H', '<cmd>lua require"gitsigns".preview_hunk_inline()<CR>', { silent = true })
      vim.keymap.set('n', '<leader>gd', '<cmd>lua require"gitsigns".diffthis("~")<CR>', { silent = true })
      vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = '#b8bb26', bg = 'None' })
      vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = '#8ec07c', bg = 'None' })
      vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = '#fb4934', bg = 'None' })
    end
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require('plugins.config.neotree')
    end,
  },

  {
    'echasnovski/mini.comment',
    lazy = true,
    keys = { 'V', '<leader>/' },
    opts = {
      mappings = {
        comment_line = '<leader>/',
        comment_visual = '<leader>/',
      }
    },
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },

  {
    'NvChad/nvim-colorizer.lua',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      filetypes = { '*' },
      user_default_options = {
        RGB = true,           -- #RGB hex codes
        RRGGBB = true,        -- #RRGGBB hex codes
        names = false,        -- 'Name' codes like Blue or blue
        RRGGBBAA = true,      -- #RRGGBBAA hex codes
        AARRGGBB = true,      -- 0xAARRGGBB hex codes
        rgb_fn = false,       -- CSS rgb() and rgba() functions
        hsl_fn = false,       -- CSS hsl() and hsla() functions
        css = true,           -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,        -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = 'virtualtext', -- Set the display mode.
        -- Available methods are false / true / "normal" / "lsp" / "both"
        -- True is same as normal
        tailwind = true,
        sass = { enable = false },
        virtualtext = '■',
      },
      -- all the sub-options of filetypes apply to buftypes
      buftypes = {},
    }
  },

  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    keys = '<leader>f',
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
    },
    config = function()
      require('telescope').setup({
        defaults = {
          prompt_prefix = ' ',
          selection_caret = ' ',
          layout_config = {
            horizontal = { prompt_position = 'bottom', results_width = 0.6 },
            vertical = { mirror = false },
          },
          sorting_strategy = 'ascending',
          file_previewer = require('telescope.previewers').vim_buffer_cat.new,
          grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
          qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        },
        extensions = {
          fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
          },
        },
      })
      require('telescope').load_extension('fzy_native')
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fy', builtin.registers, {})
    end
  },

}
