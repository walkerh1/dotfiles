return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      options = {
        globalstatus = true,
        section_separators = '',
        component_separators = '|',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
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
