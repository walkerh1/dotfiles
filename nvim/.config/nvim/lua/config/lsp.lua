-- Go
vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go' },
  root_markers = {
    'go.mod',
    '.git',
  }
})
vim.lsp.enable 'gopls'

-- JS/TS
vim.lsp.config('ts_ls', {
  cmd = {
    "typescript-language-server",
    "--stdio",
  },
  filetypes = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
  },
  root_markers = {
    "tsconfig.json",
    "jsconfig.json",
    "package.json",
    ".git",
  },
})
vim.lsp.enable 'ts_ls'

-- HTML
vim.lsp.config('html', {
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html', 'gotmpl' },
  root_markers = { '.git' },
})
vim.lsp.enable 'html'

-- CSS
vim.lsp.config('cssls', {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css' },
  root_markers = { '.git' },
})
vim.lsp.enable 'cssls'

-- Lua
vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = {
    '.git',
  },
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
vim.lsp.enable 'lua_ls'
