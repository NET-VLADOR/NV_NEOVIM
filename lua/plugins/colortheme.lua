return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    local theme = require 'core.theme-manager'

    theme.setup()

    vim.keymap.set('n', '<leader>tt', theme.toggle_transparency, {
      noremap = true,
      silent = true,
      desc = 'Переключить прозрачность фона',
    })

    vim.keymap.set('n', '<leader>tc', theme.show_flavour_menu, {
      noremap = true,
      silent = true,
      desc = 'Выбрать тему Catppuccin',
    })

    vim.keymap.set('n', '<leader>tfl', function()
      theme.set_flavour 'latte'
    end, {
      noremap = true,
      silent = true,
      desc = 'Тема: Latte (светлая)',
    })

    vim.keymap.set('n', '<leader>tff', function()
      theme.set_flavour 'frappe'
    end, {
      noremap = true,
      silent = true,
      desc = 'Тема: Frappe',
    })

    vim.keymap.set('n', '<leader>tfm', function()
      theme.set_flavour 'macchiato'
    end, {
      noremap = true,
      silent = true,
      desc = 'Тема: Macchiato',
    })

    vim.keymap.set('n', '<leader>tfM', function()
      theme.set_flavour 'mocha'
    end, {
      noremap = true,
      silent = true,
      desc = 'Тема: Mocha (тёмная)',
    })

    vim.api.nvim_create_user_command('CatppuccinFlavour', theme.show_flavour_menu, {
      nargs = 0,
    })
  end,
}
