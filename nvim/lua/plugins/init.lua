return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettierd",
        "isort",
        "black",
        -- DevOps Tools
        "terraform-ls",
        "tflint",
        "json-lsp",
        "ansible-language-server",
        "yaml-language-server",
        "dockerfile-language-server",

        -- GOLANG
        "gopls", -- The Official Go Language Server (LSP)
        "delve", -- The Official Go Debugger
        "gofumpt", -- The strictest formatter (Standard in 2024)
        "goimports", -- Automatically handles imports
        "golangci-lint", -- The mega-linter for Go
      },
    },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    config = function()
      require("render-markdown").setup {
        heading = {
          position = "inline", -- This makes headings look like normal text but bigger/bold
          icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " }, -- (Optional) Adds nice icons for H1-H6
        },
        code = {
          style = "full", -- Highlights the whole code block background
        },
        bullet = {
          icons = { "●", "○", "◆", "◇" }, -- Custom bullet points
        },
        checkbox = {
          unchecked = { icon = "󰄱 " }, -- Fixed syntax for latest version
          checked = { icon = "󰱒 " },
        },
        pipe_table = {
          style = "full", -- Draws full table borders
        },
      }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "bash",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "terraform",
        "hcl",
        "yaml",
        "dockerfile",
        "python",
      },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      sync_root_with_cwd = true, -- Keep tree synced with :cd
      renderer = { root_folder_label = ":~" },

      on_attach = function(bufnr)
        local api = require "nvim-tree.api"
        api.config.mappings.default_on_attach(bufnr)

        -- Custom Enter: Do nothing on Root, otherwise open/expand
        vim.keymap.set("n", "<CR>", function()
          local node = api.tree.get_node_under_cursor()
          -- Only call edit if we are NOT on the root node
          if node.absolute_path ~= vim.fn.getcwd() then
            api.node.open.edit()
          end
        end, { buffer = bufnr, noremap = true, silent = true, nowait = true })
      end,
    },
  },

  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   opts = {
  --     renderer = {
  --       -- ":~" shows relative path (e.g., ~/projects/nvim)
  --       -- ":p" shows full absolute path (e.g., /home/user/projects/nvim)
  --       -- true shows just the folder name (default)
  --       root_folder_label = ":~",
  --     },
  --   },
  -- },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  {
    "RRethy/vim-illuminate",
    config = function()
      require('illuminate').configure({
        providers = {
          'lsp',
          'treesitter',
          'regex',
        },
      })
    end,
  },
}
