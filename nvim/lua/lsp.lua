local remap = require("utils").remap

local on_attach = function(_, buffer)
    local buf_opts = { noremap = true, silent = true, buffer = buffer }
    remap("n", "<leader>gD", vim.lsp.buf.declaration,             buf_opts, "Go to declaration")
    remap("n", "<leader>gd", vim.lsp.buf.definition,              buf_opts, "Go to definition")
    remap("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", buf_opts, "List references")
    remap("n", "<c-space>",  vim.lsp.buf.code_action,             buf_opts, "Code actions")
    remap("n", "<leader>k",  vim.lsp.buf.signature_help,          buf_opts, "Signature help")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
    capabilities = cmp_lsp.default_capabilities(capabilities)
end

local lspconfig = require("lspconfig")

local function setup_server(name, binary, config)
    if vim.fn.executable(binary) == 1 then
        lspconfig[name].setup(config)
    end
end

local base_config = { on_attach = on_attach, capabilities = capabilities }

setup_server("pyright",  "pyright",                      base_config)
setup_server("ts_ls",    "typescript-language-server",   base_config)
