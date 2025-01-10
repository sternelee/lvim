return {
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
        xai = function()
          return require("codecompanion.adapters").extend("xai", {
            schema = {
              model = {
                default = "grok-2-1212",
                choices = {
                  "grok-beta",
                  "grok-2-1212",
                },
              },
            },
          })
        end,
      },
    },
  },
}
