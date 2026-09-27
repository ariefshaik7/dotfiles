local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    html = { "prettierd" },
    yaml = { "prettierd" },
    json = { "prettier" },
    markdown = { "prettier" },
    terraform = { "terraform_fmt" },
    tf = { "terraform_fmt" },
    python = { "isort", "black" },
    go = { "goimports", "gofumpt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
