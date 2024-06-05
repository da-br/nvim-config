vim.g.mapleader = " "

local map = vim.keymap.set

map({ "n", "v" }, "<leader>D", '"_D', { remap = false })
map({ "n", "v" }, "<leader>d", '"_d', { remap = false })

-- nice replace keybind
map("v", "r", '"_dP', { remap = false })


-- move stuff 
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- golang error handling 
vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)
