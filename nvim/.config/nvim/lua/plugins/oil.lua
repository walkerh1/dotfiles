function _G.get_oil_winbar()
  local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local dir = require('oil').get_current_dir(bufnr)
  if dir then
    return vim.fn.fnamemodify(dir, ':~')
  else
    -- If there is no current directory (e.g. over ssh), just show the buffer name
    return vim.api.nvim_buf_get_name(0)
  end
end

return {
  'stevearc/oil.nvim',
  lazy = false,
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      watch_for_changes = true,
      win_options = {
        winbar = '%!v:lua.get_oil_winbar()',
      },
      view_options = {
        show_hidden = true,
      },
      keymaps_help = {
        border = 'rounded',
      },
      keymaps = {
        ['td'] = {
          desc = 'oil: [T]oggle File [D]etail View',
          callback = function()
            Detail = not Detail
            if Detail then
              require('oil').set_columns { 'icon', 'permissions', 'size', 'mtime' }
            else
              require('oil').set_columns { 'icon' }
            end
          end,
        },
        -- These are the same keymaps for copying paths in normal buffers, but
        -- these mappings take precedence in oil buffers, as the oil config is
        -- loaded after those other keymaps are set.
        ['<leader>cP'] = {
          desc = 'oil: [C]opy Absolute [P]ath of File Under Cursor',
          callback = function()
            local entry = require('oil').get_cursor_entry()
            if not entry then return end
            local dir = require('oil').get_current_dir()
            local path = vim.fn.fnamemodify(dir .. entry.name, '%:p')
            vim.fn.setreg('', path) -- nvim clipboard
            vim.fn.setreg('+', path) -- system clipboard
            vim.notify('Copied absolute path: ' .. path)
          end,
        },
        ['<leader>cp'] = {
          desc = 'oil: [C]opy Relative [P]ath of File Under Cursor',
          callback = function()
            local entry = require('oil').get_cursor_entry()
            if not entry then return end
            local dir = require('oil').get_current_dir()
            local path = vim.fn.fnamemodify(dir .. entry.name, ':.')
            vim.fn.setreg('', path) -- nvim clipboard
            vim.fn.setreg('+', path) -- system clipboard
            vim.notify('Copied relative path: ' .. path)
          end,
        },
      },
    }
    -- Keymap to open Oil buffer
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open [P]roject [V]iew' })
  end,
}
