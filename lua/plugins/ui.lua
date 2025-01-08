return {
  { import = "lazyvim.plugins.extras.ui.smear-cursor" },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {

      smart_move = {
        enabled = true,
        excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
      },
      views = {
        mini = {
          position = {
            row = "90%",
            col = "100%",
          },
        },
        cmdline_popup = {
          position = {
            row = "30%",
            col = "50%",
          },
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    opts = {
      source_selector = {
        winbar = true,
        sources = {
          { source = "filesystem", display_name = "  Files " },
          { source = "buffers", display_name = "  Bufs " },
          { source = "git_status", display_name = "  Git " },
        },
      },
    },
  },

  { "folke/snacks.nvim", opts = { dashboard = { enabled = true } } },
  {
    "Bekaboo/dropbar.nvim",
    event = "VeryLazy",
    opts = {},
  },

  { "nvchad/volt", lazy = true },
  {
    "nvchad/minty",
    cmd = { "Shades", "Huefy" },
    opts = { huefy = { border = false } },
  },
  {
    "nvchad/menu",
    lazy = true,
  },
  { "nvchad/showkeys", cmd = "ShowkeysToggle" },
  { "nvchad/timerly", cmd = "TimerlyToggle" },
}
