return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local winbar_config = {
            lualine_a = {
                {
                    "filetype",
                    colored = false,
                    icon_only = true,
                    component_separators = { right = "" },
                },
                {
                    "filename",
                    path = 1,
                    padding = { left = 0, right = 1 },
                    file_status = true,
                    symbols = {
                        modified = "●",
                        readonly = "[-]",
                        unnamed = "[No Name]",
                        newfile = "[New]",
                    },
                },
            },
        }
        require("lualine").setup {
            options = {
                globalstatus = true,
            },
            sections = {
                lualine_c = {},
            },
            winbar = winbar_config,
            inactive_winbar = winbar_config,
        }
    end
}
