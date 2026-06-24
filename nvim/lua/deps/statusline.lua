return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                sections = {
                    lualine_x = {
                        {
                            "diagnostics",
                            sources = { "nvim_workspace_diagnostic" },
                            symbols = { error = "E:", warn = "W:", info = "I:" },
                        },
                        "encoding",
                        "fileformat",
                        "filetype",
                    },
                },
            })
        end,
    },
}
