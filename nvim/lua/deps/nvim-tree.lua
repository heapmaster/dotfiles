return {
    {
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons"
        },
        function()
            require("nvim-tree").setup({
                disable_netrw = true,
                view = {
                    width = "20%",
                --    float = {
                --        enable = true
                --    }
                },
                update_focused_file = {
                    enable = true,
                    update_root = true
                },
                diagnostics = {
                    enable = true,
                    show_on_dirs = true
                },
                filters = {
                    custom = {"^\\.git$"}
                }
            })
        end
    }
}
