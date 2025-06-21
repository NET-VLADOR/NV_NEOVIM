-- Основные настройки редактора
vim.wo.number = true                                 -- Показывать номера строк (по умолчанию: false)
vim.o.relativenumber = true                          -- Показывать относительные номера строк (по умолчанию: false)
vim.o.clipboard = 'unnamedplus'                      -- Синхронизация буфера с системным clipboard (по умолчанию: '')
vim.o.wrap = false                                   -- Отключить перенос длинных строк (по умолчанию: true)
vim.o.linebreak = true                               -- Не разбивать слова при переносе (актуально при включённом wrap) (по умолчанию: false)
vim.o.mouse = 'a'                                    -- Включить поддержку мыши во всех режимах (по умолчанию: '')
vim.o.mousemoveevent = true                          -- Включить поддержку ивентов мыши
vim.o.autoindent = true                              -- Автоматический отступ для новых строк (по умолчанию: true)
vim.o.ignorecase = true                              -- Игнорировать регистр при поиске (по умолчанию: false)
vim.o.smartcase = true                               -- Учитывать регистр при наличии заглавных букв (по умолчанию: false)
vim.o.shiftwidth = 4                                 -- Количество пробелов для автоотступа (по умолчанию 8)
vim.o.tabstop = 4                                    -- Количество пробелов для табуляции (по умолчанию: 8)
vim.o.softtabstop = 4                                -- Количество пробелов при редактировании табов (по умолчанию: 0)
vim.o.expandtab = false                              -- Не преобразовывать табы в пробелы (по умолчанию: false)
vim.o.scrolloff = 4                                  -- Минимальное количество строк выше/ниже курсора при скролле (по умолчанию: 0)
vim.o.sidescrolloff = 8                              -- Минимальное количество колонок по бокам курсора (по умолчанию: 0)
vim.o.cursorline = true                              -- Подсвечивать текущую строку (по умолчанию: false)
vim.o.splitbelow = true                              -- Новые горизонтальные окна открывать снизу (по умолчанию: false)
vim.o.splitright = true                              -- Новые вертикальные окна открывать справа (по умолчанию: false)
vim.o.hlsearch = false                               -- Отключить подсветку результатов поиска (по умолчанию: true)
vim.o.showmode = false                               -- Скрыть индикатор режима (INSERT/NORMAL и т.д.) (по умолчанию: true)
vim.opt.termguicolors = true                         -- Включить true-color поддержку (по умолчанию: false)
vim.o.whichwrap = 'bs<>[]hl'                         -- Клавиши для перехода между строками: backspace, пробел, стрелки, h/l (по умолчанию: 'b,s')
vim.o.numberwidth = 4                                -- Ширина колонки с номерами строк (по умолчанию: 4)
vim.o.swapfile = false                               -- Отключить создание swap-файлов (по умолчанию: true)
vim.o.smartindent = true                             -- Умные автоотступы (по умолчанию: false)
vim.o.showtabline = 2                                -- Всегда показывать панель вкладок (по умолчанию: 1)
vim.o.backspace = 'indent,eol,start'                 -- Поведение backspace: удалять отступы, концы строк и начало (по умолчанию: 'indent,eol,start')
vim.o.pumheight = 10                                 -- Максимальная высота выпадающего меню (по умолчанию: 0)
vim.o.conceallevel = 0                               -- Отключить скрытие разметки (например `` в Markdown) (по умолчанию: 1)
vim.wo.signcolumn = 'yes'                            -- Всегда показывать колонку знаков (для гитовых значков и т.д.) (по умолчанию: 'auto')
vim.o.fileencoding = 'utf-8'                         -- Кодировка файлов по умолчанию (по умолчанию: 'utf-8')
vim.o.cmdheight = 1                                  -- Высота командной строки (по умолчанию: 1)
vim.o.breakindent = true                             -- Сохранять отступ при переносе строк (по умолчанию: false)
vim.o.updatetime = 250                               -- Задержка обновления UI (мс) (влияет на CursorHold) (по умолчанию: 4000)
vim.o.timeoutlen = 300                               -- Таймаут для комбинаций клавиш (мс) (по умолчанию: 1000)
vim.o.backup = false                                 -- Отключить создание бэкап-файлов (по умолчанию: false)
vim.o.writebackup = false                            -- Отключить резервное копирование при записи (по умолчанию: true)
vim.o.undofile = true                                -- Сохранять историю изменений (по умолчанию: false)
vim.o.completeopt = 'menuone,noselect'               -- Настройки автодополнения: показывать меню даже для 1 варианта, не выбирать автоматически (по умолчанию: 'menu,preview')
vim.g.have_nerd_font = true                          -- Флаг отвечающий за наличие Nerd Fonts
vim.g.catppuccin_flavour = 'mocha'                   -- Тема catppuccin по-умолчанию
vim.opt.spell = true                                 -- Включить проверку орфографии
vim.opt.spelllang = { 'en_us', 'ru_ru' }             -- Языки: английский (США) и русский

-- Дополнительные настройки
vim.opt.shortmess:append 'c'                         -- Сокращать системные сообщения (не показывать completion-menu)
vim.opt.iskeyword:append '-'                         -- Считать дефис частью слова для навигации
vim.opt.formatoptions:remove { 'c', 'r', 'o' }       -- Отключить автоформатирование комментариев при:
                                                     --  c: переносе текста
                                                     --  r: вставке текста после комментария
                                                     --  o: создании новой строки через o/O
vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- Исключить Vim-плагины из путей Neovim
