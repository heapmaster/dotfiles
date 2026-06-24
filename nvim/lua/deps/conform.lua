return {
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    python     = { "black" },
                    javascript = { "prettier" },
                    typescript = { "prettier" },
                    javascriptreact = { "prettier" },
                    typescriptreact = { "prettier" },
                    json       = { "prettier" },
                    html       = { "prettier" },
                    css        = { "prettier" },
                },
                format_on_save = {
                    timeout_ms = 3000,
                    lsp_fallback = false,
                },
            })
            vim.keymap.set({ "n", "v" }, "<leader>f", function()
                require("conform").format({ async = true, lsp_fallback = true })
            end, { desc = "Format buffer" })
        end,
    },
}
