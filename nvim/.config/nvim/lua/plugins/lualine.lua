return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      options = {
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          'branch',
          {
            'diagnostics',
            symbols = {
              error = Icons.diagnostics.Error,
              warn = Icons.diagnostics.Warn,
              info = Icons.diagnostics.Info,
              hint = Icons.diagnostics.Hint,
            },
          },
        },
        lualine_c = {
          {
            'lsp_status',
            icon = '',
            symbols = {
              spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
              done = '✓',
              separator = ' ',
            },
            show_name = true,
          },
          'filename'
        },
        lualine_x = {
          'encoding',
          {
            'fileformat',
            symbols = {
              unix = 'unix',
              dos = 'dos',
              mac = 'mac',
            }
          },
          'filetype'
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
