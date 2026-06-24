return {
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        version = false,
        build = "make",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
            {
                "MeanderingProgrammer/render-markdown.nvim",
                opts = { file_types = { "markdown", "Avante" } },
                ft = { "markdown", "Avante" },
            },
        },
        opts = {
            provider = "claude",
            providers = {
                claude = {
                    endpoint = "https://api.anthropic.com",
                    model = "claude-sonnet-4-6",
                    timeout = 30000,
                    temperature = 0,
                    max_tokens = 8096,
                },
            },
            mappings = {
                ask = "<leader>aa",
                edit = "<leader>ae",
                refresh = "<leader>ar",
            },
        },
    },
    { "stevearc/dressing.nvim", lazy = true },
    { "MunifTanjim/nui.nvim",   lazy = true },
}
