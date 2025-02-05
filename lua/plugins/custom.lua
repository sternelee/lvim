-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  { import = "lazyvim.plugins.extras.coding.mini-surround" },
  { import = "lazyvim.plugins.extras.editor.inc-rename" },
  -- { import = "lazyvim.plugins.extras.editor.navic" },
  { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
  { import = "lazyvim.plugins.extras.coding.mini-comment" },
  { import = "lazyvim.plugins.extras.coding.mini-surround" },
  { import = "lazyvim.plugins.extras.coding.yanky" },
  -- { import = "lazyvim.plugins.extras.editor.mini-diff" },
  { import = "lazyvim.plugins.extras.editor.mini-move" },
  -- { import = "lazyvim.plugins.extras.ui.mini-animate" },

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
    "folke/snacks.nvim",
    opts = {
      picker = {},
    },
    keys = {
      {
        "<leader>'",
        function()
          Snacks.picker.resume()
        end,
        desc = "Resume",
      },
    },
  },

  -- {
  --   "hrsh7th/nvim-cmp",
  --   event = { "InsertEnter", "CmdlineEnter" },
  --   dependencies = {
  --     "onsails/lspkind.nvim",
  --     "xzbdmw/colorful-menu.nvim",
  --     {
  --       "petertriho/cmp-git",
  --       opts = {},
  --     },
  --     "hrsh7th/cmp-emoji",
  --     "hrsh7th/cmp-calc",
  --     "roginfarrer/cmp-css-variables",
  --     {
  --       "luckasRanarison/tailwind-tools.nvim",
  --       name = "tailwind-tools",
  --       build = ":UpdateRemotePlugins",
  --       opts = {},
  --     },
  --     "hrsh7th/cmp-cmdline",
  --   },
  --   opts = function()
  --     vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
  --     local cmp = require("cmp")
  --     local defaults = require("cmp.config.default")()
  --     local auto_select = false
  --
  --     cmp.setup.cmdline({ "/", "?" }, {
  --       mapping = cmp.mapping.preset.cmdline(),
  --       sources = {
  --         { name = "buffer" },
  --         { name = "cmdline_history" },
  --         { name = "path" },
  --       },
  --     })
  --
  --     cmp.setup.cmdline(":", {
  --       mapping = cmp.mapping.preset.cmdline(),
  --       sources = {
  --         { name = "path" },
  --         { name = "cmdline", option = { ignore_cmds = {} } },
  --         { name = "cmdline_history" },
  --       },
  --     })
  --     return {
  --       auto_brackets = {},
  --       completion = {
  --         completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
  --       },
  --       preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
  --       mapping = cmp.mapping.preset.insert({
  --         ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --         ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  --         -- ["<tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<S-tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  --         ["<C-Space>"] = cmp.mapping.complete(),
  --         ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
  --         ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
  --         ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --         ["<C-CR>"] = function(fallback)
  --           cmp.abort()
  --           fallback()
  --         end,
  --         ["<tab>"] = function(fallback)
  --           return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
  --         end,
  --       }),
  --       sources = cmp.config.sources({
  --         { name = "lazydev" },
  --         { name = "nvim_lsp" },
  --         { name = "path" },
  --         { name = "calc" },
  --         { name = "emoji" },
  --         { name = "git" },
  --         { name = "css-variables" },
  --       }, {
  --         { name = "buffer" },
  --       }),
  --       formatting = {
  --         expandable_indicator = true,
  --         fields = { "kind", "abbr", "menu" },
  --         before = require("tailwind-tools.cmp").lspkind_format,
  --         format = function(entry, item)
  --           local highlights_info = require("colorful-menu").cmp_highlights(entry)
  --
  --           -- if highlight_info==nil, which means missing ts parser, let's fallback to use default `vim_item.abbr`.
  --           -- What this plugin offers is two fields: `vim_item.abbr_hl_group` and `vim_item.abbr`.
  --           if highlights_info ~= nil then
  --             item.abbr_hl_group = highlights_info.highlights
  --             item.abbr = highlights_info.text
  --           end
  --           local icons = LazyVim.config.icons.kinds
  --           if icons[item.kind] then
  --             item.kind = icons[item.kind] .. item.kind
  --           end
  --
  --           local widths = {
  --             abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
  --             menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
  --           }
  --
  --           for key, width in pairs(widths) do
  --             if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
  --               item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
  --             end
  --           end
  --
  --           return item
  --         end,
  --       },
  --       experimental = {
  --         -- only show ghost text when we show ai completions
  --         ghost_text = vim.g.ai_cmp and {
  --           hl_group = "CmpGhostText",
  --         } or false,
  --       },
  --       sorting = defaults.sorting,
  --     }
  --   end,
  -- },

  {
    "saghen/blink.cmp",
    dependencies = {
      "saghen/blink.compat",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-calc",
      "roginfarrer/cmp-css-variables",
      "xzbdmw/colorful-menu.nvim",
    },
    opts = {
      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
        menu = {
          draw = {
            treesitter = { "lsp" },
            components = {
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          -- enabled = vim.g.ai_cmp,
          enabled = false,
        },
      },
      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          "lazydev",
          -- "npm",
          -- "crates",
          "codecompanion",
          "avante_commands",
          "avante_mentions",
          "avante_files",
        },
        compat = {
          "emoji",
          "calc",
          "css-variables",
          "avante_commands",
          "avante_mentions",
          "avante_files",
        },
        -- cmdline = function()
        --   local type = vim.fn.getcmdtype()
        --   if type == "/" or type == "?" then
        --     return { "buffer" }
        --   end
        --   if type == ":" or type == "@" then
        --     return { "cmdline" }
        --   end
        --   return {}
        -- end,
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100, -- show at a higher priority than lsp
          },
          emoji = {
            name = "emoji",
            module = "blink.compat.source",
            opts = {},
          },
          calc = {
            name = "calc",
            module = "blink.compat.source",
            opts = {},
          },
          css_variables = {
            name = "css_variables",
            module = "blink.compat.source",
            opts = {},
          },
          -- npm = {
          --   name = "npm",
          --   module = "blink.compat.source",
          --   opts = {
          --     keyword_length = 3,
          --   },
          -- },
          -- crates = {
          --   name = "crates",
          --   module = "blink.compat.source",
          --   opts = {},
          -- },
          avante_commands = {
            name = "avante_commands",
            module = "blink.compat.source",
            score_offset = 90, -- show at a higher priority than lsp
            opts = {},
          },
          avante_files = {
            name = "avante_commands",
            module = "blink.compat.source",
            score_offset = 100, -- show at a higher priority than lsp
            opts = {},
          },
          avante_mentions = {
            name = "avante_mentions",
            module = "blink.compat.source",
            score_offset = 1000, -- show at a higher priority than lsp
            opts = {},
          },
        },
      },
    },
  },

  {
    "Saecki/crates.nvim",
    event = "BufRead Cargo.toml",
    config = true,
    -- keys = {
    --   {
    --     "<leader>ct",
    --     "<cmd>lua require('creates').toggle()<CR>",
    --     desc = "creates toggle",
    --   },
    --   {
    --     "<leader>cv",
    --     "<cmd>lua require('creates').show_versions_popup()<CR>",
    --     desc = "creates show version",
    --   },
    -- },
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
    -- keys = {
    --   {
    --     "<leader>ns",
    --     "<cmd>lua require('package-info').show()<CR>",
    --     desc = "package-info show",
    --   },
    --   {
    --     "<leader>np",
    --     "<cmd>lua require('package-info').change_version()<CR>",
    --     desc = "package-info change version",
    --   },
    --   {
    --     "<leader>ni",
    --     "<cmd>lua require('package-info').install()<CR>",
    --     desc = "package-info install",
    --   },
    -- },
  },
  -- { "lervag/vimtex",          ft = "tex" },
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    opts = {},
  },

  { "akinsho/toggleterm.nvim", version = "*", config = true, event = "VeryLazy" },

  {
    "max397574/better-escape.nvim",
    event = "VeryLazy",
    vscode = true,
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
  { "terryma/vim-expand-region", event = "VeryLazy", vscode = true },

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

  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "toppair/reach.nvim",
        config = function()
          require("reach").setup({ notifications = true })
        end,
      },
    },
    opts = {
      default_mappings = true,
      builtin_marks = { ".", "<", ">", "^" },
      cyclic = true,
      force_write_shada = false,
      refresh_interval = 250,
      sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
      excluded_filetypes = {},
      bookmark_0 = {
        sign = "⚑",
        virt_text = "sterne",
      },
      mappings = {},
    },
  },

  { "voldikss/vim-translator", cmd = { "Translate" } }, -- npm install fanyi -g 安装翻译
  {
    "barrett-ruth/import-cost.nvim",
    event = "VeryLazy",
    build = "sh install.sh pnpm",
    config = true,
  },
  { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },
  { "wakatime/vim-wakatime", event = "VeryLazy" },
}
