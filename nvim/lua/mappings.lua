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

-- ====================================================================
-- NvChad v2.5 -> VS Code Keybindings Bridge (macOS Optimized)
-- ====================================================================
if vim.g.vscode then
    local map = vim.keymap.set
    local vscode = require("vscode")

    -- Quick Escape (Drop from Insert to Normal Mode seamlessly on your home row)
    map("i", "jk", "<Esc>", { desc = "VSCode: Escape to Normal Mode" })

    -- 1. FUZZY FIND: Launches the native project file switcher (Cmd+P behavior)
    map("n", "<leader>f", function()
        vscode.action("workbench.action.quickOpen")
    end, { desc = "VSCode: Fuzzy Find Files" })

    -- 2. LIVE GREP: Full project search across all workspace files via Ripgrep
    map("n", "<leader>g", function()
        vscode.action("workbench.action.findInFiles")
    end, { desc = "VSCode: Live Grep Search" })

    -- 3. LOCAL SEARCH: Find text directly inside your active open editor buffer
    map("n", "<leader>s", function()
        vscode.action("actions.find")
    end, { desc = "VSCode: Search Current Buffer" })

    -- 4. REFRACTOR & REPLACE: Opens global project-wide find and replace panel
    map("n", "<leader>r", function()
        vscode.action("workbench.action.replaceInFiles")
    end, { desc = "VSCode: Global Replace" })

    -- 5. CODE INTELLIGENCE: Bridge NvChad shortcuts to native VS Code LSP actions
    map("n", "gd", function()
        vscode.action("editor.action.revealDefinition")
    end, { desc = "VSCode: Go to Definition" })

    map("n", "gp", function()
        vscode.action("editor.action.peekDefinition")
    end, { desc = "VSCode: Peek Definition" })

    map("n", "gr", function()
        vscode.action("editor.action.goToReferences")
    end, { desc = "VSCode: Go to References" })

    map("n", "<leader>rn", function()
        vscode.action("editor.action.rename")
    end, { desc = "VSCode: Rename Symbol" })

    map("n", "<leader>ca", function()
        vscode.action("editor.action.quickFix")
    end, { desc = "VSCode: Code Actions / Quick Fix" })
end
