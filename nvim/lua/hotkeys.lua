local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = false}

keymap('', '<up>', ':echoe "Use K"<CR>', opts)
keymap('', '<down>', ':echoe "Use J"<CR>', opts)
keymap('', '<left>', ':echoe "Use H"<CR>', opts)
keymap('', '<right>', ':echoe "Use L"<CR>', opts)
