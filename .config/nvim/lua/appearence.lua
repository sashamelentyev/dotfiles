local cmd = vim.cmd

local colors = require("colors")

local function bg(group, color)
    cmd("hi " .. group .. " guibg=" .. color)
end

local function fg(group, color)
    cmd("hi " .. group .. " guifg=" .. color)
end

bg("Normal", colors.black) -- backgroud
fg("Normal", colors.white)
fg("LineNr", colors.gray)
fg("Comment", colors.gray)
bg("Todo", colors.red)
fg("Statement", colors.yellow)
fg("Function", colors.yellow)
