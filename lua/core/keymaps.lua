-- Установка лидер-клавиш
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = function(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { noremap = true, silent = true, desc = desc })
end

-- Основные действия
map('jk', '<ESC>', 'Вернуться в нормальный режим', 'i')
map('<Space>', '<Nop>', 'Сброс пробела', { 'n', 'v' })
map('<C-s>', '<cmd> w <CR>', 'Сохранить файл')
map('<leader>sn', '<cmd>noautocmd w <CR>', 'Сохранить без форматирования')
map('<C-q>', '<cmd> q <CR>', 'Закрыть файл')
map('x', '"_x', 'Удалить символ (без буфера)')

-- Навигация по тексту
map('<C-d>', '<C-d>zz', 'Прокрутка вниз с центрированием')
map('<C-u>', '<C-u>zz', 'Прокрутка вверх с центрированием')
map('n', 'nzzzv', 'Следующий результат поиска (центрированный)')
map('N', 'Nzzzv', 'Предыдущий результат поиска (центрированный)')

-- Управление размерами окон
map('<Down>', ':resize -2<CR>', 'Уменьшить высоту окна')
map('<Up>', ':resize +2<CR>', 'Увеличить высоту окна')
map('<Right>', ':vertical resize -2<CR>', 'Уменьшить ширину окна')
map('<Left>', ':vertical resize +2<CR>', 'Увеличить ширину окна')

-- Работа с буферами
map('<Tab>', ':bnext<CR>', 'Следующий буфер')
map('<S-Tab>', ':bprevious<CR>', 'Предыдущий буфер')
map('<leader>nb', '<cmd> enew <CR>', 'Создать новый буфер')

-- Управление окнами
map('<leader>wv', '<C-w>v', 'Вертикальное разделение окна')
map('<leader>wh', '<C-w>s', 'Горизонтальное разделение окна')
map('<leader>we', '<C-w>=', 'Выровнять размеры окон')
map('<leader>wx', ':close<CR>', 'Закрыть текущее окно')
map('<C-k>', ':wincmd k<CR>', 'Перейти в верхнее окно')
map('<C-j>', ':wincmd j<CR>', 'Перейти в нижнее окно')
map('<C-h>', ':wincmd h<CR>', 'Перейти в левое окно')
map('<C-l>', ':wincmd l<CR>', 'Перейти в правое окно')

-- Управление вкладками
map('<leader>To', ':tabnew<CR>', 'Новая вкладка')
map('<leader>Tx', ':tabclose<CR>', 'Закрыть текущую вкладку')
map('<leader>Tn', ':tabn<CR>', 'Следующая вкладка')
map('<leader>Tp', ':tabp<CR>', 'Предыдущая вкладка')

-- Переключение режимов
map('<leader>tl', '<cmd>set wrap!<CR>', 'Переключить перенос строк')
map('<leader>tr', '<cmd>set relativenumber!<CR>', 'Переключить относительные номера строк')

-- Работа с выделением
map('<', '<gv', 'Сдвиг выделения влево', 'v')
map('>', '>gv', 'Сдвиг выделения вправо', 'v')
map('p', '"_dP', 'Вставить без перезаписи буфера', 'v')

-- Диагностика
map('[d', vim.diagnostic.goto_prev, 'Предыдущая диагностика')
map(']d', vim.diagnostic.goto_next, 'Следующая диагностика')
map('<leader>d', vim.diagnostic.open_float, 'Показать диагностику')
map('<leader>q', vim.diagnostic.setloclist, 'Открыть список диагностик')
