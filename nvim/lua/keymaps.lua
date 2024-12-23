local function size(table)
    local count = 0
    for _ in pairs(table) do
        count = count + 1
    end
    return count
end

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.write)
vim.keymap.set("n", "<leader>bd", function ()
    vim.cmd.bprev()

    local bufs = vim.iter(vim.api.nvim_list_bufs()):filter(function(buf)
        return vim.api.nvim_buf_get_option(buf, "buflisted")
    end):totable()
    local bufName

    if size(bufs) > 1 then
        bufName = "#"
    end

    local success, err = pcall(function() vim.cmd.bdelete(bufName) end)
    if not success then
        vim.cmd.bnext()
        error(err)
    end
end)
vim.keymap.set({ "n", "v" }, "<leader>gp", "\"+p")
vim.keymap.set({ "n", "v" }, "<leader>gy", "\"+y")
vim.keymap.set({ "n", "v" }, "<leader>bn", vim.cmd.bnext)
vim.keymap.set({ "n", "v" }, "<leader>bp", vim.cmd.bprev)

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', function()
            vim.lsp.buf.format({ async = true })
        end, opts)
        vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

        -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        -- vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        -- vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
    end
})
