-- Установка лидер-клавиш
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = function(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { noremap = true, silent = true, desc = desc })
end

map('jk', '<ESC>', 'Вернуться в НОРМАЛЬНЫЙ режим', 'i')
map('<Space>', '<Nop>', 'Сброс пробела', { 'n', 'v' })
map('<C-s>', '<cmd> w <CR>', 'Сохранить файл')
map('<leader>sn', '<cmd>noautocmd w <CR>', 'Сохранить без форматирования')
map('<C-q>', '<cmd> q <CR>', 'Закрыть файл')
map('x', '"_x', 'Удалить символ (без буфера)')

-- Вертикальная прокрутка с центрированием
map('<C-d>', '<C-d>zz', 'Прокрутка вниз с центрированием')
map('<C-u>', '<C-u>zz', 'Прокрутка вверх с центрированием')

-- Поиск с центрированием
map('n', 'nzzzv', 'Следующий результат поиска (центр.)')
map('N', 'Nzzzv', 'Предыдущий результат поиска (центр.)')

-- Изменение размеров окон
map('<Down>', ':resize -2<CR>', 'Уменьшить высоту окна')
map('<Up>', ':resize +2<CR>', 'Увеличить высоту окна')
map('<Right>', ':vertical resize -2<CR>', 'Уменьшить ширину окна')
map('<Left>', ':vertical resize +2<CR>', 'Увеличить ширину окна')

-- Управление буферами
map('<Tab>', ':bnext<CR>', 'Следующий буфер')
map('<S-Tab>', ':bprevious<CR>', 'Предыдущий буфер')
map('<leader>x', ':bdelete!<CR>', 'Закрыть текущий буфер')
map('<leader>nb', '<cmd> enew <CR>', 'Создать новый буфер')

-- Управление окнами
map('<leader>wv', '<C-w>v', 'Вертикальное разделение окна')
map('<leader>wh', '<C-w>s', 'Горизонтальное разделение окна')
map('<leader>we', '<C-w>=', 'Выровнять размеры окон')
map('<leader>wx', ':close<CR>', 'Закрыть текущее окно')

-- Навигация между окнами
map('<C-k>', ':wincmd k<CR>', 'Перейти в верхнее окно')
map('<C-j>', ':wincmd j<CR>', 'Перейти в нижнее окно')
map('<C-h>', ':wincmd h<CR>', 'Перейти в левое окно')
map('<C-l>', ':wincmd l<CR>', 'Перейти в правое окно')

-- Управление вкладками
map('<leader>To', ':tabnew<CR>', 'Новая вкладка')
map('<leader>Tx', ':tabclose<CR>', 'Закрыть текущую вкладку')
map('<leader>Tn', ':tabn<CR>', 'Следующая вкладка')
map('<leader>Tp', ':tabp<CR>', 'Предыдущая вкладка')

-- Переключения
map('<leader>tl', '<cmd>map wrap!<CR>', 'Переключить перенос строк')
map('<leader>tr', '<cmd>set relativenumber!<CR>', 'Переключить режим относительных строк')
map('<leader>ts', '<cmd>ShowkeysToggle<CR>', 'Переключить видимость нажимаемых клавиш')

-- Сохранение режима отступа
map('<', '<gv', 'Сдвиг выделения влево', 'v')
map('>', '>gv', 'Сдвиг выделения вправо', 'v')

map('p', '"_dP', 'Вставить без перезаписи буфера', 'v')

-- Диагностические сочетания
map('[d', vim.diagnostic.goto_prev, 'Перейти к предыдущей диагностике')
map(']d', vim.diagnostic.goto_next, 'Перейти к следующей диагностике')
map('<leader>d', vim.diagnostic.open_float, 'Показать диагностику во всплывающем окне')
map('<leader>q', vim.diagnostic.setloclist, 'Открыть список диагностик')
