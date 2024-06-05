-- Use vim-plug to manage plugins
vim.cmd [[
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'          " Basic sensible settings
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'       " LSP configuration
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter for better syntax highlighting
Plug 'hrsh7th/nvim-cmp'            " Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp'        " LSP source for nvim-cmp
Plug 'L3MON4D3/LuaSnip'            " Snippet engine
Plug 'saadparwaiz1/cmp_luasnip'    " Snippet completion source
Plug 'nvim-lualine/lualine.nvim'   " Statusline

call plug#end()
]]

-- Basic Settings
vim.opt.number = true                -- Show line numbers
vim.opt.relativenumber = true        -- Show relative line numbers
vim.opt.tabstop = 4                  -- Number of spaces tabs count for
vim.opt.shiftwidth = 4               -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true             -- Use spaces instead of tabs
vim.opt.smartindent = true           -- Insert indents automatically
vim.opt.clipboard = 'unnamedplus'    -- Use system clipboard
vim.opt.mouse = 'a'                  -- Enable mouse support
vim.opt.termguicolors = true         -- Enable 24-bit RGB colors

-- LSP settings
local lspconfig = require('lspconfig')
lspconfig.tsserver.setup{}
lspconfig.pyright.setup{}
lspconfig.rust_analyzer.setup{}
-- Add more LSP servers as needed

-- Completion settings
local cmp = require'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
}

-- Treesitter settings
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
}

-- Statusline settings
require('lualine').setup {
  options = {
    theme = 'auto'
  }
}
