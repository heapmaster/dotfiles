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

            local split_term = require("toggleterm.terminal").Terminal:new({
                direction = "horizontal",
                size = 15,
                hidden = true,
            })
            vim.keymap.set("n", "<leader>cs", function() split_term:toggle() end, { desc = "Toggle split terminal" })
        end,
    },
}
