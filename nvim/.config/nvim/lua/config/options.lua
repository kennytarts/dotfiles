vim.opt.clipboard = "unnamedplus"
vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.o.smartindent = true -- syntax aware indentations for newline inserts
vim.opt.scrolloff = 999 -- always center my cursor

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true

-- Save undo history
vim.opt.undofile = true

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- [[ Basic Autocommands ]]
-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Notifies when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Notifies when yanking text',
	group = vim.api.nvim_create_augroup('YankNotify', { clear = true }),
	callback = function()
		local num_lines = math.max(1, vim.fn.line("'>") - vim.fn.line("'<") + 1)
		vim.notify(num_lines .. ' line(s) yanked to clipboard.', vim.log.levels.INFO, { timeout = 1000 })
	end,
})
