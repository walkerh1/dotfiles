-- Go
vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gosum', 'gotmpl' },
  root_markers = { 'go.work', 'go.mod', '.git' },
})
vim.lsp.enable 'gopls'

-- JS/TS
vim.lsp.config('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'html',
  },
  root_dir = function(bufnr, on_dir)
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local root = vim.fs.root(filename, {
      'tsconfig.json',
      'jsconfig.json',
      'package.json',
    })
    on_dir(root or vim.fs.dirname(filename))
  end,
})
vim.lsp.enable 'ts_ls'

-- HTML
vim.lsp.config('html_ls', {
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html' },
  root_markers = { '.git' },
})
vim.lsp.enable 'html_ls'

-- CSS
vim.lsp.config('css_ls', {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css' },
  root_markers = { '.git' },
})
vim.lsp.enable 'css_ls'

-- Lua
vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = {
    '.luarc.json',
    '.luarc.jsonc',
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
