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
      go = { 'goimports', 'gofmt' },
      json = { 'jq' },
      lua = { 'stylua' },
    },
    format_on_save = function(bufnr)
      -- Filetypes not to be formatted on save.
      local ignore_filetypes = {}
      if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then return end
      -- Ensure format_on_save respects global and buffer autoformat settings
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then return end
      return { timeout_ms = 500, lsp_format = 'fallback' }
    end,
  },
}
