-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "material-darker",

  hl_override = {
    -- Change the color of the root folder path in NvimTree
    NvimTreeRootFolder = { fg = "#7aa2f7", bold = true },

    -- Optional: Change the icon color next to the path
    -- NvimTreeFolderName = { fg = "#7aa2f7" },
    -- NvimTreeOpenedFolderName = { fg = "#7aa2f7" },
  },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

M.ui = {
  statusline = {
    -- We redefine the order to REMOVE "cwd" and "cursor"
    -- The standard default is usually: { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "vcs", "cursor", "cwd" }
    modules = {
      total_lines = function()
        -- returns an icon and the total line count (vim.fn.line('$'))
        return " %#StText#   " .. vim.fn.line "$" .. " "
      end,
    },

    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "total_lines" },
  },
}

return M
