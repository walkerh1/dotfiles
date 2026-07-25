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
            'diff',
            colored = true,
            symbols = {
              added = Icons.git.Added,
              modified = Icons.git.Modified,
              removed = Icons.git.Removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
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
        lualine_c = { 'filename' },
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
