return {
  'nvim-lualine/lualine.nvim',
  config = function()
    -- Настройка отображения текущего режима Vim
    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str -- Добавляем иконку перед названием режима
        -- Альтернативный вариант: return ' ' .. str:sub(1, 1) -- Показывать только первую букву режима
      end,
    }

    -- Настройка отображения имени файла
    local filename = {
      'filename',
      file_status = true, -- Показывать статус файла (только для чтения, изменен)
      path = 1, -- 0 = только имя, 1 = относительный путь, 2 = абсолютный путь
    }

    -- Функция для скрытия компонентов на узких экранах
    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100 -- Показывать компонент только если ширина окна > 100 символов
    end

    -- Настройка отображения диагностик
    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' }, -- Источник диагностик
      sections = { 'error', 'warn' }, -- Показывать только ошибки и предупреждения
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }, -- Иконки для диагностик
      colored = false, -- Не использовать цветовую подсветку
      update_in_insert = false, -- Не обновлять в режиме вставки
      always_visible = false, -- Не показывать постоянно
      cond = hide_in_width, -- Условие отображения (только на широких экранах)
    }

    -- Настройка отображения изменений в Git
    local diff = {
      'diff',
      colored = false, -- Отключить цветовую подсветку
      symbols = { added = ' ', modified = ' ', removed = ' ' }, -- Иконки для изменений
      cond = hide_in_width, -- Условие отображения (только на широких экранах)
    }

    -- Основная настройка lualine
    require('lualine').setup {
      options = {
        icons_enabled = true, -- Включить иконки
        theme = 'nord', -- Тема оформления
        -- Полезные символы разделителей:
        -- https://www.nerdfonts.com/cheat-sheet
        --        
        section_separators = { left = '', right = '' }, -- Разделители секций
        component_separators = { left = '', right = '' }, -- Разделители компонентов
        disabled_filetypes = { 'alpha', 'neo-tree' }, -- Отключить для указанных типов файлов
        always_divide_middle = true, -- Всегда разделять среднюю секцию
      },
      -- Активные секции (для обычных окон)
      sections = {
        lualine_a = { mode }, -- Левый край: текущий режим
        lualine_b = { 'branch' }, -- Ветка Git
        lualine_c = { filename }, -- Имя файла/путь
        lualine_x = { -- Правая часть (различная информация)
          diagnostics, -- Диагностики
          diff, -- Git diff
          { 'encoding', cond = hide_in_width }, -- Кодировка файла
          { 'filetype', cond = hide_in_width }, -- Тип файла
        },
        lualine_y = { 'location' }, -- Положение курсора (строка:столбец)
        lualine_z = { 'progress' }, -- Прогресс (текущая/всего строк)
      },
      -- Неактивные секции (для неактивных окон)
      inactive_sections = {
        lualine_a = {}, -- Пустая секция
        lualine_b = {}, -- Пустая секция
        lualine_c = { { 'filename', path = 1 } }, -- Только имя файла
        lualine_x = { { 'location', padding = 0 } }, -- Положение курсора без отступов
        lualine_y = {}, -- Пустая секция
        lualine_z = {}, -- Пустая секция
      },
      tabline = {}, -- Не использовать строку вкладок
      extensions = { 'fugitive' }, -- Поддержка плагина fugitive (Git)
    }
  end,
}
