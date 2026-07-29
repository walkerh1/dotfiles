-- Start with 'default' colorscheme

-- Set buffer bg colour
vim.api.nvim_set_hl(0, 'Normal', {
  bg = '#282c34', -- 'Ghostty Default Style Dark' background colour
  update = true,
})

-- Set font color of constants
vim.api.nvim_set_hl(0, 'Constant', {
  fg = '#f0c674', -- 'Ghostty Default Style Dark' yellow
  update = true,
})

-- Set font color of statements (package, func, if, else etc.)
vim.api.nvim_set_hl(0, 'Statement', {
  fg = '#b294bb', -- 'Ghostty Default Style Dark' magenta
  update = true,
})

-- Set font color of operators (=, ==, !=, &, * etc.)
vim.api.nvim_set_hl(0, 'Operator', {
  fg = '#b294bb', -- 'Ghostty Default Style Dark' magenta
  update = true,
})

-- Set command line bg colour (this is the area under the status bar)
vim.api.nvim_set_hl(0, 'MsgArea', {
  bg = '#1d1f21', -- 'Ghostty Default Style Dark' black
  fg = '#c5c8c6', -- 'Ghostty Default Style Dark' white
  update = true,
})
