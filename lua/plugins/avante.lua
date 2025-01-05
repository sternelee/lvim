return {
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
    opts = {
      provider = "openai",
      vendors = {
        groq = {
          __inherited_from = "openai",
          api_key_name = "GROQ_API_KEY",
          endpoint = "https://api.groq.com/openai/v1",
          model = "llama-3.1-70b-versatile",
        },
        xai = {
          __inherited_from = "openai",
          api_key_name = "XAI_API_KEY",
          endpoint = "https://api.x.ai/v1",
          model = "grok-2-1212",
        },
        codestral = {
          __inherited_from = "openai",
          api_key_name = "CODESTRAL_API_KEY",
          endpoint = "https://codestral.mistral.ai/v1",
          model = "codestral-latest",
        },
        deepseek = {
          __inherited_from = "openai",
          api_key_name = "DEEPSEEK_API_KEY",
          endpoint = "https://api.deepseek.com",
          model = "deepseek-coder",
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
    },
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
  },
}
