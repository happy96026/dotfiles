return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        tabline = {
            lualine_a = {
                {
                    "buffers",
                    show_modified_status = true,
                    mode = 4,
                }
            }
        }
    },
}

