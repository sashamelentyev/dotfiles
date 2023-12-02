-- trim whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.cmd([[
            keeppatterns %s/\s\+$//e
        ]])
    end,
    group = vim.api.nvim_create_augroup("TrimWhitespace", { clear = true }),
})
