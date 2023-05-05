function Colorize(color)
	-- color = color or "tokyonight-night"
	-- vim.cmd.colorscheme(color)

	--- make transparent
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Colorize()

