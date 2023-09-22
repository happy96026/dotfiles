vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.write)
vim.keymap.set({"n", "v"}, "<leader>gp", "\"+p")
vim.keymap.set({"n", "v"}, "<leader>gy", "\"+y")

