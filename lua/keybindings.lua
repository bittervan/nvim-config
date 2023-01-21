-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

map("n", "<A-v>", ":vsp<CR>", opt)
map("n", "<A-c>", ":sp<CR>", opt)

map("n", "<A-w>", "<C-w>c", opt)
-- map("n", "<A-z>", "<C-w>o", opt)

map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- map("n", "<C-t>", ":sp | terminal<CR>", opt)

map("v", ">", ">gv", opt)
map("v", "<", "<gv", opt)
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

map("n", ",", "5k", opt)
map("n", ".", "5j", opt)
