require("bootstrap")

-- Leader must be set before lazy.nvim initializes plugins
vim.g.mapleader = ","
vim.g.maplocalleader = ","

require("lazy").setup({ { import = "deps" } }, {
    install = { colorscheme = { "tokyonight" } },
    checker = { enabled = false },
})

require("base")
require("lsp")
