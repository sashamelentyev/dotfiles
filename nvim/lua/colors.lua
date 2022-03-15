local highlight = function(group, fg, bg, attr, sp)
    fg = fg and "guifg=" .. fg or "guifg=NONE"
    bg = bg and "guibg=" .. bg or "guibg=NONE"
    attr = attr and "gui=" ..attr or "gui=NONE"
    sp = sp and "guisp=" .. sp or ""

    vim.api.nvim_command("highlight " .. group .. " ".. fg .. " " .. bg .. " ".. attr .. " " .. sp)
end

local COLORS = {
    grey = "#808080",
    red = "#FF6666"
}

highlight("Comment", COLORS.grey, nil, nil, nil)
highlight("Todo", COLORS.red, nil, "bold", nil)

highlight("LineNr", COLORS.grey, nil, nil, nil)
