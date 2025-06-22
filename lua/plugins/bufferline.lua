return {
  'akinsho/bufferline.nvim',
  dependencies = {
    'moll/vim-bbye',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local bufferline = require 'bufferline'
    local theme = require 'core.theme-manager'

    local function setup_bufferline(palette)
      bufferline.setup {
        options = {
          mode = 'buffers',
          style_preset = bufferline.style_preset.default,
          themable = true,
          numbers = 'none',
          close_command = 'Bdelete! %d',
          right_mouse_command = 'vertical sbuffer %d',
          middle_mouse_command = 'Bdelete! %d',
          buffer_close_icon = '',
          close_icon = '',
          path_components = 1,
          modified_icon = '●',
          left_trunc_marker = '',
          right_trunc_marker = '',
          max_name_length = 30,
          max_prefix_length = 30,
          tab_size = 20,
          diagnostics = 'nvim_lsp',
          diagnostics_indicator = function(count, level)
            local icon = level:match 'error' and ' ' or ' '
            return ' ' .. icon .. count
          end,
          diagnostics_update_in_insert = false,
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          persist_buffer_sort = true,
          separator_style = { '', '' },
          enforce_regular_tabs = true,
          always_show_bufferline = true,
          show_tab_indicators = false,
          indicator = {
            icon = '▎',
            style = 'icon',
          },
          icon_pinned = '󰐃',
          minimum_padding = 1,
          maximum_padding = 5,
          maximum_length = 15,
          sort_by = 'insert_at_end',
          offsets = {
            {
              filetype = 'NvimTree',
              text = 'Файловый менеджер',
              text_align = 'center',
              separator = true,
            },
          },
          hover = {
            enabled = true,
            delay = 100,
            reveal = { 'close' },
          },
        },
        highlights = {
          buffer_selected = {
            bold = true,
            italic = false,
          },
          indicator_selected = {
            fg = palette.mauve,
          },
        },
      }
    end

    setup_bufferline(theme.current.palette)
    theme.subscribe(setup_bufferline)
  end,
}
