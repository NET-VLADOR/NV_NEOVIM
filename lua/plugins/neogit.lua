return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  keys = {
    { '<leader>N', '<cmd>Neogit kind=floating<CR>', desc = 'Neogit: открыть плавающее окно' },
  },
}
