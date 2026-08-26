local map = vim.keymap.set

-- Use "jj" to go from INSERT to NORMAL mode
map('i', 'jj', '<Esc>', { desc = 'Escape INSERT mode' })

-- Move highlighted text up and down (respects indentation)
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Shift highlighted text up' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Shift highlighted text down' })

-- Simplify moving between windows
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Turn highlighting off (after successful search)
map('n', '<C-s>', ':nohlsearch<CR>', { desc = 'Turn off highlighting after search' })

-- Add versions of yank that copy to system clipboard
map('n', '<leader>y', '"+y', { desc = '[Y]ank line to system clipboard' })
map('v', '<leader>y', '"+y', { desc = '[Y]ank highlighted text to system clipboard' })

-- LSP (more LSP keymaps managed by plugins.telescope)
map('n', 'K', function() vim.lsp.buf.hover { border = 'rounded', max_width = 80, max_height = 20 } end, { desc = 'lsp: Show Documentation' })
map('n', 'rn', vim.lsp.buf.rename, { desc = 'lsp: [R]e[n]ame' })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'lsp: [C]ode [A]ction' })

-- Diagnostics
map('n', '[d', function() vim.diagnostic.jump { count = -1, float = true } end, { desc = 'diagnostics: Go to Previous [D]iagnostic Message' })
map('n', ']d', function() vim.diagnostic.jump { count = 1, float = true } end, { desc = 'diagnostics: Go to Next [D]iagnostic Message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'diagnostics: Show Diagnostic [E]rror messages' })

-- Copy absolute and relative file paths
map('n', '<leader>cP', function()
  local path = vim.fn.expand '%:p'
  vim.fn.setreg('', path) -- nvim clipboard
  vim.fn.setreg('+', path) -- system clipboard
  vim.notify('Copied absolute path: ' .. path)
end, { desc = '[C]opy [A]bsolute Path of Current Buffer' })
map('n', '<leader>cp', function()
  local path = vim.fn.expand '%:.'
  vim.fn.setreg('', path) -- nvim clipboard
  vim.fn.setreg('+', path) -- system clipboard
  vim.notify('Copied relative path: ' .. path)
end, { desc = '[C]opy [R]elative Path of Current Buffer' })
