return {
  -- { import = "lazyvim.plugins.extras.ai.supermaven" },

  {
    "luozhiya/fittencode.nvim",
    event = { "InsertEnter" },
    opts = {
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
    },
  },
}
