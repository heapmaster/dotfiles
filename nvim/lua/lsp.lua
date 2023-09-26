local remap = require("utils").remap

local on_attach = function(_, buffer)
    local buf_opts = { noremap=true, silent=true, buffer=bufnr }
    remap("n", "<leader>gD", vim.lsp.buf.declaration, buf_opts, "Go to declaration")
    remap("n", "<leader>gd", vim.lsp.buf.definition, buf_opts, "Go to definition")
    remap("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", buf_opts, "List references")
    remap("n", "<c-space>", vim.lsp.buf.code_action, buf_opts, "Code Actions")
    remap("n", "<C-k>", vim.lsp.buf.signature_help, buf_opts, "Show signature")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require('lspconfig')
lspconfig['pyright'].setup {
    on_attach = on_attach,
    capabilities = capabilities
}
