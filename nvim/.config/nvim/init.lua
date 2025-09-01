-- INIT
vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])

-- OPTIONS
vim.opt.winborder = "rounded"
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.cursorcolumn = false
vim.opt.ignorecase = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 999
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.signcolumn = "yes"

-- DEFAULT KEYMAPS
local map = vim.keymap.set
vim.g.mapleader = " "
map("n", "<leader>o", ":update<CR> :source<CR>")
map("n", "<leader>w", ":write<CR>")
map("n", "mk", ":update<CR> :make<CR>")
map("n", "co", ":open<CR>")
map("n", "<leader>q", ":quit<CR>")
map("n", "<C-f>", ":Open .<CR>")
map("n", "<leader>v", ":e $MYVIMRC<CR>")
map("n", "<leader>z", ":e ~/dotfiles/zsh/.zshrc<CR>")
map("n", "<leader>s", ":e #<CR>")
map("n", "<leader>S", ":sf #<CR>")
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>d", '"+d')
map({ "n", "v" }, "<leader>c", "1z=")

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
require "mini.pick".setup({
	mappings = {
		choose_marked = "<C-G>"
	}
})
require "oil".setup()

-- PLUGIN KEYMAPS
map("n", "<leader>f", ":Pick files<CR>")
map("n", "<leader>h", ":Pick help<CR>")
map("n", "<leader>e", ":Oil<CR>")
map("n", "<leader>lf", vim.lsp.buf.format)

-- LSP
vim.lsp.enable({
	"lua_ls",
})
