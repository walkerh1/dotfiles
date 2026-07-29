return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      signs = {
        add = { text = '┃' },
        change = { text = '┃' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
      signs_staged = {
        add = { text = '┃' },
        change = { text = '┃' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
      preview_config = {
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
        border = 'rounded',
      },
      sign_priority = 100, -- always shows and always leftmost in gutter
      attach_to_untracked = true,
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'gitsigns: Jump to Next [C]hange' })
        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'gitsigns: Jump to Previous [C]hange' })

        -- Line actions
        map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end, { desc = 'gitsigns: Open [B]lame Line in Floating Window' })

        -- Hunk actions
        map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'gitsigns: [S]tage [H]unk' })
        map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end, { desc = 'gitsigns: [R]eset [H]unk' })
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'gitsigns: [S]tage [H]unk' })
        map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'gitsigns: [U]ndo Stage [H]unk' })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'gitsigns: [R]eset [H]unk' })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'gitsigns: [P]review [H]unk in FLoating Window' })

        -- Buffer actions
        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'gitsigns: [S]tage Buffer' })
        map('n', '<leader>hU', gitsigns.reset_buffer_index, { desc = 'gitsigns: [U]ndo All Staged Hunks in Buffer' })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'gitsigns: [R]eset Buffer' })
        map('n', '<leader>hB', gitsigns.blame, { desc = 'gitsigns: Open [B]lame Current File' })
        map('n', '<leader>hd', gitsigns.diffthis, { desc = 'gitsigns: Open [D]iff Against Index' })
        map('n', '<leader>hD', function() gitsigns.diffthis '~1' end, { desc = 'gitsigns: Open [D]iff Against Last Commit' })
        map('n', '<leader>hq', function()
          print 'sending hunks in buffer to qf list'
          gitsigns.setqflist(0, { open = false }, function() require('telescope.builtin').quickfix() end)
        end, { desc = 'gitsigns: Send [H]unks in Buffer to [Q]uickfix List' })

        -- Repo actions
        map('n', '<leader>hQ', function()
          gitsigns.setqflist('all', { open = false }, function() require('telescope.builtin').quickfix() end)
        end, { desc = 'gitsigns: Send All [H]unks in Repo to [Q]uickfix List' })

        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'gitsigns: [T]oggle Show Inline [B]lame' })
        map('n', '<leader>td', gitsigns.toggle_deleted, { desc = 'gitsigns: [T]oggle Show [D]eleted' })
        map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'gitsigns: [T]oggle Show [W]ord Diff' })

        -- Text object
        map({ 'o', 'x' }, 'ih', gitsigns.select_hunk, { desc = 'gitsigns: [S]elect [H]unk Under Cursor' })
      end,
    }
  end,
}
