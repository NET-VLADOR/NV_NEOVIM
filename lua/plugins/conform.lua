return {
  -- https://github.com/stevearc/conform.nvim
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettierd', stop_after_first = true },
      typescript = { 'prettierd', stop_after_first = true },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
  },
}
