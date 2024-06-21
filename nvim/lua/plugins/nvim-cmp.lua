return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "nvim-lua/plenary.nvim",
        "windwp/nvim-autopairs",
    },
    config = function()
        local cmp = require("cmp")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")

        local cmp_kinds = {
            Text = '',
            Method = '',
            Function = '',
            Constructor = '',
            Field = '',
            Variable = '',
            Class = '',
            Interface = '',
            Module = '',
            Property = '',
            Unit = '',
            Value = '',
            Enum = '',
            Keyword = '',
            Snippet = '',
            Color = '',
            File = '',
            Reference = '',
            Folder = '',
            EnumMember = '',
            Constant = '',
            Struct = '',
            Event = '',
            Operator = '',
            TypeParameter = '',
        }
        local cmdline_mapping = {
            ["<C-p>"] = {
                c = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
            },
            ["<C-n>"] = {
                c = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select }
            },
            ["<C-e>"] = {
                c = cmp.mapping.abort()
            },
            ["<tab>"] = {
                c = cmp.mapping.confirm({ select = false }) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            },
        }

        cmp.setup {
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
                ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<tab>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            completion = {
                completeopt = "menu,menuone,noinsert"
            },
            sources = cmp.config.sources(
                {
                    { name = "nvim_lsp" },
                },
                {
                    { name = "buffer" },
                }
            ),
            formatting = {
                expandable_indicator = false,
                fields = { "kind", "abbr", "menu" },
                format = function(_, vim_item)
                    vim_item.kind = cmp_kinds[vim_item.kind] or ""
                    return vim_item
                end,
            },
            experimental = {
                ghost_text = true
            }
        }

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(cmdline_mapping),
            sources = {
                { name = "buffer" },
            }
        })

        -- Use cmdline & path source for ":" (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(cmdline_mapping),
            sources = cmp.config.sources(
                { { name = "path" } },
                { { name = "cmdline" } }
            ),
            matching = { disallow_symbol_nonprefix_matching = false }
        })

        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
}
