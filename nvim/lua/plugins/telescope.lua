return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
        local builtin = require("telescope.builtin")
        local telescope = require("telescope")

        vim.keymap.set({ "n", "v" }, "<C-p>", builtin.find_files, {})
        vim.keymap.set({ "n", "v" }, "<C-O>", builtin.lsp_document_symbols, {})
        vim.keymap.set({ "n", "v" }, "<leader>fg", builtin.live_grep, {})
        vim.keymap.set({ "n", "v" }, "<leader>ff", builtin.git_files, {})
        vim.keymap.set({ "n", "v" }, "<leader>fs", builtin.grep_string, {})
        vim.keymap.set({ "n", "v" }, "<leader>fb", builtin.buffers, {})
        vim.keymap.set({ "n", "v" }, "<leader>ws", builtin.lsp_workspace_symbols, {})
        vim.keymap.set({ "n", "v" }, "<leader>gs", builtin.git_status, {})
        vim.keymap.set("n", "gi", builtin.lsp_implementations, {})
        vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
        vim.keymap.set("n", "gD", builtin.lsp_type_definitions, {})
        vim.keymap.set("n", "gr", builtin.lsp_references, {})
        vim.keymap.set("n", "gl", builtin.diagnostics, {})

        telescope.setup {
            defaults = {
                hidden = true,
                file_ignore_patterns = { "%.git/" }
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {}
                }
            },
            pickers = {
                find_files = {
                    hidden = true,
                },
                grep_string = {
                    additional_args = { "--hidden" }
                },
                live_grep = {
                    additional_args = { "--hidden" }
                },
            },
        }
        telescope.load_extension("ui-select")
        telescope.load_extension("noice")
    end,
}
