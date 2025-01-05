return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.lang.markdown" },
  { import = "lazyvim.plugins.extras.lang.toml" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lsp.neoconf" },
  { import = "lazyvim.plugins.extras.linting.eslint" },
  {
    "nvimdev/lspsaga.nvim",
    event = { "LspAttach" },
    opts = {
      ui = {
        border = "rounded",
      },
      finder = {
        silent = true,
      },
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        sign = false,
        virtual_text = false,
      },
    },
    keys = {
      {
        "]d",
        function()
          require("lsp_lines").toggle()
        end,
        desc = "Toggle lsp_lines",
      },
    },
  },

  {
    "folke/trouble.nvim",
    ft = "qf",
    event = { "LspAttach" },
    opts = { use_diagnostic_signs = true },
  },
  {
    "dmmulroy/tsc.nvim",
    ft = { "typescript", "typescriptreact" },
    event = { "LspAttach" },
    config = true,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach",
    config = function()
      require("lsp_lines").setup()
      vim.diagnostic.config({
        underline = true,
        signs = true,
        update_in_insert = false,
        severity_sort = true,
        virtual_lines = {
          only_current_line = false,
          highlight_whole_line = true,
        },
        float = false,
        virtual_text = false,
      })
    end,
    keys = {
      {
        "<Leader>tp",
        function()
          require("lsp_lines").toggle()
        end,
        desc = "Toggle lsp_lines",
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false,
    ft = { "rust" }, -- try pr2502/ra-multiplex
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client)
            client.server_capabilities.semanticTokensProvider = nil
            if vim.lsp.inlay_hint then
              vim.lsp.inlay_hint.enable(true)
            end
          end,
        },
      }
    end,
  },
}
