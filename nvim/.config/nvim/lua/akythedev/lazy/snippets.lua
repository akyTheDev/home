return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            local ls = require("luasnip")
            local types = require("luasnip.util.types")

            -- Load friendly-snippets (VSCode snippets)
            require("luasnip.loaders.from_vscode").lazy_load()

            -- Optional: enable snippet autosnippets (expand while typing)
            ls.config.set_config {
                history = true,         -- jump back into previous snippets
                updateevents = "TextChanged,TextChangedI",
                enable_autosnippets = true,
                ext_opts = {
                    [types.choiceNode] = {
                        active = {
                            virt_text = { { "●", "GruvboxRed" } } -- optional visual indicator for choice nodes
                        },
                    },
                },
            }

            -- Filetype extensions (optional)
            ls.filetype_extend("javascript", { "jsdoc" })
            ls.filetype_extend("typescript", { "jsdoc" })
            ls.filetype_extend("python", { "django", "python" }) -- example for extra python snippets
            ls.filetype_extend("go", { "go" })

            -- Keymaps (safe keys that work in most terminals)
            vim.keymap.set({"i"}, "<C-k>e", function() ls.expand() end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-k>;", function() ls.jump(1) end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-k>,", function() ls.jump(-1) end, {silent = true})
            vim.keymap.set({"i", "s"}, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, {silent = true})

            -- Optional: add custom snippets (example)
            local s = ls.snippet
            local t = ls.text_node
            local i = ls.insert_node

            -- Python print snippet
            ls.add_snippets("python", {
                s("pp", { t("print("), i(1), t(")") }),
            })

            -- JavaScript console.log snippet
            ls.add_snippets("javascript", {
                s("cl", { t("console.log("), i(1), t(");") }),
            })

            -- Go fmt snippet
            ls.add_snippets("go", {
                s("pf", { t('fmt.Printf("'), i(1), t('")') }),
            })
        end,
    }
}
