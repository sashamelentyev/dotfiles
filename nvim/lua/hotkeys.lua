local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = false}

keymap('', '<up>', ':echoe "Используй клавишу K"<CR>', opts)
keymap('', '<down>', ':echoe "Используй клавишу J"<CR>', opts)
keymap('', '<left>', ':echoe "Используй клавишу H"<CR>', opts)
keymap('', '<right>', ':echoe "Используй клавишу L"<CR>', opts)
