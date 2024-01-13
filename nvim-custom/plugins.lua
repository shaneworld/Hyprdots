local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  {
    "ethanholz/nvim-lastplace",
    lazy = false,
    config = function()
      require'nvim-lastplace'.setup {
          lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
          lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
          lastplace_open_folds = true
      }
    end, -- Override to setup mason-lspconfig
  },

  {
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      ft = { "markdown" },
      build = function() vim.fn["mkdp#util#install"]() end,
    }
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

  {
    "img-paste-devs/img-paste.vim",
    lazy = true,
    keys = '<leader>P',
    config = function()
      vim.g.PasteImageFunction = 'g:MarkdownPasteImage'
      vim.keymap.set("n", "<leader>P", ":call mdip#MarkdownClipboardImage()<CR>", {})
    end,
  },

  {
    "dhruvasagar/vim-table-mode",
    lazy = true,
    ft = "markdown",
    config = function()
      vim.g.table_mode_corner = '|'
      vim.g.table_mode_disable_mappings = 1
      vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
        pattern = '*.md',
        command = 'silent TableModeEnable',
      })
    end,
  },
}
