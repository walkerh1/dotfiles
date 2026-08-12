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

-- HTML/CSS: set font color of tag
vim.api.nvim_set_hl(0, 'HtmlTag', { fg = '#a6dbff' })
vim.api.nvim_set_hl(0, '@tag.html', { link = 'HtmlTag' })
vim.api.nvim_set_hl(0, '@tag.css', { link = 'HtmlTag' })

-- HTML: set font color of attr
vim.api.nvim_set_hl(0, 'HtmlAttribute', { fg = '#e0e2ea' })
vim.api.nvim_set_hl(0, '@tag.attribute.html', { link = 'HtmlAttribute' })

-- HTML: set font color of delimiter
vim.api.nvim_set_hl(0, 'HtmlDelimiter', { fg = '#9b9ea4' })
vim.api.nvim_set_hl(0, '@tag.delimiter.html', { link = 'HtmlDelimiter' })

-- CSS: set font color of property
vim.api.nvim_set_hl(0, 'CssProperty', { fg = '#e0e2ea' })
vim.api.nvim_set_hl(0, '@property.css', { link = 'CssProperty' })

-- Go: map 'nil' and 'iota' to Constant instead of default 'Special' hl group
vim.api.nvim_set_hl(0, '@constant.builtin.go', { link = 'Constant' })
