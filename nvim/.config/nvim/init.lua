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
map("n", "<leader>o", ":update<CR> :source<CR>", { desc = "Source file" })
map("n", "<leader>w", ":write<CR>", { desc = "Write file" })
map("n", "<leader>q", ":quit<CR>", { desc = "Quit" })
map("n", "<leader>v", ":e $MYVIMRC<CR>", { desc = "Open nvim config" })
map("n", "<leader>s", ":e #<CR>", { desc = "Go to previous buffer" })
map("n", "<leader>S", ":sf #<CR>", { desc = "Open buffer in split" })
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Global yank" })
map({ "n", "v" }, "<leader>d", '"+d', { desc = "Delete and global yank" })
map({ "n", "v" }, "<leader>c", "z=", { desc = "Autospell" })

-- PLUGINS
vim.pack.add({
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/norcalli/nvim-colorizer.lua" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("*") },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/stevearc/conform.nvim" },
})

-- PLUGIN SETUP
-- THEME
vim.cmd("colorscheme kanagawa")
require("kanagawa").setup({
	transparent = true,
	styles = {
		sidebars = "transparent",
		floats = "transparent",
	},
})
vim.cmd(":hi normal guibg=NONE")
vim.cmd(":hi nontext guibg=NONE")

-- SETUPS
require("nvim-treesitter").setup({
	ensure_installed = { "c", "cpp", "java", "python", "javascript", "typescript", "lua", "rust", "bash" },
	sync_install = true,
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
})
require("oil").setup()
require("mason").setup()
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "autopep8" },
	},
})
require("blink.cmp").setup({
	keymap = {
		["<CR>"] = { "accept", "fallback" },
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
		["<C-k>"] = { "scroll_documentation_up", "fallback" },
		["<C-j>"] = { "scroll_documentation_down", "fallback" },
		["<C-e>"] = { "cancel" },
	},
})
require("mini.pick").setup()
require("mini.pairs").setup()
require("mini.surround").setup()

-- PLUGIN KEYMAPS
map("n", "<leader>f", ":Pick files<CR>", { desc = "Find file in CWD" })
map("n", "<leader>h", ":Pick help<CR>", { desc = "Find help" })
map("n", "<leader>e", ":Oil<CR>", { desc = "Open Oil" })

-- LSP
vim.lsp.enable({
	"lua_ls",
	"basedpyright",
})

map("n", "<leader>lf", require("conform").format, { desc = "Format file" })
map("n", "<leader>lgd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Show diagnostic message" })

-- SNIPPETS
require("luasnip").setup({ enable_autosnippets = true })
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })
