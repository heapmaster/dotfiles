return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<leader>cc]],
                direction = "float",
                float_opts = {
                    border = "curved",
                },
            })
            vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>:ToggleTerm<CR>", { noremap = true, silent = true })
        end,
    },
}
