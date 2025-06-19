return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    -- Функция для русификации описаний команд
    local function my_on_attach(bufnr)
      local api = require 'nvim-tree.api'

      local function opts(desc)
        return {
          desc = 'Nvim-tree: ' .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true,
        }
      end

      -- Стандартные маппинги с русскими описаниями
      vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts 'Перейти в директорию')
      vim.keymap.set('n', '<C-e>', api.node.open.replace_tree_buffer, opts 'Открыть в текущем буфере')
      vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts 'Переименовать (без имени)')
      vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts 'Вертикальное разделение')
      vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts 'Горизонтальное разделение')
      vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts 'Закрыть директорию')
      vim.keymap.set('n', '<CR>', api.node.open.edit, opts 'Открыть')
      vim.keymap.set('n', '<Tab>', api.node.open.preview, opts 'Предпросмотр')
      vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts 'Следующий элемент')
      vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts 'Предыдущий элемент')
      vim.keymap.set('n', ';', api.node.run.cmd, opts 'Выполнить команду')
      vim.keymap.set('n', 'a', api.fs.create, opts 'Создать файл/директорию')
      vim.keymap.set('n', 'bd', api.marks.bulk.delete, opts 'Удалить закладки')
      vim.keymap.set('n', 'bt', api.marks.bulk.trash, opts 'В корзину (закладки)')
      vim.keymap.set('n', 'bmv', api.marks.bulk.move, opts 'Переместить закладки')
      vim.keymap.set('n', 'B', api.tree.toggle_no_buffer_filter, opts 'Фильтр: без буфера')
      vim.keymap.set('n', 'c', api.fs.copy.node, opts 'Копировать')
      vim.keymap.set('n', 'C', api.tree.toggle_git_clean_filter, opts 'Фильтр: Git Clean')
      vim.keymap.set('n', 'd', api.fs.remove, opts 'Удалить')
      vim.keymap.set('n', 'D', api.fs.trash, opts 'В корзину')
      vim.keymap.set('n', 'E', api.tree.expand_all, opts 'Раскрыть всё')
      vim.keymap.set('n', 'e', api.fs.rename_basename, opts 'Переименовать (базовое имя)')
      vim.keymap.set('n', ']e', api.node.navigate.diagnostics.next, opts 'След. диагностика')
      vim.keymap.set('n', '[e', api.node.navigate.diagnostics.prev, opts 'Пред. диагностика')
      vim.keymap.set('n', 'F', api.live_filter.clear, opts 'Очистить фильтр')
      vim.keymap.set('n', 'f', api.live_filter.start, opts 'Активировать фильтр')
      vim.keymap.set('n', 'ge', api.fs.copy.basename, opts 'Копировать базовое имя')
      vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts 'Фильтр: скрытые файлы')
      vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts 'Фильтр: .gitignore')
      vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts 'Последний элемент')
      vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts 'Первый элемент')
      vim.keymap.set('n', 'L', api.node.open.toggle_group_empty, opts 'Переключить пустые группы')
      vim.keymap.set('n', 'M', api.tree.toggle_no_bookmark_filter, opts 'Фильтр: без закладок')
      vim.keymap.set('n', 'm', api.marks.toggle, opts 'Добавить/удалить закладку')
      vim.keymap.set('n', 'O', api.node.open.no_window_picker, opts 'Открыть (без выбора окна)')
      vim.keymap.set('n', 'p', api.fs.paste, opts 'Вставить')
      vim.keymap.set('n', 'P', api.node.navigate.parent, opts 'Родительская директория')
      vim.keymap.set('n', 'q', api.tree.close, opts 'Закрыть')
      vim.keymap.set('n', 'r', api.fs.rename, opts 'Переименовать')
      vim.keymap.set('n', 'R', api.tree.reload, opts 'Обновить')
      vim.keymap.set('n', 's', api.node.run.system, opts 'Запустить системой')
      vim.keymap.set('n', 'S', api.tree.search_node, opts 'Поиск')
      vim.keymap.set('n', 'u', api.fs.rename_full, opts 'Переименовать (полный путь)')
      vim.keymap.set('n', 'U', api.tree.toggle_custom_filter, opts 'Фильтр: пользовательский')
      vim.keymap.set('n', 'x', api.fs.cut, opts 'Вырезать')
      vim.keymap.set('n', 'y', api.fs.copy.filename, opts 'Копировать имя')
      vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts 'Копировать относительный путь')
      vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts 'Открыть')
      vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts 'Перейти в директорию')

      -- ПЕРЕНАЗНАЧЕННЫЕ КЛАВИШИ ИЗ NEO-TREE --
      vim.keymap.set('n', 'l', api.node.open.edit, opts 'Открыть')
      vim.keymap.set('n', 't', api.node.open.tab, opts 'Открыть в новой вкладке')
      vim.keymap.set('n', 'z', api.tree.collapse_all, opts 'Свернуть всё')
      vim.keymap.set('n', '?', api.tree.toggle_help, opts 'Помощь')
      vim.keymap.set('n', 'i', api.node.show_info_popup, opts 'Информация')

      -- Навигация
      vim.keymap.set('n', '<BS>', api.tree.change_root_to_parent, opts 'На уровень выше')
      vim.keymap.set('n', '.', api.tree.change_root_to_node, opts 'Сделать текущую директорию корневой')

      -- Операции с файлами
      vim.keymap.set('n', 'yy', api.fs.copy.absolute_path, opts 'Копировать абсолютный путь')

      -- Git операции
      vim.keymap.set('n', '[g', api.node.navigate.git.prev, opts 'Пред. Git')
      vim.keymap.set('n', ']g', api.node.navigate.git.next, opts 'След. Git')
    end

    require('nvim-tree').setup {
      auto_reload_on_write = true,
      disable_netrw = false,
      hijack_netrw = true,
      hijack_cursor = false,
      hijack_unnamed_buffer_when_opening = false,
      on_attach = my_on_attach, -- Подключаем русифицированные маппинги
      tab = {
        sync = {
          open = true,
          ignore = {},
        },
      },
      sync_root_with_cwd = true,
      sort = {
        sorter = 'name',
      },
      ui = {
        confirm = {
          trash = true,
        },
      },
      view = {
        debounce_delay = 50,
        width = {
          min = 25, -- Минимальная ширина (25-40% экрана)
          max = 45, -- Максимальная ширина (не более 50%)
          padding = 2, -- Отступ от краев
        },
        side = 'left',
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = 'no',
      },
      renderer = {
        full_name = true,
        highlight_git = 'name', -- Подсветка и иконки, и названий для Git
        highlight_hidden = 'name', -- Подсветка только иконок для скрытых файлов
        hidden_display = function(hidden_stats)
          local total = 0
          local parts = {}

          -- Перевод причин скрытия на русский
          local reasons = {
            bookmark = 'закладки',
            buf = 'буферы',
            custom = 'пользовательские',
            dotfile = 'dot-файлы',
            git = 'git',
            live_filter = 'фильтр',
          }

          -- Сбор статистики
          for reason, count in pairs(hidden_stats) do
            if count > 0 then
              total = total + count
              table.insert(parts, reasons[reason] .. ': ' .. count)
            end
          end

          if total > 0 then
            return 'Скрыто: ' .. total .. ' (' .. table.concat(parts, ', ') .. ')'
          end
          return nil
        end,
        root_folder_label = function(path)
          return vim.fn.fnamemodify(path, ':t') -- Пример: "my-project"
        end,
        indent_markers = {
          enable = true,
          icons = {
            corner = '└ ',
            edge = '│ ',
            none = '  ',
          },
        },
        icons = {
          padding = ' ',
          web_devicons = {
            file = {
              enable = true,
              color = true,
            },
            folder = {
              enable = true,
              color = true,
            },
          },
          diagnostics_placement = 'before',
          glyphs = {
            git = {
              unstaged = '󰄱',
              staged = '',
              unmerged = '',
              renamed = '➜',
              untracked = '★',
              deleted = '',
              ignored = '◌',
            },
          },
        },
      },
      hijack_directories = {
        enable = true,
        auto_open = true,
      },
      update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
      },
      system_open = {
        cmd = '',
        args = {},
      },
      diagnostics = {
        enable = true,
        show_on_dirs = false,
        icons = {
          hint = '󰌶',
          info = '󰋽',
          warning = '󰀪',
          error = '󰅚',
        },
      },
      filters = {
        git_ignored = true,
        dotfiles = true,
        custom = {},
        exclude = {},
      },
      git = {
        enable = true,
        timeout = 400,
      },
      actions = {
        use_system_clipboard = true,
        change_dir = {
          enable = true,
          global = false,
          restrict_above_cwd = false,
        },
        open_file = {
          quit_on_open = false,
          resize_window = true,
          relative_path = true,
          window_picker = {
            enable = true,
            chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
            exclude = {
              filetype = { 'notify', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
              buftype = { 'nofile', 'terminal', 'help' },
            },
          },
        },
      },
      log = {
        enable = false,
        truncate = false,
        types = {
          all = false,
          config = false,
          copy_paste = false,
          diagnostics = false,
          git = false,
          profile = false,
        },
      },
    }

    vim.keymap.set('n', '<space>e', require('nvim-tree.api').tree.toggle, {
      silent = true,
      desc = 'Переключить видимость Nvim-tree',
    })
  end,
}
