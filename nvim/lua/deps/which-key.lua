return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            local wk = require("which-key")
            wk.setup()
            wk.add({
                { "<leader>g", group = "goto / grep" },
                { "<leader>h", group = "git hunks" },
                { "<leader>v", group = "java test" },
                { "<leader>a", group = "avante (AI)" },
                { "<leader>c", group = "claude terminal" },
                { "<leader>f", group = "format" },
                { "<leader>fb", desc = "Toggle file tree" },
                { "<leader>ff", desc = "Find file in tree" },
            })
        end,
    },
}
