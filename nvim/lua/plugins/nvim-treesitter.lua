return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {
                "bash",
                "c",
                "html",
                "javascript",
                "typescript",
                "json",
                "lua",
                "markdown",
                "python",
                "yaml",
            },
            sync_install = true,
            auto_install = true,
            highlight = {
                enable = true,
            }
        })
    end,
}

