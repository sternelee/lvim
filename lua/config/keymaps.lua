-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local remap = vim.api.nvim_set_keymap

local map = LazyVim.safe_keymap_set

map("n", "P", "'0p")
map("v", "P", "'0p")
map("n", ";f", "<C-f>")
map("n", ";b", "<C-b>")
map("n", ";", ":") --semicolon to enter command mode
map("n", "j", "gj") --move by visual line not actual line
map("n", "k", "gk")
map("n", "q", "<cmd>q<CR>")
map("n", "<leader>:", "<cmd>terminal<CR>")
remap("n", "<esc>", "<cmd>noh<CR><CR>", { noremap = true, silent = true })

-- bufferline
map("n", "<tab>", "<cmd>BufferLineCycleNext<CR>")
map("n", "<S-tab>", "<cmd>BufferLineCycleNext<CR>")

-- FzfLua
map("n", "<leader>fw", "<cmd>FzfLua grep_cword<CR>")
map("n", "<leader>fm", "<cmd>FzfLua git_status<CR>")
map("n", "<leader>'", "<cmd>FzfLua resume<CR>")
map("n", "<C-p>", "<cmd>FzfLua files<CR>")

-- git
map("n", "<leader>ga", "<cmd>Git add %:p<CR>")
map("n", "<leader>go", "<cmd>Git add .<CR>")
map("n", "<leader>gm", "<cmd>Git commit<CR>")
map("n", "<leader>gl", "<cmd>Git pull<CR>")
map("n", "<leader>gu", "<cmd>Git push<CR>")
map("n", "<leader>gr", "<cmd>Git reset --hard<CR>")

map("n", "ga", "<cmd>Lspsaga code_action<CR>")
map("x", "gA", "<cmd>Lspsaga range_code_action<CR>")
map("n", "K", "<cmd>Lspsaga hover_doc<CR>")
-- map("n", "gn", "<cmd>Lspsaga rename<CR>")
-- map("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
-- map("n", "gi", "<cmd>Lspsaga finder<CR>")
map("n", "gC", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
-- map("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>")
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
map("n", "<leader>ts", "<cmd>Lspsaga outline<CR>")

map("n", "<leader>ns", "<cmd>lua require('package-info').show()<CR>")
map("n", "<leader>np", "<cmd>lua require('package-info').change_version()<CR>")
map("n", "<leader>ni", "<cmd>lua require('package-info').install()<CR>")

map("n", "<leader>ct", "<cmd>lua require('crates').toggle()<CR>")
map("n", "<leader>cv", "<cmd>lua require('crates').show_versions_popup()<CR>")

map("n", "<leader>m", "<cmd>ReachOpen marks<CR>")

map("n", "<leader>tw", "<cmd>Translate<CR>")

-- diffview
map("n", "<leader>td", "<cmd>DiffviewOpen<CR>")
map("n", "<leader>tD", "<cmd>DiffviewClose<CR>")

-- toggleterm
map("n", "<A-i>", "<cmd>ToggleTerm direction=float<CR>")
map("t", "<A-i>", "<C-\\><C-n><cmd>ToggleTermToggleAll<CR>")

-- menu
keymap("n", "<RightMouse>", function()
  vim.cmd.exec('"normal! \\<RightMouse>"')

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})
