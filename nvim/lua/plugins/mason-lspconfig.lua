return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp"
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
            capabilities = capabilities,
        })
        vim.lsp.config("ts_ls", {
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
            capabilities = capabilities,
        })

        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = {
                "dockerls",
                "eslint",
                "lua_ls",
                "ts_ls",
            },
        }
    end,
}

