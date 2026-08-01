local group = vim.api.nvim_create_augroup('UserConfig', { clear = true })

-- Highlight text on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = group,
  callback = function() vim.hl.on_yank() end,
})
