local cmd = vim.cmd

local function bg(group, color)
    cmd("hi " .. group .. " guibg=" .. color)
end

local function fg(group, color)
    cmd("hi " .. group .. " guifg=" .. color)
end

local colors = require("colors")

bg("Normal", colors.black) -- backgroud
fg("Normal", colors.white) -- foreground
fg("LineNr", colors.gray)
fg("Comment", colors.gray)
bg("Todo", colors.red)
fg("Statement", colors.yellow)
fg("Function", colors.yellow)
fg("Constant", colors.red)
fg("String", colors.green)
fg("Conditional", colors.yellow)
fg("Repeat", colors.yellow)
bg("Label", colors.red)
bg("Operator", colors.red)
fg("Keyword", colors.yellow)
bg("Exception", colors.red)
fg("Type", colors.yellow)

