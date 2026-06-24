return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                -- auto-install servers on macOS; on HPC servers must be in PATH
                ensure_installed = vim.fn.has("mac") == 1
                    and { "pyright", "ts_ls", "jdtls" }
                    or {},
                automatic_installation = false,
            })
        end,
    },
    { "neovim/nvim-lspconfig" },
    { "mfussenegger/nvim-jdtls" },
}
