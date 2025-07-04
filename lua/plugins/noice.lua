return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    { 'MunifTanjim/nui.nvim', module = 'nui' },
    {
      'rcarriga/nvim-notify',
      module = 'notify',
      opts = {
        background_colour = '#000000',
        timeout = 2000,
        merge_duplicates = true,
      },
    },
  },
  opts = {
    views = {
      cmdline_popup = {
        position = {
          row = '50%',
          col = '50%',
        },
        size = {
          width = 60,
          height = 'auto',
        },
      },
      popupmenu = {
        relative = 'editor',
        position = {
          row = '67%',
          col = '50%',
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = 'rounded',
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = {
            Normal = 'Normal',
            FloatBorder = 'DiagnosticInfo',
          },
        },
      },
    },
  },
}
