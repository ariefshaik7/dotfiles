require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

--map("n", "\\", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

map("n", "\\", function()
  -- Check if the current buffer is the NvimTree
  if vim.bo.filetype == "NvimTree" then
    require("nvim-tree.api").tree.close()
  else
    require("nvim-tree.api").tree.focus()
  end
end, { desc = "Focus Tree (or Close if already focused)" })

-- Inside mappings.lua
map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Toggle Markdown Preview" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
