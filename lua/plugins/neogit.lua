return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  keys = {
    { '<leader>G', '<cmd>Neogit kind=floating<CR>', desc = 'Neogit: открыть плавающее окно' },
  },
}
