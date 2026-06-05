-- Formatter
vim.keymap.set('n', '<leader>f', function()
	vim.lsp.buf.format({ async = true })
end, { desc = 'Format current buffer' })

-- Show diagnostics
vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, { desc = 'show diagnostics' })
vim.keymap.set({ 'n', 'v' }, '<leader>vca', vim.lsp.buf.code_action, { desc = 'Code Actions (Hızlı Çözümler)' })
vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, { desc = "Find references" })
vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, { desc = "Rename" })


-- Easily move between windows
vim.keymap.set('n', '<C-w><C-h>', '<C-w>h', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-w><C-l>', '<C-w>l', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-w><C-j>', '<C-w>j', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-w><C-k>', '<C-w>k', { desc = 'Move focus to the upper window' })

-- LSP
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })

-- Go
vim.keymap.set(
	"n",
	"<leader>goe",
	"oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)
