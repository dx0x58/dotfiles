return {
	'nvim-treesitter/nvim-treesitter',
	cmd = 'TSUpdate',
	config = function()
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {
	  "css",
	  "scss",
	  "dot",
	  "html",
	  "json",
	  "markdown",
	  "python",
	  "sql",
	  "terraform",
	  "bash",
	  "go",
	  "ruby",
	  "javascript", 
	  "typescript",
	  "rust",
	  "c", 
	  "cpp",
	  "lua", 
	  "vim",
	  "yaml",
	  "vimdoc", 
	  "query", 
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  highlight = {
    enable = true,
  },
}		
	end
}
