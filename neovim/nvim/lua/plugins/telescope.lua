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

        --- Find by Selection ---
        function vim.getVisualSelection()
            vim.cmd('noau normal! "vy"')
            local text = vim.fn.getreg('v')
            vim.fn.setreg('v', {})

            text = string.gsub(text, "\n", "")

            if #text > 0 then
                return text
            else
                return ''
            end
        end

        local keymap = vim.keymap.set

        local tb = require('telescope.builtin')
        local opts = { noremap = true, silent = true }

        keymap('n', '<space>f', ':Telescope current_buffer_fuzzy_find<cr>', opts)
        keymap('v', '<space>f', function()
            local text = vim.getVisualSelection()

            tb.current_buffer_fuzzy_find({ default_text = text })
        end, opts)

        keymap('n', '<space>F', ':Telescope live_grep<cr>', opts)

        keymap('v', '<space>F', function()
            local text = vim.getVisualSelection()

            tb.live_grep({ default_text = text })
        end, opts)
        --- End Find by Selection ---
    end
}
