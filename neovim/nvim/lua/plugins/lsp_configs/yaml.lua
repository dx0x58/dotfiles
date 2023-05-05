
local M = {}

function M.Load(lspconfig)
    lspconfig.yamlls.setup({
        settings = {
            yaml = {
                schemas = {
                    ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/3.0.3/schemas/v2.0/schema.json"] = "**/api/openapi/*.yaml"
                }
            }
        }
    })
end

return M
