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
                { "<leader>c",  group = "terminal" },
                { "<leader>cc", desc = "Float terminal (toggle)" },
                { "<leader>cs", desc = "Split terminal (toggle)" },
                { "<leader>f", group = "format" },
                { "<leader>d",  group = "diagnostics" },
                { "<leader>dd", desc = "Show diagnostic at cursor" },
                { "<leader>de", desc = "List errors" },
                { "<leader>dw", desc = "List warnings" },
                { "<leader>di", desc = "List info" },
                { "<leader>fb", desc = "Toggle file tree" },
                { "<leader>ff", desc = "Find file in tree" },
            })
        end,
    },
}
