return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        require("nvim-tree").setup {
            filters = {
                custom = { "^.git$" }
            },
            update_focused_file = {
                enable = true,
            }
        }

        vim.api.nvim_set_keymap("n", "<leader>tt", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
    end,
}
