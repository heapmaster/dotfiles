return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            vim.cmd("TSUpdate")
        end,
        function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "bash", "c", "cmake", "cpp", "dockerfile", "gitattributes", "gitignore", "go", "html", "http", "java", "javascript", "jsdoc", "json", "json5", "latex", "lua", "make", "markdown", "perl", "php", "python", "r", "regex", "ruby", "rust", "sql", "toml", "vim", "yaml" },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end,
    }
}
