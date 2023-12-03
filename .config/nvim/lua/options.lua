local options = {
    number = true,
    relativenumber = false,
    ruler = true,
    termguicolors = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end
