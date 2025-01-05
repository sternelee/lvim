return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --[[add your custom lualine config here]]
      }
    end,
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
