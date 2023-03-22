-- vim.o.comptible = false
-- vim.o.hidden = true
-- vim.o.history = 10000
-- vim.o.wildmenu = true
-- vim.o.ruler = true
-- vim.o.showcmd = true
-- vim.o.hlsearch = true
-- vim.o.autoindent = true
-- vim.o.laststatus = 2
-- vim.o.incsearch = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.scrolloff = 3

vim.o.backspace = "indent,eol,start"

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

vim.o.showmatch = true

vim.o.wildmode = "longest,list"

vim.o.cmdheight = 2

vim.o.number = true
vim.o.numberwidth = 5

vim.g.mapleader = ","

vim.keymap.set("n", "<cr>", "<cmd>nohlsearch<cr><cr>")

vim.keymap.set("c", "%%", "<C-R>=expand('%:h').'/'<CR>")
vim.keymap.set("n", "<leader>e", ":edit %%", { remap = true })

vim.keymap.set("n", "<leader><leader>", "<c-^>")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-l>", "<c-w>l")

vim.keymap.set("n", "<leader>t", "<cmd>lua require('telescope.builtin').find_files({cwd = require('telescope.utils').buffer_dir()})<cr>")
vim.keymap.set("n", "<leader>o", "<cmd>:only<cr>")
