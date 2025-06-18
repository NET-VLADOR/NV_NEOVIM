return {
  -- https://github.com/catppuccin/nvim
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    -- Состояние прозрачности (по умолчанию выключено)
    local bg_transparent = false

    -- Базовые настройки темы
    local catppuccin_config = {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      transparent_background = bg_transparent,
      -- Добавьте другие настройки здесь
    }

    -- Применение конфигурации
    require('catppuccin').setup(catppuccin_config)
    vim.cmd.colorscheme 'catppuccin'

    -- Функция переключения прозрачности
    local function toggle_transparency()
      bg_transparent = not bg_transparent

      -- Обновляем конфиг
      catppuccin_config.transparent_background = bg_transparent
      require('catppuccin').setup(catppuccin_config)

      -- Перезагружаем тему
      vim.cmd.colorscheme 'catppuccin'

      -- Опционально: уведомление о состоянии
      local state = bg_transparent and 'ВКЛ' or 'ВЫКЛ'
      print('Прозрачный фон: ' .. state)
    end

    -- Назначение горячей клавиши
    vim.keymap.set('n', '<leader>tt', toggle_transparency, {
      noremap = true,
      silent = true,
      desc = 'Переключить прозрачность фона',
    })
  end,
}
