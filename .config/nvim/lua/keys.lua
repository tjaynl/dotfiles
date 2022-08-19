--[[ keys.lua ]]
local map = vim.keymap.set

-- remap the key used to leave insert mode
map('i', 'jk', '', {})

-- My keybindings
map("n", "<Leader>v", "<cmd>CHADopen<cr>") -- open CHADtree
