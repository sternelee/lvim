return {
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
    event = "BufRead",
    enabled = true,
  },
}
