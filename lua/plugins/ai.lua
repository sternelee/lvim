return {
  -- { import = "lazyvim.plugins.extras.ai.supermaven" },

  {
    "luozhiya/fittencode.nvim",
    event = { "InsertEnter" },
    opts = function()
      LazyVim.cmp.actions.ai_accept = function()
        local fittencode = require("fittencode.api")
        if fittencode.api.has_suggestions() then
          LazyVim.create_undo()
          vim.schedule(function()
            fittencode.api.accept_all_suggestions()
          end)
          return true
        end
      end
      return {
        use_default_keymaps = false,
        inline_completion = {
          enabled = false,
        },
        keymaps = {
          inline = {
            ["<C-j>"] = "accept_all_suggestions",
            ["<C-Down>"] = "accept_line",
            ["<C-Right>"] = "accept_word",
            ["<C-Up>"] = "revoke_line",
            ["<C-Left>"] = "revoke_word",
            ["<A-\\>"] = "triggering_completion",
          },
          chat = {
            ["q"] = "close",
            ["[c"] = "goto_previous_conversation",
            ["]c"] = "goto_next_conversation",
            ["c"] = "copy_conversation",
            ["C"] = "copy_all_conversations",
            ["d"] = "delete_conversation",
            ["D"] = "delete_all_conversations",
          },
        },
      }
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "markdown", "Avante", "codecompanion" },
      latex = { enabled = false },
    },
    ft = { "markdown", "Avante", "codecompanion" },
  },
  {
    "yetone/avante.nvim",
    cmd = { "AvanteChat", "AvanteEdit", "AvanteAsk" },
    version = false,
    opts = function()
      -- LazyVim.cmp.actions.ai_accept = function()
      --   local Suggestion = require("avante").get_suggestion()
      --   if Suggestion:is_visible() then
      --     LazyVim.create_undo()
      --     vim.schedule(function()
      --       Suggestion:accept()
      --     end)
      --     return true
      --   end
      -- end
      return {
        behaviour = {
          auto_suggestions = false,
          auto_set_highlight_group = true,
          auto_set_keymaps = true,
          auto_apply_diff_after_generation = false,
          support_paste_from_clipboard = false,
          minimize_diff = true,
        },
        provider = "openai",
        vendors = {
          -- groq = {
          --   __inherited_from = "openai",
          --   api_key_name = "GROQ_API_KEY",
          --   endpoint = "https://api.groq.com/openai/v1",
          --   model = "llama-3.1-70b-versatile",
          -- },
          -- codestral = {
          --   __inherited_from = "openai",
          --   api_key_name = "CODESTRAL_API_KEY",
          --   endpoint = "https://codestral.mistral.ai/v1",
          --   model = "codestral-latest",
          -- },
          deepseek = {
            __inherited_from = "openai",
            api_key_name = "DEEPSEEK_API_KEY",
            endpoint = "https://api.deepseek.com",
            model = "deepseek-chat",
          },
          siliconflow = {
            __inherited_from = "openai",
            api_key_name = "SILICONFLOW_API_KEY",
            endpoint = "https://api.siliconflow.cn/v1",
            model = "Qwen/QwQ-32B-Preview",
          },
          google = {
            __inherited_from = "openai",
            api_key_name = "OPENROUTER_API_KEY",
            endpoint = "https://openrouter.ai/api/v1",
            model = "google/gemini-2.0-flash-thinking-exp:free",
          },
        },
        openai = {
          api_key_name = "OPENROUTER_API_KEY",
          endpoint = "https://openrouter.ai/api/v1",
          model = "anthropic/claude-3.5-sonnet:beta",
        },
      }
    end,
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "MunifTanjim/nui.nvim",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
          },
        },
      },
    },
    keys = {
      {
        "<leader>ip",
        function()
          return vim.bo.filetype == "AvanteInput" and require("avante.clipboard").paste_image()
            or require("img-clip").paste_image()
        end,
        desc = "clip: paste image",
      },
    },
  },

  {
    "olimorris/codecompanion.nvim",
    -- cmd = { "Codecompanion", "CodecompanionChat" },
    event = { "InsertEnter" },
    opts = {
      strategies = {
        chat = {
          adapter = "openai",
        },
        inline = {
          adapter = "openai",
        },
        agent = {
          adapter = "openai",
        },
      },
      adapters = {
        openai = function()
          return require("codecompanion.adapters").extend("openai", {
            url = "https://openrouter.ai/api/v1/chat/completions",
            env = {
              api_key = "OPENROUTER_API_KEY",
            },
            schema = {
              model = {
                default = "google/gemini-2.0-flash-thinking-exp:free",
                choices = {
                  "qwen/qwen-2.5-coder-32b-instruct",
                  "deepseek-ai/DeepSeek-V2.5",
                  "qwen/qwen-2.5-72b-instruct",
                  "openai/gpt-4-turbo-preview",
                  "openai/gpt-4o-2024-05-13",
                  "anthropic/claude-3.5-sonnet:beta",
                  "qwen/qwq-32b-preview",
                  "eva-unit-01/eva-qwen-2.5-72b",
                  "google/gemini-2.0-flash-thinking-exp:free",
                },
              },
            },
          })
        end,
      },
    },
  },
}
