require("bootstrap")
require("dep") {
    {
        "goolord/alpha-nvim",
        requires = { "nvim-tree/nvim-web-devicons" },
        function()
            require"alpha".setup(require"alpha.themes.startify".config)
        end
    },
    {
        "neovim/nvim-lspconfig"
    },
    modules = {
        prefix = "deps.",
        "java_config",
        "telescope",
        "treesitter",
        "nvim-cmp",
        "nvim-dap",
        "nvim-tree",
        "theme",
        "project",
        "fidget",
        "statusline",
        "which-key",
        "copilot"
    },
}
require("base")
require("lsp")
