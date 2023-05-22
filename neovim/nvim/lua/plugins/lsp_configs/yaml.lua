local M = {}

function M.Load(lspconfig)
    lspconfig.yamlls.setup {
        settings = {
            yaml = {
                keyOrdering = false,
                schemas = {
                     ["~/dotfiles/schemas/openapi/v3.1-3.0-compat.json"] = "*/openapi/*.yaml"
                    -- ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json"] = "**/api/openapi/*.yaml"
                },
            },
        }
    }
end

return M
