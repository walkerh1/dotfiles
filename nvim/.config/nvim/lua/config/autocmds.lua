local group = vim.api.nvim_create_augroup('UserConfig', { clear = true })

-- Highlight text on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = group,
  callback = function() vim.highlight.on_yank() end,
})

vim.api.nvim_create_user_command('HL', function(opts)
  local hl = vim.api.nvim_get_hl(0, {
    name = opts.args,
    link = false,
  })
  vim.print '{'
  if hl.fg then print(string.format('\tfg=#%06x,', hl.fg)) end
  if hl.bg then print(string.format('\tbg=#%06x,', hl.bg)) end
  vim.print '}'
end, {
  nargs = 1,
})
