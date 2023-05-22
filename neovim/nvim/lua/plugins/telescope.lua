return {
    'nvim-telescope/telescope.nvim',
    -- branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<C-p>', function()
            builtin.find_files({
                find_command = { "rg",
                    "--files",
                    "--hidden",
                    "--glob", "!**/.git/*",
                }
            });
        end)
        vim.keymap.set('n', '<leader>/', function()
            require('telescope.builtin').current_buffer_fuzzy_find()
        end, { desc = '[/] Fuzzily search in current buffer' })
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
    end
}
