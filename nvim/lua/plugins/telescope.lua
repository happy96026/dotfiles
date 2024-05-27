return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = function() 
        local builtin = require("telescope.builtin")
        vim.keymap.set({"n", "v"}, "<C-p>", builtin.find_files, {})
        vim.keymap.set({"n", "v"}, "<leader>fg", builtin.live_grep, {})
        vim.keymap.set({"n", "v"}, "<leader>ff", builtin.git_files, {})
        vim.keymap.set({"n", "v"}, "<leader>fs", builtin.grep_string, {})
        vim.keymap.set({"n", "v"}, "<leader>fb", builtin.buffers, {})
    end,
}

