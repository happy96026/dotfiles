return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "bash",
                "c",
                "dockerfile",
                "html",
                "javascript",
                "typescript",
                "jsdoc",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "yaml",
                "vim",
                "regex",
            },
            sync_install = true,
            auto_install = true,
            highlight = {
                enable = true,
                -- additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
        }
    end,
}

