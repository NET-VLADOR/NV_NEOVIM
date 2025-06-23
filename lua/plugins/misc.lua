return {
  {
    'christoomey/vim-tmux-navigator',
  },
  {
    'tpope/vim-sleuth',
  },
  {
    'tpope/vim-fugitive',
  },
  {
    'tpope/vim-rhubarb',
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  {
    'windwp/nvim-ts-autotag',
    opts = {
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = false,
    },
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = true },
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'nvzone/showkeys',
    cmd = 'ShowkeysToggle',
    opts = {
      maxkeys = 5,
    },
    keys = {
      { '<leader>ts', '<cmd>ShowkeysToggle<CR>', desc = 'Переключить видимость нажимаемых клавиш' },
    },
  },
  {
    'davidmh/mdx.nvim',
    config = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
}
