return {
    'nvim-lualine/lualine.nvim',
    config = function ()
         require('lualine').setup {
          options = {
            icons_enabled = false,
            theme = 'tokyonight',
            component_separators = '|',
            section_separators = '',
          },
          sections = {
            lualine_c = {
              'filename',
              {
                function()
                  local full_path = vim.fn.expand('%:p')
                  local home = os.getenv('HOME')
                  local rel_path = full_path:gsub('^' .. home, '~')
                  return rel_path
                end,
                cond = function()
                  return vim.fn.empty(vim.fn.expand('%:t')) == 0
                end,
              },
            }
          }
        }
    end
}
