-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "*.toml",
  callback = function()
    require("cmp").setup.buffer({ sources = { { name = "crates" } } })
  end,
  desc = "Add cmp source for toml",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "*.json",
  callback = function()
    require("cmp").setup.buffer({ sources = { { name = "npm", keyword_length = 3 } } })
  end,
  desc = "Add cmp source for json",
})
