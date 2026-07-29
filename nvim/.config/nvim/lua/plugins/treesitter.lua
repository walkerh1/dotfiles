return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install {
      'bash',
      'c',
      'css',
      'csv',
      'fish',
      'go',
      'gomod',
      'gosum',
      'gowork',
      'html',
      'javascript',
      'json',
      'lua',
      'sql',
      'typescript',
      'toml',
      'vim',
      'vimdoc',
      'yaml',
      'zsh',
    }
    vim.api.nvim_create_autocmd('FileType', {
      callback = function() pcall(vim.treesitter.start) end,
    })
  end,
}
