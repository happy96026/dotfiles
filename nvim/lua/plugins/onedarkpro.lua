return {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
        local helper = require("onedarkpro.helpers")
        local hover_color = helper.lighten("bg", 10)

        require("onedarkpro").setup({
            highlights = {
                IlluminatedWordText = { bg = hover_color },
                IlluminatedWordRead = { bg = hover_color },
                IlluminatedWordWrite = { bg = hover_color },
                ["@punctuation.special"] = { fg = "${purple}" },
                ["@punctuation.bracket.typescript"] = { fg = "${white}" },
                ["@function.builtin"] = { fg = "${blue}" },
                ["@parameter"] = { fg = "${yellow}" },
                ["@lsp.type.variable.typescript"] = { fg = "${white}" },
                ["@lsp.typemod.variable.readonly.typescript"] = { link = "@lsp.type.variable.typescript" },
                ["@lsp.typemod.property.readonly.typescript"] = { link = "@property" },
                ["@lsp.typemod.property.defaultLibrary.typescript"] = { link = "@property" },
                -- ["@lsp.typemod.parameter.declaration.typescript"] = { fg = "${yellow}" },
                -- ["@punctuation.typescript"] = { fg = "${red}" },
                -- ["@type.typescript"] = { fg = "${red}" },
            }
        })
        vim.cmd("colorscheme onedark")
    end
}
