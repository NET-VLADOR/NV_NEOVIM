# NV_NEOVIM

<a href="https://dotfyle.com/NET-VLADOR/nvneovim"><img src="https://dotfyle.com/NET-VLADOR/nvneovim/badges/plugins?style=for-the-badge" /></a>
<a href="https://dotfyle.com/NET-VLADOR/nvneovim"><img src="https://dotfyle.com/NET-VLADOR/nvneovim/badges/leaderkey?style=for-the-badge" /></a>
<a href="https://dotfyle.com/NET-VLADOR/nvneovim"><img src="https://dotfyle.com/NET-VLADOR/nvneovim/badges/plugin-manager?style=for-the-badge" /></a>

## Установка

> Требуется Neovim 0.9+ или новее. Всегда проверяйте код перед установкой!

1. Клонируйте репозиторий:

```sh
git clone https://github.com/NET-VLADOR/NV_NEOVIM.git ~/.config/nvim
```

2. Запустите Neovim, плагины установятся автоматически:

```sh
nvim
```

## Основные возможности

### 🎨 Плагины по категориям

|Категория|Плагины|
|---|---|
|**Цветовые схемы**|[catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)|
|**Комментирование**|[Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim), [todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)|
|**Автодополнение**|[blink.cmp](https://dotfyle.com/plugins/Saghen/blink.cmp), [friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)|
|**Редактирование**|[nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs), [nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)|
|**Файловый менеджер**|[neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim), [nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim), [nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)|
|**Форматирование**|[conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)|
|**Поиск**|[telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)|
|**Git**|[diffview.nvim](https://dotfyle.com/plugins/sindrets/diffview.nvim), [gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim), [neogit](https://dotfyle.com/plugins/NeogitOrg/neogit)|
|**Интерфейс**|[alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim), [lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim), [bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim), [dropbar.nvim](https://dotfyle.com/plugins/Bekaboo/dropbar.nvim), [noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)|
|**LSP**|[mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim), [nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)|
|**Treesitter**|[nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)|
|**Сворачивание**|[nvim-ufo](https://dotfyle.com/plugins/kevinhwang91/nvim-ufo)|
|**Прочее**|[image.nvim](https://dotfyle.com/plugins/samodostal/image.nvim), [neoscroll.nvim](https://dotfyle.com/plugins/karb94/neoscroll.nvim)|

*(Всего 49 плагинов, полный список см. в исходной конфигурации)*

### 🌐 Языковые серверы (LSP)

Автоматическая настройка через Mason для следующих языков:

|Сервер|Языки / Технологии|Особенности|
|---|---|---|
|`ts_ls`|TypeScript||
|`bashls`|Bash||
|`mdx_analyzer`|MDX (Markdown + JSX)||
|`eslint`|JavaScript||
|`html`|HTML, Twig, Handlebars|Поддержка шаблонов|
|`cssls`|CSS||
|`tailwindcss`|Tailwind CSS||
|`dockerls`|Docker||
|`sqlls`|SQL||
|`jsonls`|JSON||
|`yamlls`|YAML||
|`lua_ls`|Lua|Автодополнение с заменой сниппетов|

### ⚙️ Системные компоненты

- **Менеджер плагинов:** [Lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
- **Иконки:** [nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)
- **Уведомления:** [nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
- **Расширенный UI:** [noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
- **Интеграция с tmux:** [vim-tmux-navigator](https://dotfyle.com/plugins/christoomey/vim-tmux-navigator)

## Особенности работы

- **Автоматическая настройка LSP** через Mason при первом запуске
- **Адаптивное форматирование** при сохранении файлов (через conform.nvim)
- **Визуализация изменений Git** в реальном времени (gitsigns.nvim)
- **Просмотр изображений** непосредственно в Neovim (image.nvim)
- **Плавная прокрутка** текста (neoscroll.nvim)
- **Контекстная навигация** по коду (dropbar.nvim, treesitter-context)

## Рекомендации

Используйте [Nerd Fonts](https://www.nerdfonts.com/) для корректного отображения иконок

## Обновление конфигурации

```sh
cd ~/.config/nvim && git pull
```
