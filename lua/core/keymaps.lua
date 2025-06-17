-- Установка лидер-клавиш
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Отключение стандартного поведения пробела в Normal и Visual режимах
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Сохранение файла
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', { noremap = true, silent = true, desc = 'Сохранить файл' })

-- Сохранение без автоформатирования
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', { noremap = true, silent = true, desc = 'Сохранить без форматирования' })

-- Закрытие файла
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', { noremap = true, silent = true, desc = 'Закрыть файл' })

-- Удаление символа без копирования в регистр
vim.keymap.set('n', 'x', '"_x', { noremap = true, silent = true, desc = 'Удалить символ (без буфера)' })

-- Вертикальная прокрутка с центрированием
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true, desc = 'Прокрутка вниз с центрированием' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true, desc = 'Прокрутка вверх с центрированием' })

-- Поиск с центрированием
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true, desc = 'Следующий результат поиска (центр.)' })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true, desc = 'Предыдущий результат поиска (центр.)' })

-- Изменение размеров окон
vim.keymap.set('n', '<Down>', ':resize -2<CR>', { noremap = true, silent = true, desc = 'Уменьшить высоту окна' })
vim.keymap.set('n', '<Up>', ':resize +2<CR>', { noremap = true, silent = true, desc = 'Увеличить высоту окна' })
vim.keymap.set('n', '<Right>', ':vertical resize -2<CR>', { noremap = true, silent = true, desc = 'Уменьшить ширину окна' })
vim.keymap.set('n', '<Left>', ':vertical resize +2<CR>', { noremap = true, silent = true, desc = 'Увеличить ширину окна' })

-- Управление буферами
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true, desc = 'Следующий буфер' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true, desc = 'Предыдущий буфер' })
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', { noremap = true, silent = true, desc = 'Закрыть текущий буфер' })
vim.keymap.set('n', '<leader>nb', '<cmd> enew <CR>', { noremap = true, silent = true, desc = 'Создать новый буфер' })

-- Управление окнами
vim.keymap.set('n', '<leader>wv', '<C-w>v', { noremap = true, silent = true, desc = 'Вертикальное разделение окна' })
vim.keymap.set('n', '<leader>wh', '<C-w>s', { noremap = true, silent = true, desc = 'Горизонтальное разделение окна' })
vim.keymap.set('n', '<leader>we', '<C-w>=', { noremap = true, silent = true, desc = 'Выровнять размеры окон' })
vim.keymap.set('n', '<leader>wx', ':close<CR>', { noremap = true, silent = true, desc = 'Закрыть текущее окно' })

-- Навигация между окнами
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', { noremap = true, silent = true, desc = 'Перейти в верхнее окно' })
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', { noremap = true, silent = true, desc = 'Перейти в нижнее окно' })
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', { noremap = true, silent = true, desc = 'Перейти в левое окно' })
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', { noremap = true, silent = true, desc = 'Перейти в правое окно' })

-- Управление вкладками
vim.keymap.set('n', '<leader>To', ':tabnew<CR>', { noremap = true, silent = true, desc = 'Новая вкладка' })
vim.keymap.set('n', '<leader>Tx', ':tabclose<CR>', { noremap = true, silent = true, desc = 'Закрыть текущую вкладку' })
vim.keymap.set('n', '<leader>Tn', ':tabn<CR>', { noremap = true, silent = true, desc = 'Следующая вкладка' })
vim.keymap.set('n', '<leader>Tp', ':tabp<CR>', { noremap = true, silent = true, desc = 'Предыдущая вкладка' })

-- Переключение переноса строк
vim.keymap.set('n', '<leader>tl', '<cmd>set wrap!<CR>', { noremap = true, silent = true, desc = 'Переключить перенос строк' })

-- Сохранение режима отступа
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true, desc = 'Сдвиг выделения влево' })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true, desc = 'Сдвиг выделения вправо' })

-- Сохранение последнего копирования при вставке
vim.keymap.set('v', 'p', '"_dP', { noremap = true, silent = true, desc = 'Вставить без перезаписи буфера' })

-- Диагностические сочетания
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Перейти к предыдущей диагностике' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Перейти к следующей диагностике' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Показать диагностику во всплывающем окне' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Открыть список диагностик' })
