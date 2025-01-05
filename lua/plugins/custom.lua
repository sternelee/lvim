-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  { import = "lazyvim.plugins.extras.coding.mini-surround" },
  { import = "lazyvim.plugins.extras.editor.inc-rename" },
  { import = "lazyvim.plugins.extras.editor.navic" },
  { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
  { import = "lazyvim.plugins.extras.coding.mini-comment" },
  { import = "lazyvim.plugins.extras.coding.yanky" },
  { import = "lazyvim.plugins.extras.editor.mini-diff" },
  { import = "lazyvim.plugins.extras.editor.mini-move" },
  { import = "lazyvim.plugins.extras.ui.mini-animate" },
  { import = "lazyvim.plugins.extras.ui.mini-starter" },

  "pteroctopus/faster.nvim",
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized-osaka",
    },
  },
  {
    "hrsh7th/cmp-cmdline",
    event = { "CmdlineEnter" },
    opts = function()
      local cmp = require("cmp")
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
          { name = "cmdline_history" },
          { name = "path" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "path" },
          { name = "cmdline", option = { ignore_cmds = {} } },
          { name = "cmdline_history" },
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    dependencies = {
      "onsails/lspkind.nvim",
      "xzbdmw/colorful-menu.nvim",
      "petertriho/cmp-git",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-calc",
      "roginfarrer/cmp-css-variables",
      {
        "luckasRanarison/tailwind-tools.nvim",
        name = "tailwind-tools",
        build = ":UpdateRemotePlugins",
        opts = {},
      },
    },
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      local auto_select = true

      require("cmp_git").setup()
      return {
        auto_brackets = {},
        completion = {
          completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
        },
        preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
          ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
          ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
          ["<tab>"] = function(fallback)
            return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
          end,
        }),
        sources = cmp.config.sources({
          { name = "lazydev" },
          { name = "nvim_lsp" },
          { name = "path" },
          { name = "calc" },
          { name = "emoji" },
          { name = "git" },
          { name = "css-variables" },
        }, {
          { name = "buffer" },
        }),
        formatting = {
          expandable_indicator = true,
          fields = { "kind", "abbr", "menu" },
          before = require("tailwind-tools.cmp").lspkind_format,
          format = function(entry, item)
            local highlights_info = require("colorful-menu").cmp_highlights(entry)

            -- if highlight_info==nil, which means missing ts parser, let's fallback to use default `vim_item.abbr`.
            -- What this plugin offers is two fields: `vim_item.abbr_hl_group` and `vim_item.abbr`.
            if highlights_info ~= nil then
              item.abbr_hl_group = highlights_info.highlights
              item.abbr = highlights_info.text
            end
            local icons = LazyVim.config.icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end

            local widths = {
              abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
              menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
            }

            for key, width in pairs(widths) do
              if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
              end
            end

            return item
          end,
        },
        experimental = {
          -- only show ghost text when we show ai completions
          ghost_text = vim.g.ai_cmp and {
            hl_group = "CmpGhostText",
          } or false,
        },
        sorting = defaults.sorting,
      }
    end,
  },
  {
    "Saecki/crates.nvim",
    event = "BufRead Cargo.toml",
    config = true,
  },
  {
    "David-Kunz/cmp-npm",
    event = "BufRead package.json",
    config = true,
  },
  {
    "vuki656/package-info.nvim",
    event = "BufRead package.json",
    config = function()
      require("package-info").setup({ package_manager = "pnpm" })
    end,
  },
  -- { "lervag/vimtex",          ft = "tex" },
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    opts = {},
  },

  {
    "max397574/better-escape.nvim",
    event = "VeryLazy",
    opts = {
      default_mappings = false,
      mappings = {
        i = {
          j = {
            k = "<Esc>",
            j = "<Esc>",
          },
        },
        c = {
          j = {
            k = "<Esc>",
            j = "<Esc>",
          },
        },
        t = {
          j = {
            k = "<C-\\><C-n>",
          },
        },
        s = {
          j = {
            k = "<Esc>",
          },
        },
      },
    },
  },
  { "mg979/vim-visual-multi", event = "VeryLazy" },
  { "terryma/vim-expand-region", event = "VeryLazy" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          "filename",
          "filesize",
        },
        lualine_c = {
          "diff",
          "diagnostics",
          "selectioncount",
          "searchcount",
          -- require("lsp-progress").progress
        },
        lualine_x = { "branch", "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "quickfix", "fugitive" },
    },
  },

  { "voldikss/vim-translator", cmd = { "Translate" } }, -- npm install fanyi -g 安装翻译
  {
    "barrett-ruth/import-cost.nvim",
    event = "VeryLazy",
    build = "sh install.sh pnpm",
    config = true,
  },
}
