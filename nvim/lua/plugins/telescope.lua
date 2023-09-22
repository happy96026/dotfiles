return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    dependencies = { { "nvim-lua/plenary.nvim" } },
    config = function() 
        local builtin = require("telescope.builtin")
        vim.keymap.set({"n", "v"}, "<leader>ff", builtin.find_files, {})
        vim.keymap.set({"n", "v"}, "<C-p>", builtin.git_files, {})
        vim.keymap.set({"n", "v"}, "<leader>gs", builtin.grep_string, {})
        vim.keymap.set({"n", "v"}, "<leader>lg", builtin.live_grep, {})
    end,
}

