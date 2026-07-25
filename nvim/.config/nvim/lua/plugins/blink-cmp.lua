return {
  'saghen/blink.cmp',
  version = '1.*',
  opts = {
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
      }
    },
    signature = {
      enabled = true
    },
    snippets = {
      preset = 'default',
    },
    keymap = {
      ['<CR>'] = { 'accept', 'fallback' },
    },
    cmdline = {
      enabled = true
    },
  }
}
