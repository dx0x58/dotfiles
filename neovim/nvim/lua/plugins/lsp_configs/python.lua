local M = {}

function M.Load(lspconfig)
    lspconfig.pylsp.setup {
        filetypes = { "py" },
        settings = {
            pylsp = {
                plugins = {
                    pycodestyle = {
                        ignore = { 'E302' },
                        maxLineLength = 100
                    }
                }
            }
        },
    }
end

return M
