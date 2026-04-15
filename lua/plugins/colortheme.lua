return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    local theme = require 'core.theme-manager'
    theme.setup()

    local map = vim.keymap.set
    local opts = function(desc)
      return { noremap = true, silent = true, desc = desc }
    end

    map('n', '<leader>tt', theme.toggle_transparency, opts 'Переключить прозрачность фона')
    map('n', '<leader>tc', theme.show_flavour_menu, opts 'Выбрать тему Catppuccin')

    local flavours = {
      { key = 'tfl', name = 'latte', desc = 'Тема: Latte (светлая)' },
      { key = 'tff', name = 'frappe', desc = 'Тема: Frappe' },
      { key = 'tfm', name = 'macchiato', desc = 'Тема: Macchiato' },
      { key = 'tfM', name = 'mocha', desc = 'Тема: Mocha (тёмная)' },
    }

    for _, f in ipairs(flavours) do
      map('n', '<leader>' .. f.key, function()
        theme.set_flavour(f.name)
      end, opts(f.desc))
    end

    vim.api.nvim_create_user_command('CatppuccinFlavour', theme.show_flavour_menu, { nargs = 0 })
  end,
}
