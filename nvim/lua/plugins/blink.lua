require('blink.cmp').setup({
	keymap = {
		preset = 'default',
		['<CR>'] = { 'accept', 'fallback' },
	},

	completion = {
		menu = { border = 'rounded' },
		documentation = { auto_show = true, window = { border = 'rounded' } },
	},

	sources = {
		default = { 'lsp', 'path', 'snippets', 'buffer' },
	},
})
