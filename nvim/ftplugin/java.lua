local home = os.getenv('HOME')
local jdtls = require('jdtls')

local remap = require("utils").remap

local root_markers = {'gradlew', 'mvnw', '.git'}
local root_dir = require('jdtls.setup').find_root(root_markers)

local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local bundles = {
    vim.fn.glob(home .. "/tools/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/tools/vscode-java-test/server/*.jar", 1), "\n"))

local on_attach = function(client, bufnr)
    local buf_opts = { noremap=true, silent=true, buffer=bufnr }
    remap("n", "<leader>gD", vim.lsp.buf.declaration, buf_opts, "Go to declaration")
    remap("n", "<leader>gd", vim.lsp.buf.definition, buf_opts, "Go to definition")
    remap("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", buf_opts, "List references")
    remap("n", "<leader>vc", jdtls.test_class, buf_opts, "Test class")
    remap("n", "<leader>vm", jdtls.test_nearest_method, buf_opts, "Test method")
    remap("n", "<c-space>", vim.lsp.buf.code_action, buf_opts, "Code Actions")
    remap("n", "<C-k>", vim.lsp.buf.signature_help, buf_opts, "Show signature")
    jdtls.setup_dap({ hotcodereplace = 'auto', config_overrides = { vmArgs = '--add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.lang=ALL-UNNAMED' }})
end


local config = {
    flags = {
        debounce_text_changes = 80,
    },
    on_attach = on_attach,
    init_options = {
        bundles = bundles
    },
    root_dir = root_dir,
    capabilities = capabilities,

    settings = {
        java = {
            format = {
                settings = {
                },
            },
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' },
            completion = {
                favoriteStaticMembers = {
                },
                filteredTypes = {
                },
            },
            sources = {
                organizeImports = {
                },
            },
            codeGeneration = {
                toString = {
                },
                hashCodeEquals = {
                },
                useBlocks = true,
            },
            configuration = {
                runtimes = {
                    name = "JavaSE-17",
                    path = "/opt/homebrew/opt/openjdk@17/bin/java",
                },
            }
        }
    },
    cmd = {
        "/usr/bin/java",
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx4g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar', '/opt/homebrew/Cellar/jdtls/1.21.0/libexec/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
        '-configuration', '/opt/homebrew/Cellar/jdtls/1.21.0/libexec/config_mac',
        '-data', workspace_folder,
    },
}
jdtls.start_or_attach(config)
