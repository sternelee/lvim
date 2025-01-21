return {
  -- { import = "lazyvim.plugins.extras.ui.smear-cursor" },

  {
    "bufferline.nvim",
    enabled = false,
  },

  {
    "snacks.nvim",
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          pick = function(cmd, opts)
            return LazyVim.pick(cmd, opts)()
          end,
          header = [[┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑
	│ ⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷ │
	│ ⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇ │
	│ ⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽ │
	│ ⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕ │
	│ ⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕ │
	│ ⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕ │
	│ ⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄ │
	│ ⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕ │
	│ ⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿ │
	│ ⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ │
	│ ⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟ │
	│ ⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠ │
	│ ⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙ │
	│ ⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣ │
	┕━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┙
	+--------------------------------+
	|  Love You, 盼盼和小璇同学❤❤❤   |
	+----------------+---------------+
   ]],
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = false,
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
    "gelguy/wilder.nvim",
    event = "VeryLazy",
    config = function()
      local wilder = require("wilder")
      local gradient = {
        "#f4468f",
        "#fd4a85",
        "#ff507a",
        "#ff566f",
        "#ff5e63",
        "#ff6658",
        "#ff704e",
        "#ff7a45",
        "#ff843d",
        "#ff9036",
        "#f89b31",
        "#efa72f",
        "#e6b32e",
        "#dcbe30",
        "#d2c934",
        "#c8d43a",
        "#bfde43",
        "#b6e84e",
        "#aff05b",
      }
      for i, fg in ipairs(gradient) do
        gradient[i] = wilder.make_hl("WilderGradient" .. i, "Pmenu", { { a = 1 }, { a = 1 }, { foreground = fg } })
      end

      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer({
          highlights = {
            gradient = gradient, -- must be set
          },
          highlighter = wilder.highlighter_with_gradient({
            wilder.basic_highlighter(), -- or wilder.lua_fzy_highlighter(),
          }),
        })
      )

      wilder.setup({ modes = { ":", "/", "?" } })
    end,
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
  -- {
  --   "nvchad/menu",
  --   lazy = true,
  -- },
  { "nvchad/showkeys", cmd = "ShowkeysToggle" },
  { "nvchad/timerly", cmd = "TimerlyToggle" },
}
