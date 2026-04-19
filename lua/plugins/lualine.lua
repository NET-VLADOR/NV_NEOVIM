return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'catppuccin/nvim',
  },
  config = function()
    local theme = require 'core.theme-manager'

    local function setup_lualine(palette)
      -- Используем встроенную тему Catppuccin для lualine, переопределяя только palette
      local catppuccin_theme = require 'catppuccin.utils.lualine'()
      catppuccin_theme.normal = {
        a = { bg = palette.mauve, fg = palette.crust, gui = 'bold' },
        b = { bg = palette.surface0, fg = palette.text },
        c = { bg = palette.base, fg = palette.subtext1 },
      }
      catppuccin_theme.insert.a = { bg = palette.green, fg = palette.crust, gui = 'bold' }
      catppuccin_theme.visual.a = { bg = palette.peach, fg = palette.crust, gui = 'bold' }
      catppuccin_theme.replace.a = { bg = palette.red, fg = palette.crust, gui = 'bold' }
      catppuccin_theme.command.a = { bg = palette.yellow, fg = palette.crust, gui = 'bold' }

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
          theme = catppuccin_theme,
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          disabled_filetypes = { 'alpha' },
          always_divide_middle = true,
          globalstatus = true,
        },
        sections = {
          lualine_a = { mode },
          lualine_b = {
            { 'b:gitsigns_head', icon = '', color = { fg = palette.blue } },
          },
          lualine_c = { filename },
          lualine_x = {
            diagnostics,
            diff,
            fileformat,
            { 'encoding', cond = hide_in_width, color = { fg = palette.peach } },
            { 'filetype', cond = hide_in_width, color = { fg = palette.mauve } },
            { 'lsp_status', cond = hide_in_width, color = { fg = palette.blue } },
          },
          lualine_y = {
            {
              'location',
              color = { fg = palette.green },
            },
          },
          lualine_z = {
            { 'progress' },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            { 'filename', path = 1, color = { fg = palette.overlay1 } },
          },
          lualine_x = {
            { 'location', padding = 0, color = { fg = palette.overlay1 } },
          },
        },
        tabline = {},
        extensions = { 'fugitive', 'nvim-tree', 'lazy', 'mason', 'man' },
      }
    end

    setup_lualine(theme.current.palette)
    theme.subscribe(setup_lualine)
  end,
}
