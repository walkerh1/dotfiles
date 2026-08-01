return {
  'saghen/blink.cmp',
  version = '1.*',
  opts = {
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        window = { border = 'rounded' },
      },
    },
    signature = {
      enabled = true,
      trigger = { show_on_insert = true },
      window = { border = 'rounded' },
    },
    sources = {
      default = { 'lsp', 'path', 'buffer' },
    },
    keymap = {
      ['<CR>'] = { 'accept', 'fallback' },
    },
  },
}
