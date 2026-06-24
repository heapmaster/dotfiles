-- Resolve JDTLS home: env var > mason install > skip
local jdtls_home = os.getenv("JDTLS_HOME") or (function()
    local mason_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
    return vim.loop.fs_stat(mason_path) and mason_path or nil
end)()

if not jdtls_home then return end

local ok, jdtls = pcall(require, "jdtls")
if not ok then return end

local remap = require("utils").remap
local home = os.getenv("HOME")

local root_markers = { "gradlew", "mvnw", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if not root_dir then return end

local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local capabilities = vim.lsp.protocol.make_client_capabilities()
local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
    capabilities = cmp_lsp.default_capabilities(capabilities)
end

-- Resolve java binary: JAVA_HOME env > system java
local java_home = os.getenv("JAVA_HOME")
local java_bin = (java_home and (java_home .. "/bin/java")) or "java"
if vim.fn.executable(java_bin) ~= 1 then return end

-- Resolve launcher jar and platform config dir
local launcher_jar = vim.fn.glob(jdtls_home .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local sysname = vim.loop.os_uname().sysname
local config_dir = jdtls_home .. (sysname == "Darwin" and "/config_mac" or "/config_linux")

-- Lombok agent is optional; skip gracefully if not present
local lombok_jar = os.getenv("LOMBOK_JAR") or (function()
    local hits = vim.fn.glob(home .. "/.m2/repository/org/projectlombok/lombok/*/lombok-*.jar", false, true)
    return hits[#hits]
end)()

local cmd = {
    java_bin,
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx4g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens", "java.base/java.util=ALL-UNNAMED",
    "--add-opens", "java.base/java.lang=ALL-UNNAMED",
    "-jar", launcher_jar,
    "-configuration", config_dir,
    "-data", workspace_folder,
}

if vim.loop.fs_stat(lombok_jar) then
    table.insert(cmd, 2, "-javaagent:" .. lombok_jar)
end

local on_attach = function(_, bufnr)
    local buf_opts = { noremap = true, silent = true, buffer = bufnr }
    remap("n", "<leader>gD", vim.lsp.buf.declaration,             buf_opts, "Go to declaration")
    remap("n", "<leader>gd", vim.lsp.buf.definition,              buf_opts, "Go to definition")
    remap("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", buf_opts, "List references")
    remap("n", "<c-space>",  vim.lsp.buf.code_action,             buf_opts, "Code actions")
    remap("n", "<leader>k",  vim.lsp.buf.signature_help,          buf_opts, "Signature help")
    remap("n", "<leader>vc", jdtls.test_class,                    buf_opts, "Test class")
    remap("n", "<leader>vm", jdtls.test_nearest_method,           buf_opts, "Test method")
end

jdtls.start_or_attach({
    flags = { debounce_text_changes = 80 },
    on_attach = on_attach,
    root_dir = root_dir,
    capabilities = capabilities,
    settings = {
        java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
            codeGeneration = {
                toString = {},
                hashCodeEquals = {},
                useBlocks = true,
            },
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-17",
                        path = java_home or "/usr/lib/jvm/java-17",
                    },
                },
            },
        },
    },
    cmd = cmd,
})
