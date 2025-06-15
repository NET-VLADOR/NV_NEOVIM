return {
  -- https://github.com/akinsho/bufferline.nvim
  'akinsho/bufferline.nvim',
  dependencies = {
    -- https://github.com/moll/vim-bbye
    'moll/vim-bbye', -- Для корректного закрытия буферов без нарушения работы Neovim
    'nvim-tree/nvim-web-devicons', -- Иконки для буферов (требует Nerd Font)
  },
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers', -- Режим отображения: "buffers" (буферы) или "tabs" (вкладки)
        themable = true, -- Разрешает переопределение цветовых групп
        numbers = 'none', -- Нумерация: "none" (нет), "ordinal" (порядковая), "buffer_id" (ID), "both" (оба), или функция
        close_command = 'Bdelete! %d', -- Команда закрытия буфера (можно использовать функцию)
        buffer_close_icon = '', -- Иконка закрытия буфера
        close_icon = '', -- Общая иконка закрытия
        path_components = 1, -- Количество отображаемых компонентов пути (1 = только имя файла)
        modified_icon = '●', -- Иконка для изменённых буферов
        left_trunc_marker = '', -- Маркер обрезания списка слева
        right_trunc_marker = '', -- Маркер обрезания списка справа
        max_name_length = 30, -- Макс. длина имени буфера
        max_prefix_length = 30, -- Макс. длина префикса при дедупликации
        tab_size = 20, -- Ширина вкладки
        diagnostics = false, -- Интеграция с диагностикой (lsp и т.п.)
        diagnostics_update_in_insert = false, -- Обновлять диагностику в режиме insert
        color_icons = true, -- Раскрашивать иконки в цвет типа файла
        show_buffer_icons = true, -- Показывать иконки буферов
        show_buffer_close_icons = true, -- Показывать иконки закрытия
        show_close_icon = true, -- Показывать общую иконку закрытия
        persist_buffer_sort = true, -- Сохранять порядок сортировки буферов
        separator_style = { '│', '│' }, -- Стиль разделителей: можно использовать "thick", "thin" или кастомные символы
        enforce_regular_tabs = true, -- Выравнивать ширину вкладок
        always_show_bufferline = true, -- Всегда показывать панель буферов
        show_tab_indicators = false, -- Показывать индикаторы вкладок
        indicator = {
          style = 'none', -- Стиль индикатора: 'icon' (иконка), 'underline' (подчёркивание), 'none' (отсутствует)
        },
        icon_pinned = '󰐃', -- Иконка для закреплённых буферов
        minimum_padding = 1, -- Минимальный отступ между элементами
        maximum_padding = 5, -- Максимальный отступ между элементами
        maximum_length = 15, -- Максимальное количество отображаемых элементов
        sort_by = 'insert_at_end', -- Сортировка: "insert_at_end" (по порядку добавления), "id" (по ID), "extension" (по расширению) и др.
      },
      highlights = {
        separator = {
          fg = '#9399b2', -- Цвет разделителя (HEX-код)
        },
        buffer_selected = {
          bold = true, -- Жирный шрифт для активного буфера
          italic = false, -- Курсив для активного буфера (отключен)
        },
        -- Дополнительные кастомные стили (примеры):
        -- separator_selected = {},  -- Стиль разделителя для активного буфера
        -- tab_selected = {},        -- Стиль активной вкладки
        -- background = {},          -- Стиль фона неактивных буферов
        -- indicator_selected = {},  -- Стиль индикатора для активного буфера
        -- fill = {},                -- Стиль заполнения пустого пространства
      },
    }
  end,
}
