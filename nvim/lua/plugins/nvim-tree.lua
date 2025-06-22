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
        local api = require("nvim-tree.api")

        vim.keymap.set("n", "<leader>tt", api.tree.toggle, { silent = true, noremap = true })
        vim.keymap.set("n", "<leader>tf", api.tree.open, { silent = true, noremap = true })
    end,
}
