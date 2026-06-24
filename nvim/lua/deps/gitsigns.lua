return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    vim.keymap.set("n", "]c", function()
                        if vim.wo.diff then return "]c" end
                        vim.schedule(function() gs.next_hunk() end)
                        return "<Ignore>"
                    end, { expr = true, buffer = bufnr, desc = "Next hunk" })

                    vim.keymap.set("n", "[c", function()
                        if vim.wo.diff then return "[c" end
                        vim.schedule(function() gs.prev_hunk() end)
                        return "<Ignore>"
                    end, { expr = true, buffer = bufnr, desc = "Prev hunk" })

                    local opts = { buffer = bufnr }
                    vim.keymap.set("n", "<leader>hs", gs.stage_hunk, vim.tbl_extend("force", opts, { desc = "Stage hunk" }))
                    vim.keymap.set("n", "<leader>hr", gs.reset_hunk, vim.tbl_extend("force", opts, { desc = "Reset hunk" }))
                    vim.keymap.set("n", "<leader>hp", gs.preview_hunk, vim.tbl_extend("force", opts, { desc = "Preview hunk" }))
                    vim.keymap.set("n", "<leader>hb", function() gs.blame_line({ full = true }) end, vim.tbl_extend("force", opts, { desc = "Blame line" }))
                end,
            })
        end,
    },
}
