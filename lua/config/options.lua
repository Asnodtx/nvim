local keymap = vim.keymap
local opt = vim.opt

opt.autoindent = true 
opt.encoding = "utf-8"
opt.mouse = ""
opt.number = true
opt.relativenumber = true
opt.nu = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
keymap.set("n", "<C-h>", "<C-w>h", {})
keymap.set("n", "<C-l>", "<C-w>l", {})


-- Turn the word under cursor to upper case
keymap.set("i", "<c-u>", "<Esc>viwUea")

-- Turn the current word into title case
keymap.set("i", "<c-t>", "<Esc>b~lea")

-- Paste non-linewise text above or below current line, see https://stackoverflow.com/a/1346777/6064933
keymap.set("n", "<leader>p", "m`o<ESC>p``", { desc = "paste below current line" })
keymap.set("n", "<leader>P", "m`O<ESC>p``", { desc = "paste above current line" })

-- Shortcut for faster save and quit  
keymap.set("n", "<leader>w", "<cmd>update<cr>")

-- Saves the file if modified and quit
keymap.set("n", "<leader>q", "<cmd>x<cr>")

-- Quit all opened buffers
keymap.set("n", "<leader>Q", "<cmd>qa!<cr>")

keymap.set("x", "<", "<gv")

keymap.set("x", ">", ">gv")

keymap.set({ "n", "x" }, "L", "g_")

keymap.set("n", "<C-d>", "<C-d>zz")

keymap.set("n", "<C-u>", "<C-u>zz")


