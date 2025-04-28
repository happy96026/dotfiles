return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = {
                "dockerls",
                "eslint",
                "lua_ls",
                "ts_ls",
            },
        }

        local lsp_setup_table_by_name = {
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            },
            ts_ls = {
                init_options = {
                    preferences = {
                        importModuleSpecifierPreference = "non-relative",
                    },
                },
                settings = {
                    typescript = {
                        format = {
                            semicolons = "remove",
                        },
                    },
                },
            },
        }

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("mason-lspconfig").setup_handlers {
            function(server_name)
                local lsp_setup_table = lsp_setup_table_by_name[server_name]
                if lsp_setup_table == nil then
                    lsp_setup_table = {}
                end
                lsp_setup_table.capabilities = capabilities

                require("lspconfig")[server_name].setup(lsp_setup_table)
            end,
        }
    end,
}

