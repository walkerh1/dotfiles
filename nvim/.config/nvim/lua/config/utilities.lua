-- Print the fg and bg of an hl-group in RGB hexcodes.
-- example usage: :HL FloatNormal
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
