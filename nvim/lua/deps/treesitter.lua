return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash", "c", "cmake", "cpp", "dockerfile",
                    "gitattributes", "gitignore", "go", "html", "http",
                    "java", "javascript", "jsdoc", "json", "json5",
                    "latex", "lua", "make", "markdown", "perl", "php",
                    "python", "r", "regex", "ruby", "rust", "sql",
                    "toml", "typescript", "vim", "yaml",
                },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    },
}
