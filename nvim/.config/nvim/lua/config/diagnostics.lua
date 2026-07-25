vim.diagnostic.config {
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = Icons.diagnostics.Error,
      [vim.diagnostic.severity.WARN] = Icons.diagnostics.Warn,
      [vim.diagnostic.severity.HINT] = Icons.diagnostics.Hint,
      [vim.diagnostic.severity.INFO] = Icons.diagnostics.Info,
    },
  },
  float = {
    border = 'rounded',
    max_width = 80,
    max_height = 20,
  },
}
