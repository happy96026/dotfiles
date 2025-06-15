return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local config_by_name = {
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
                root_markers = { "package.json", "tsconfig.json" },
                workspace_required = true,
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
            denols = {
                root_markers = { "deno.json", "deno.jsonc" },
                workspace_required = true,
            },
        }

        for name, config in pairs(config_by_name) do
            config.capabilities = capabilities
            vim.lsp.config(name, config)
        end

        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = {
                "ts_ls",
                "denols",
                "dockerls",
                "lua_ls",
            },
        }
    end,
}

