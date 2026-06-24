local M = {}

function M.remap(mode, lhs, rhs, opts, desc)
    if opts == nil then
        opts = {}
    end
    opts.desc = desc
    vim.keymap.set(mode, lhs, rhs, opts)
end

return M
