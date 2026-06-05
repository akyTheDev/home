-- Set leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Core
require('core.options')
require('core.keymaps')

-- Plugins
require('plugins')

vim.cmd [[colorscheme moonfly]]

require('plugins.fzf')
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.neoscroll')
require('plugins.blink')
require('plugins.oil')
require('plugins.lazygit')
require('plugins.codediff')
require('plugins.alpha')
require('plugins.harpoon')
require('plugins.autopairs')
