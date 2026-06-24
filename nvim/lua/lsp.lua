local remap = require("utils").remap

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local buf_opts = { noremap = true, silent = true, buffer = args.buf }
        remap("n", "<leader>gD", vim.lsp.buf.declaration,             buf_opts, "Go to declaration")
        remap("n", "<leader>gd", vim.lsp.buf.definition,              buf_opts, "Go to definition")
        remap("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", buf_opts, "List references")
        remap("n", "<c-space>",  vim.lsp.buf.code_action,             buf_opts, "Code actions")
        remap("n", "<leader>k",  vim.lsp.buf.signature_help,          buf_opts, "Signature help")
    end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok then
    capabilities = cmp_lsp.default_capabilities(capabilities)
end

vim.lsp.config("*", { capabilities = capabilities })

local function enable_if_present(name, binary)
    if vim.fn.executable(binary) == 1 then
        vim.lsp.enable(name)
    end
end

enable_if_present("pyright", "pyright")
enable_if_present("ts_ls",   "typescript-language-server")
