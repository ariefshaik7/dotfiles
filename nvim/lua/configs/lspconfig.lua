require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "yamlls", "terraformls", "ansiblels", "helm_ls", "pyright", "gopls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
