-- Lazygit: интеграция через терминал snacks.nvim
return {
  'kdheepak/lazygit.nvim',
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentRepo',
    'LazyGitFilter',
    'LazyGitFilterCurrentRepo',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>G', '<cmd>LazyGit<CR>', desc = 'Lazygit: открыть' },
  },
  init = function()
    -- Опционально: задать размер окна
    vim.g.lazygit_floating_window_scaling_factor = 0.9
    vim.g.lazygit_floating_window_winblend = 0
    vim.g.lazygit_use_neovim_remote = 1
  end,
}
