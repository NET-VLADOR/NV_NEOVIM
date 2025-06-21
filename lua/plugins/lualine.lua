return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'catppuccin/nvim',
  },
  config = function()
    local catppuccin = require('catppuccin.palettes').get_palette()

    local custom_catppuccin = {
      normal = {
        a = { bg = catppuccin.mauve, fg = catppuccin.crust, gui = 'bold' },
        b = { bg = catppuccin.surface0, fg = catppuccin.text },
        c = { bg = catppuccin.base, fg = catppuccin.subtext1 },
      },
      insert = {
        a = { bg = catppuccin.green, fg = catppuccin.crust, gui = 'bold' },
        b = { bg = catppuccin.surface0, fg = catppuccin.text },
        c = { bg = catppuccin.base, fg = catppuccin.subtext1 },
      },
      visual = {
        a = { bg = catppuccin.peach, fg = catppuccin.crust, gui = 'bold' },
        b = { bg = catppuccin.surface0, fg = catppuccin.text },
        c = { bg = catppuccin.base, fg = catppuccin.subtext1 },
      },
      replace = {
        a = { bg = catppuccin.red, fg = catppuccin.crust, gui = 'bold' },
        b = { bg = catppuccin.surface0, fg = catppuccin.text },
        c = { bg = catppuccin.base, fg = catppuccin.subtext1 },
      },
      command = {
        a = { bg = catppuccin.yellow, fg = catppuccin.crust, gui = 'bold' },
        b = { bg = catppuccin.surface0, fg = catppuccin.text },
        c = { bg = catppuccin.base, fg = catppuccin.subtext1 },
      },
      inactive = {
        a = { bg = catppuccin.surface1, fg = catppuccin.overlay0 },
        b = { bg = catppuccin.surface1, fg = catppuccin.overlay0 },
        c = { bg = catppuccin.base, fg = catppuccin.overlay0 },
      },
    }

    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str
      end,
      padding = { left = 1, right = 1 },
    }

    local filename = {
      'filename',
      file_status = true,
      path = 1,
      symbols = { modified = ' ', readonly = ' ' },
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 120
    end

    local fileformat = {
      'fileformat',
      symbols = {
        unix = ' LF',
        dos = ' CRLF',
        mac = ' CR',
      },
      cond = hide_in_width,
    }

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn', 'info', 'hint' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = true,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      'diff',
      colored = true,
      symbols = { added = ' ', modified = ' ', removed = ' ' },
      cond = hide_in_width,
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = custom_catppuccin,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'neo-tree' },
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = {
          {
            'b:gitsigns_head',
            icon = '',
            color = { fg = catppuccin.blue },
          },
        },
        lualine_c = { filename },
        lualine_x = {
          diagnostics,
          diff,
          fileformat,
          {
            'encoding',
            cond = hide_in_width,
            color = { fg = catppuccin.peach },
          },
          {
            'filetype',
            cond = hide_in_width,
            color = { fg = catppuccin.mauve },
          },
        },
        lualine_y = {
          {
            'location',
            color = { fg = catppuccin.green },
          },
        },
        lualine_z = {
          {
            'progress',
          },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            path = 1,
            color = { fg = catppuccin.overlay1 },
          },
        },
        lualine_x = {
          {
            'location',
            padding = 0,
            color = { fg = catppuccin.overlay1 },
          },
        },
      },
      tabline = {},
      extensions = { 'fugitive', 'nvim-tree' },
    }
  end,
}
