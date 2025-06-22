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
            }
        })
        vim.cmd("colorscheme onedark")
    end
}
