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
|**Цветовые схемы**|[catppuccin/nvim](https://github.com/catppuccin/nvim)|
|**Комментирование**|[Comment.nvim](https://github.com/numToStr/Comment.nvim), [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)|
|**Автодополнение**|[blink.cmp](https://github.com/Saghen/blink.cmp), [friendly-snippets](https://github.com/rafamadriz/friendly-snippets), [blink.compat](https://github.com/Saghen/blink.cmp)|
|**Редактирование**|[nvim-autopairs](https://github.com/windwp/nvim-autopairs), [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag), [vim-sleuth](https://github.com/tpope/vim-sleuth)|
|**Файловый менеджер**|[nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)|
|**Форматирование**|[conform.nvim](https://github.com/stevearc/conform.nvim)|
|**Поиск**|[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim), [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim), [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)|
|**Git**|[diffview.nvim](https://github.com/sindrets/diffview.nvim), [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim), [neogit](https://github.com/NeogitOrg/neogit), [vim-fugitive](https://github.com/tpope/vim-fugitive), [vim-rhubarb](https://github.com/tpope/vim-rhubarb)|
|**Интерфейс**|[alpha-nvim](https://github.com/goolord/alpha-nvim), [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim), [bufferline.nvim](https://github.com/akinsho/bufferline.nvim), [dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim), [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim), [noice.nvim](https://github.com/folke/noice.nvim), [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua), [nvim-notify](https://github.com/rcarriga/nvim-notify), [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons), [which-key.nvim](https://github.com/folke/which-key.nvim)|
|**LSP**|[mason.nvim](https://github.com/williamboman/mason.nvim), [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim), [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim), [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig), [lazydev.nvim](https://github.com/folke/lazydev.nvim)|
|**Treesitter**|[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)|
|**Сворачивание**|[nvim-ufo](https://github.com/kevinhwang91/nvim-ufo), [promise-async](https://github.com/kevinhwang91/promise-async), [statuscol.nvim](https://github.com/luukvbaal/statuscol.nvim)|
|**Навигация**|[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)|
|**Управление буферами**|[vim-bbye](https://github.com/moll/vim-bbye)|
|**Прочее**|[mdx.nvim](https://github.com/davidmh/mdx.nvim) (MDX support), [neoscroll.nvim](https://github.com/karb94/neoscroll.nvim) (плавная прокрутка), [nui.nvim](https://github.com/MunifTanjim/nui.nvim) (UI компоненты), [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) (утилиты), [showkeys](https://github.com/nvzone/showkeys) (отображение клавиш)|

*(Всего 46 плагинов)*

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

- **Менеджер плагинов:** [lazy.nvim](https://github.com/folke/lazy.nvim)
- **Иконки:** [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- **Уведомления:** [nvim-notify](https://github.com/rcarriga/nvim-notify)
- **Расширенный UI:** [noice.nvim](https://github.com/folke/noice.nvim)
- **Интеграция с tmux:** [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

## Особенности работы

- **Автоматическая настройка LSP** через Mason при первом запуске
- **Адаптивное форматирование** при сохранении файлов (conform.nvim)
- **Визуализация изменений Git** в реальном времени (gitsigns.nvim)
- **Плавная прокрутка** текста (neoscroll.nvim)
- **Контекстная навигация** по коду (dropbar.nvim, treesitter)
- **Интеллектуальное сворачивание** кода (nvim-ufo + treesitter)

## Рекомендации

Используйте [Nerd Fonts](https://www.nerdfonts.com/) для корректного отображения иконок

## Обновление конфигурации

```sh
cd ~/.config/nvim && git pull
```
