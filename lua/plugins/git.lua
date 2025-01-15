return {
  -- { import = "lazyvim.plugins.extras.util.gitui" },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    dependencies = {
      "tpope/vim-rhubarb",
    },
  },
  {
    "akinsho/git-conflict.nvim",
    event = "VeryLazy",
    config = true,
  },
  { "rbong/vim-flog", cmd = { "Flog" } },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = true,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "LazyFile", "VeryLazy" },
    opts = {
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 200,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = "   <author> 󰔠 <author_time:%h %d, %Y> 󰜘 <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
    },
  },
}
