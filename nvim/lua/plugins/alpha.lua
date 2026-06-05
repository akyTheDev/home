local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {
	[[                                                               ]],
	[[     ███╗   ██╗███████╗██████╗ ██╗   ██╗██╗███╗   ███╗     ]],
	[[     ████╗  ██║██╔════╝██╔══██╗██║   ██║██║████╗ ████║     ]],
	[[     ██╔██╗ ██║█████╗  ██║  ██║██║   ██║██║██╔████╔██║     ]],
	[[     ██║╚██╗██║██╔══╝  ██║  ██║╚██╗ ██╔╝██║██║╚██╔╝██║     ]],
	[[     ██║ ╚████║███████╗██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║     ]],
	[[     ╚═╝  ╚═══╝╚══════╝╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝     ]],
	[[                                                               ]]
}
dashboard.section.header.opts.hl = 'Keyword'

dashboard.section.buttons.val = {
	dashboard.button("f", "  Find File", "<cmd>FzfLua files<CR>"),
	dashboard.button("g", "󰈭  Live Grep", "<cmd>FzfLua live_grep<CR>"),
	dashboard.button("e", "  Explorer", "<cmd>Oil<CR>"),
	dashboard.button("l", "󰊢  Git Status", "<cmd>LazyGit<CR>"),
	dashboard.button("q", "󰅙  Quit", "<cmd>qa<CR>"),
}

dashboard.section.footer.val = "akyTheDev"
dashboard.section.footer.opts.hl = 'Comment'
dashboard.config.layout[1].val = 6
dashboard.config.layout[3].val = 3

alpha.setup(dashboard.opts)
