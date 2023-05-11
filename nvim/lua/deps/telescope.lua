return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.1",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-treesitter/nvim-treesitter",
            'ahmedkhalf/project.nvim',
        },
        function()
            require('telescope').load_extension('ui-select')
            require('telescope').load_extension('projects')
            require('telescope').setup({
                defaults =  {
                    path_display = {
                        shorten = {
                            len = 3, exclude = {1, -1}
                        },
                        truncate = true
                    },
                    dynamic_preview_title = true
                }
            })
        end
    }
}
