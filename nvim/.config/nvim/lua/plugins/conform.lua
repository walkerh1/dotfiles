return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function() require('conform').format { async = true } end,
      mode = { 'n', 'v' },
      desc = '[F]ormat Buffer',
    },
  },
  opts = {
    formatters_by_ft = {
      css = { 'prettierd' },
      go = { 'goimports', 'gofmt' }, -- organise imports, then format
      javascript = { 'prettierd' },
      html = { 'prettierd' },
      json = { 'jq' },
      lua = { 'stylua' },
    },
    format_on_save = { timeout_ms = 500 },
  },
}
