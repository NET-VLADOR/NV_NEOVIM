return {
  -- https://github.com/NeogitOrg/neogit
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    'nvim-telescope/telescope.nvim', -- optional
  },
  config = function()
    vim.keymap.set(
      'n',
      '<leader>N',
      ':Neogit kind=floating<CR>',
      { noremap = true, silent = true, desc = 'Neogit: открыть плавающее окно' }
    )
  end,
}
