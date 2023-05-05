local M = {}

function M.Load(lspconfig)
    lspconfig.ruby_ls.setup({
        cmd = { "bundle", "exec", "ruby-lsp" }
    })
end

return M
