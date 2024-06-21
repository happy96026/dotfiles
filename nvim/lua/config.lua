vim.opt.number = true
vim.opt.rnu = true
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.cmdheight = 1
vim.opt.pumheight = 15
vim.opt.scrolloff = 8
vim.opt.hlsearch = false
vim.opt.colorcolumn = "120"
vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "yes:2"
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.smartindent = true

vim.opt.backupdir = "/tmp//"
vim.opt.backup = true
vim.opt.directory = "/tmp//"
vim.opt.swapfile = true
vim.opt.undodir = "/tmp//"
vim.opt.undofile = true

if os.getenv("WSL_DISTRO_NAME") ~= nil then
    vim.g.clipboard = {
        name = "win32yank.exe",
        copy = {
            ["+"] = "win32yank.exe -i --crlf",
            ["*"] = "win32yank.exe -i --crlf",
        },
        paste = {
            ["+"] = "win32yank.exe -o --lf",
            ["*"] = "win32yank.exe -o --lf",
        },
        cache_enabled = false,
    }
end

vim.diagnostic.config {
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
        }
    },
    severity_sort = true,
    virtual_text = false,
    underline = true,
}
