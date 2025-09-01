return {
	{
		"Shatur/neovim-ayu",
		lazy = false,
		priority = 1000,
		config = function ()
			require("ayu").setup({
				mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
				terminal = true, -- Set to `false` to let terminal manage its own colors.
				overrides = {
					Normal = { bg = "None" },
					NormalFloat = { bg = "none" },
					ColorColumn = { bg = "None" },
					SignColumn = { bg = "None" },
					Folded = { bg = "None" },
					FoldColumn = { bg = "None" },
					CursorLine = { bg = "None" },
					CursorColumn = { bg = "None" },
					VertSplit = { bg = "None" },
				},
			})
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		transparent = true,
		styles = {
			sidebars = "transparent",
			floats = "transparent",
		},
		priority = 1000,
		config = function ()
			vim.cmd("colorscheme kanagawa")
			vim.cmd("highlight Normal guibg=None")
			vim.cmd("highlight NonText guibg=None")
		end,
	},
}
