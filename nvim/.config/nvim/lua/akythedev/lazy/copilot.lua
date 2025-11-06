return {
    {
        "zbirenbaum/copilot.lua",
        name = "copilot",
        event = "InsertEnter",
        config = function()
            vim.g.copilot_no_tab_map = true
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    debounce = 75,
                    keymap = {
                        accept = "<C-J>",
                        accept_word = false,
                        accept_line = false,
                        next = "<C-]>",
                        prev = "<C-p>",
                        dismiss = "<C-e>",
                    },
                },
                panel = {
                    enabled = true,
                    auto_refresh = false,
                    keymap = {
                        jump_prev = "[[",
                        jump_next = "]]",
                        accept = "<CR>",
                        refresh = "gr",
                        open = "<C-b>"
                    },
                    layout = {
                        position = "bottom", -- | top | left | right
                        ratio = 0.4
                    },
                },
                filetypes = {
                    yaml = false,
                    markdown = false,
                    help = false,
                    gitcommit = false,
                    gitrebase = false,
                    hgcommit = false,
                    svn = false,
                    cvs = false,
                    ["."] = false,
                },
                copilot_node_command = 'node', -- Node.js version must be > 16.x
                server_opts_overrides = {},
            })
        end,
    },
}
