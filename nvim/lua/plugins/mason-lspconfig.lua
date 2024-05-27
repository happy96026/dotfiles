return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp"
    }},
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = { "tsserver", "lua_ls" },
        }

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lsp_setup_table_by_name = {
            lua_ls = {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            }
        }

        require("mason-lspconfig").setup_handlers {
            function(server_name)
                if lsp_setup_table_by_name[server_name] ~= nil then
                    require("lspconfig").lua_ls.setup(lsp_setup_table_by_name[server_name])
                else
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end
            end,
        }
    end,
}

