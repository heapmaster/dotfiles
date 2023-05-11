return {
    {
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons'
        },
        function()
            require('lualine').setup()
        end
    }
}
