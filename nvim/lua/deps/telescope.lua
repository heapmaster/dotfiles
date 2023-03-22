return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.1",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-treesitter/nvim-treesitter"
        },
        function()
            require('telescope').load_extension('ui-select')
        end
    }
}
