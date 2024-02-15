vim.cmd [[highlight Headline1 guibg=#1e2718]]
vim.cmd [[highlight Headline2 guibg=#21262d]]

require("headlines").setup {
    org = {
        headline_highlights = { "Headline1", "Headline2" },
    },
}
