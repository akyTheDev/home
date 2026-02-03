return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'ravitemer/mcphub.nvim',
    {
      'echasnovski/mini.diff',
      config = function()
        local diff = require('mini.diff')
        diff.setup({ source = diff.gen_source.none() })
      end,
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      ft = { 'markdown', 'codecompanion' },
    },
  },
  opts = {
    log_level = 'DEBUG',

    strategies = {
      chat = {
        adapter = 'copilot',
        tools = {
          ['mcp'] = {
            callback = function(...)
              local status, mcp_ext = pcall(require, 'mcphub.extensions.codecompanion')
              if not status then
                vim.notify("MCPHub extension not found. Run :Lazy update", vim.log.levels.ERROR)
                return nil
              end
              return mcp_ext(...)
            end,
            description = 'Call tools and resources from the MCP Servers',
            opts = {
              requires_approval = true,
            }
          },
        },
      },
      inline = {
        adapter = 'copilot',
      },
    },

    adapters = {
      copilot = function()
        return require('codecompanion.adapters').extend('copilot', {
          schema = {
            model = {
              default = 'gpt-4o',
            },
          },
        })
      end,
    },

    -- Prompt Library (Roles)
    prompt_library = {
      ['Senior Review'] = {
        strategy = 'chat',
        description = 'Review code for best practices',
        opts = {
          is_slash_cmd = true,
          short_name = 'review',
          auto_submit = true,
        },
        prompts = {
          {
            role = 'system',
            content = 'You are a Senior Software Engineer. Review the code for maintainability and bugs.',
          },
          {
            role = 'user',
            content = function(context)
              return 'Review this buffer: ' .. context.bufnr
            end,
            contains_code = true,
          },
        },
      },
      ['Senior Code Writer'] = {
      strategy = 'chat',
      description = 'Write code applying DRY, KISS, SOLID, and Clean Code principles',
      opts = {
        is_slash_cmd = true,
        short_name = 'dev', -- Usage: /dev <instruction>
        auto_submit = true,
      },
      prompts = {
        {
          role = 'system',
          content = [[You are a Principal Software Engineer known for writing bulletproof, production-grade code.
Your goal is not just to make it work, but to make it maintainable for the next 5 years.

STRICTLY ADHERE TO THESE PRINCIPLES:
1. **DRY (Don't Repeat Yourself):** Abstract repeated logic into helper functions or components.
2. **KISS (Keep It Simple, Stupid):** Avoid over-engineering. If a simple if-statement works, don't use a factory pattern.
3. **SOLID:** Ensure classes/modules have a single responsibility and dependencies are injected where possible.
4. **YAGNI (You Ain't Gonna Need It):** Do not implement features that were not explicitly asked for.
5. **Defensive Coding:** validate inputs, handle edge cases gracefully, and never fail silently.
6. **Idiomatic Style:** Write code that respects the standard conventions of the language (e.g., correct error handling in Go, functional patterns in TypeScript).

Before outputting code, briefly explain your architectural decision in 1-2 bullet points.]],
        },
        {
          role = 'user',
          content = function(context)
            -- This function captures your input + the current buffer context
            -- If you typed "/dev create a user service", this sends that text + the file content
            return string.format(
              "Context: Buffer #%d (%s)\n\nTask: %s",
              context.bufnr,
              context.filetype,
              context.args or "Refactor this code to follow strict design principles."
            )
          end,
          contains_code = true,
        },
      },
    },
      ['Software Architect'] = {
      strategy = 'chat',
      description = 'Design high-level systems, discuss trade-offs, and create diagrams',
      opts = {
        is_slash_cmd = true,
        short_name = 'arch', -- Usage: /arch how do I design a real-time chat?
        auto_submit = true,
      },
      prompts = {
        {
          role = 'system',
          content = [[You are a Distinguished System Architect. Your goal is to design robust, scalable, and maintainable software systems.

WHEN DESIGNING, FOLLOW THIS FRAMEWORK:
1. **Clarify Requirements:** Identify Functional (what it does) and Non-Functional Requirements (Scalability, Latency, Consistency).
2. **Visual Thinking:** ALWAYS include a `mermaid` diagram to visualize the data flow or component interaction.
3. **Trade-off Analysis:** There is no "perfect" solution. Contrast at least two approaches (e.g., "SQL vs. NoSQL" or "Monolith vs. Microservices") and explain the Pros/Cons of each.
4. **Data Strategy:** Explicitly discuss how data is stored, cached, and consistent (Eventual vs. Strong).
5. **Technology Stack:** Recommend specific tools (e.g., Redis for caching, Kafka for streaming, Postgres for relational data) based on the user's constraints.

Be pragmatic. If a simple monolith solves the problem, recommend it over a complex microservices mesh.]],
        },
        {
          role = 'user',
          content = function(context)
            return "Architectural Design Request: " .. (context.args or "Please analyze the current system architecture.")
          end,
        },
      },
    },
    },

     display = {
        chat = {
          auto_scroll = true,
          window = {
            layout = "float",          -- Floating window
            width = 0.7,               -- 70% of screen width
            height = 0.7,              -- 70% of screen height
            border = "rounded",        -- Rounded borders
            title = " CodeCompanion Chat ",
          },
        },
      },
  },


  keys = {
    { '<leader>aa', '<cmd>CodeCompanionActions<cr>', mode = { 'n', 'v' }, desc = 'AI Actions' },
    { '<leader>ac', '<cmd>CodeCompanionChat Toggle<cr>', mode = { 'n', 'v' }, desc = 'AI Toggle Chat' },
    { '<leader>ai', '<cmd>CodeCompanion<cr>', mode = { 'n', 'v' }, desc = 'AI Inline Prompt' },
    { 'ga', '<cmd>CodeCompanionChat Add<cr>', mode = 'v', desc = 'AI Add Selection' },
  },
}
