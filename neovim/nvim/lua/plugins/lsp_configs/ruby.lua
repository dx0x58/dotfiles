local M = {}

function M.Load(lspconfig)

    -- lspconfig.ruby_ls.setup({
    --     on_attach = function(client, buffer)
    --         -- in the case you have an existing `on_attach` function
    --         -- with mappings you share with other lsp clients configs
    --         pcall(vim.lsp.on_attach, client, buffer)
    --         local diagnostic_handler = function()
    --             local params = vim.lsp.util.make_text_document_params(buffer)
    --             client.request(
    --                 'textDocument/diagnostic',
    --                 { textDocument = params },
    --                 function(err, result)
    --                     if err then
    --                         local err_msg = string.format("ruby-lsp - diagnostics error - %s", vim.inspect(err))
    --                         vim.lsp.log.error(err_msg)
    --                     end
    --                     if not result then return end
    --                     vim.lsp.diagnostic.on_publish_diagnostics(
    --                         nil,
    --                         vim.tbl_extend('keep', params, { diagnostics = result.items }),
    --                         { client_id = client.id }
    --                     )
    --                 end
    --             )
    --         end
    --         diagnostic_handler()     -- to request diagnostics when attaching the client to the buffer
    --         local ruby_group = vim.api.nvim_create_augroup('ruby_ls', { clear = false })
    --         vim.api.nvim_create_autocmd(
    --             { 'BufEnter', 'BufWritePre', 'InsertLeave', 'TextChanged' },
    --             {
    --                 buffer = buffer,
    --                 callback = diagnostic_handler,
    --                 group = ruby_group,
    --             }
    --         )
    --     end,
    --     cmd = { "ruby-lsp" },
    --     init_options = {
    --         enabledFeatures = {
    --             "documentSymbols",
    --             "documentLink",
    --             "hover",
    --             "foldingRange",
    --             "semanticHighlighting",
    --             "formatting",
    --             "onTypeFormatting",
    --             "diagnostics",
    --             "codeActions",
    --             "codeActionResolve",
    --             "documentHighlights",
    --             "inlayHint",
    --             "pathCompletion",
    --             "codeLens",
    --             "definition",
    --         },
    --         formatter = "auto"
    --     },
    -- })

    lspconfig.solargraph.setup({
        cmd = { "solargraph", "stdio" },
        filetypes = { "ruby" },
        root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
        settings = {
            solargraph = {
                diagnostics = true,
                completion = true
            }
        }
    })
end

return M
