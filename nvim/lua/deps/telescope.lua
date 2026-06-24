return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "ahmedkhalf/project.nvim",
        },
        config = function()
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("projects")
            require("telescope").setup({
                defaults = {
                    path_display = {
                        shorten = { len = 3, exclude = { 1, -1 } },
                        truncate = true,
                    },
                    dynamic_preview_title = true,
                },
            })
        end,
    },
    { "nvim-lua/plenary.nvim",                  lazy = true },
    { "nvim-telescope/telescope-ui-select.nvim", lazy = true },
}
