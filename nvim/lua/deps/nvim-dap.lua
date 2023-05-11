return {
    {
        "mfussenegger/nvim-dap",
        function()
            require('dap.ext.vscode').load_launchjs()
            --local dap = require('dap')
            --dap.defaults.fallback.terminal_win_cmd = 'tabnew'
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        function()
            require('dapui').setup()
        end,
        requires = {
            "mfussenegger/nvim-dap",
        }
    }
}
