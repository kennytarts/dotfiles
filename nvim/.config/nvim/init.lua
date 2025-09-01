-- INIT
vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])

-- OPTIONS
vim.opt.winborder = "solid"
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250

-- DEFAULT KEYMAPS
local map = vim.keymap.set
vim.g.mapleader = " "
map("n", "<leader>o", ":update<CR> :source<CR>")
map("n", "<leader>w", ":write<CR>")
map("n", "<leader>q", ":quit<CR>")
map("n", "<leader>v", ":e $MYVIMRC<CR>")
map("n", "<leader>z", ":e ~/dotfiles/zsh/.zshrc<CR>")
map("n", "<leader>s", ":e #<CR>")
map("n", "<leader>S", ":sf #<CR>")
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>d", '"+d')
map({ "n", "v" }, "<leader>c", "z=")

-- PLUGINS
vim.pack.add({
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/norcalli/nvim-colorizer.lua" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
})

-- PLUGIN SETUP
-- THEME
vim.cmd("colorscheme kanagawa")
require "kanagawa".setup({
	transparent = true,
	styles = {
		sidebars = "transparent",
		floats = "transparent",
	}
})
vim.cmd(":hi normal guibg=NONE")
vim.cmd(":hi nontext guibg=NONE")

-- SETUPS
require "mason".setup()
require "mini.pick".setup()
require "oil".setup()
require "nvim-treesitter".setup({
	ensure_installed = { "c", "cpp", "java", "python", "javascript", "typescript", "lua", "rust", "bash" },
	sync_install = true,
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
})

-- PLUGIN KEYMAPS
map("n", "<leader>f", ":Pick files<CR>")
map("n", "<leader>h", ":Pick help<CR>")
map("n", "<leader>e", ":Oil<CR>")

-- LSP
vim.lsp.enable({
	"lua_ls",
	"basedpyright",
})

-- LSP KEYMAPS
map("n", "<leader>lf", vim.lsp.buf.format)
map("n", "<leader>lgd", vim.lsp.buf.definition)
map("n", "<leader>ld", vim.diagnostic.open_float)
