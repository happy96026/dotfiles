return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("lualine").setup {
            sections = {
                lualine_c = {
                    {
                        "filename",
                        path = 1,
                    }
                },
            },
            inactive_sections = {
                lualine_c = {
                    {
                        "filename",
                        path = 1,
                    }
                },
            },
            tabline = {
                lualine_a = {
                    {
                        "buffers",
                        show_modified_status = true,
                        mode = 4,
                    }
                }
            }
        }
    end
}
