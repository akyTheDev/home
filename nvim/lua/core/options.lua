-- Relative line numbers
vim.o.relativenumber = true
vim.o.nu = true

-- Case insensitive searching
vim.o.ignorecase = true
vim.o.smartcase = true

-- Sync clipboard
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Raise dialog if unsaved buffer
vim.o.confirm = true

-- Snappy escape
vim.o.timeoutlen = 1500

-- Sign column always visible
vim.o.signcolumn = 'yes'

-- Vim diagnostics
vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,
	virtual_text = {
		spacing = 4,
		source = 'if_many',
		prefix = '●',
	},
	float = {
		border = 'rounded',
		source = 'if_many',
	},
	jump = { float = true },
})

-- Highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function() vim.highlight.on_yank() end
})
