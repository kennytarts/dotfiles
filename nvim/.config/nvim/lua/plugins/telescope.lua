return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{"<leader>sf","<cmd>Telescope find_files<cr>",desc = "(S)earch (F)iles"},
		{"<leader>sh","<cmd>Telescope help_tags<cr>",desc = "(S)earch (H)elp"},
		{"<C-p>","<cmd>Telescope git_files<cr>",desc = "Find Files in Git"},
		{"<leader>ss", function()
			local builtin = require("telescope.builtin")
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end,
			desc = "(S)earch files with included (S)tring input",
		},
	},
}
