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
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            require('telescope.builtin').current_buffer_fuzzy_find()
            -- require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            --     winblend = 10,
            --     previewer = false,
            -- })
        end, { desc = '[/] Fuzzily search in current buffer' })
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
    end
}
