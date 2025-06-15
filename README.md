# NV_NEOVIM

<a href="https://dotfyle.com/NET-VLADOR/nvneovim"><img src="https://dotfyle.com/NET-VLADOR/nvneovim/badges/plugins?style=for-the-badge" /></a>
<a href="https://dotfyle.com/NET-VLADOR/nvneovim"><img src="https://dotfyle.com/NET-VLADOR/nvneovim/badges/leaderkey?style=for-the-badge" /></a>
<a href="https://dotfyle.com/NET-VLADOR/nvneovim"><img src="https://dotfyle.com/NET-VLADOR/nvneovim/badges/plugin-manager?style=for-the-badge" /></a>

## Установка

> Требуется Neovim 0.9+ или новее. Всегда проверяйте код перед установкой!

1. Клонируйте репозиторий:
```sh
git clone git@github.com:NET-VLADOR/NV_NEOVIM ~/.config/nvim
```

2. Запустите Neovim, плагины установятся автоматически:
```sh
nvim
```

## Основные возможности

### 🎨 Плагины
| Категория          | Плагины                                                                 |
|--------------------|-------------------------------------------------------------------------|
| **Цветовые схемы** | [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)          |
| **Комментирование**| [Comment.nvim](https://dotfyle.com/plugins/numToStr/Comment.nvim), [todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim) |
| **Автодополнение** | [blink.cmp](https://dotfyle.com/plugins/Saghen/blink.cmp)               |
| **Редактирование** | [nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs), [treesitter-context](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-context) |
| **Файловый менеджер** | [neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim) |
| **Форматирование** | [conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)       |
| **Поиск**          | [telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim) |
| **Git**            | [diffview.nvim](https://dotfyle.com/plugins/sindrets/diffview.nvim), [gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim), [neogit](https://dotfyle.com/plugins/NeogitOrg/neogit) |
| **Интерфейс**      | [alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim), [lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim), [bufferline.nvim](https://dotfyle.com/plugins/akinsho/bufferline.nvim) |

*(Полный список плагинов см. в исходной конфигурации)*

### 🌐 Языковые серверы (LSP)
Конфигурация включает поддержку следующих языков через LSP:

| Сервер         | Языки / Технологии                     | Особенности                                  |
|----------------|----------------------------------------|---------------------------------------------|
| `ts_ls`        | TypeScript                             |                                             |
| `bashls`       | Bash                                   |                                             |
| `eslint`       | JavaScript                             |                                             |
| `html`         | HTML, Twig, Handlebars                 | Поддержка шаблонов                          |
| `cssls`        | CSS                                    |                                             |
| `tailwindcss`  | Tailwind CSS                           |                                             |
| `dockerls`     | Docker                                 |                                             |
| `sqlls`        | SQL                                    |                                             |
| `jsonls`       | JSON                                   |                                             |
| `yamlls`       | YAML                                   |                                             |
| `lua_ls`       | Lua                                    | Автодополнение с заменой сниппетов          |

### ⚙️ Системные компоненты
- **Менеджер плагинов:** [Lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
- **Иконки:** [nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)
- **Уведомления:** [nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
- **Интерактивный интерфейс:** [noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)

## Особенности работы
- **Автоматическая настройка LSP** через Mason
- **Адаптивное форматирование** при сохранении файлов
- **Визуализация изменений Git** в реальном времени

## Рекомендации
Для максимальной производительности используйте [Nerd Fonts](https://www.nerdfonts.com/) в терминале.
