return {
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.lang.markdown" },
  { import = "lazyvim.plugins.extras.lang.toml" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.rust" },
  { import = "lazyvim.plugins.extras.lsp.neoconf" },
  { import = "lazyvim.plugins.extras.linting.eslint" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        typos_lsp = {
          cmd_env = { RUST_LOG = "info" },
          init_options = {
            diagnosticSeverity = "Info",
          },
        },
      },
    },
  },

  {
    "nvimdev/lspsaga.nvim",
    event = { "LspAttach" },
    config = function()
      require("lspsaga").setup({
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
      })
      LazyVim.lsp.on_attach(function(client, buffer)
        client.server_capabilities.semanticTokensProvider = nil
      end)
    end,
    keys = {
      {
        "ga",
        "<cmd>Lspsaga code_action<CR>",
        desc = "Lspsaga code action",
      },
      {
        "gA",
        "<cmd>Lspsaga range_code_action<CR>",
        desc = "Lspsaga range code action",
      },
      {
        "K",
        "<cmd>Lspsaga hover_doc<CR>",
        desc = "Lspsaga hover doc",
      },
      {
        "]d",
        "<cmd>Lspsaga diagnostic_jump_next<CR>",
        desc = "Lspsaga diagnostic_jump_next",
      },
      {
        "[d",
        "<cmd>Lspsaga diagnostic_jump_prev<CR>",
        desc = "Lspsaga diagnostic_jump_prev",
      },
      {
        "<leader>ts",
        "<cmd>Lspsaga outline<CR>",
        desc = "Lspsaga outline",
      },
    },
  },

  {
    "folke/trouble.nvim",
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
    "dnlhc/glance.nvim",
    event = { "LspAttach" },
    opts = {},
  },
  {
    "aznhe21/actions-preview.nvim",
    event = { "LspAttach" },
    opts = {},
    keys = {
      {
        "gm",
        function()
          require("actions-preview").code_actions()
        end,
        desc = "LSP action preview",
      },
    },
  },
}
