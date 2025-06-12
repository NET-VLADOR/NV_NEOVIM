return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    signs_staged = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  },
  vim.keymap.set(
    'n',
    '<leader>gh',
    ':Gitsigns preview_hunk_inline<CR>',
    { noremap = true, silent = true, desc = 'Gitsigns: показать изменения Git' }
  ),
}
