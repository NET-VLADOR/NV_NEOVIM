local M = {}

M.current = {
  name = 'catppuccin',
  flavour = 'mocha',
  transparent = false,
  palette = nil,
}

M.subscribers = {}

function M.setup()
  require('catppuccin').setup {
    flavour = M.current.flavour,
    transparent_background = M.current.transparent,
    integrations = {
      diffview = true,
      telescope = { enabled = true, style = 'nvchad' },
      dropbar = { enabled = true, color_mode = true },
      mason = true,
      snacks = { enabled = true, indent_scope_color = 'text' },
      neogit = true,
      noice = true,
      treesitter_context = true,
      which_key = true,
      nvimtree = true,
      lsp_trouble = true,
      blink_cmp = true,
      gitsigns = true,
      treesitter = true,
      notify = true,
    },
  }

  vim.cmd.colorscheme(M.current.name)
  M.current.palette = require('catppuccin.palettes').get_palette()

  vim.cmd('highlight FloatBorder guifg=' .. M.current.palette.mauve)
  vim.cmd('highlight NotifyINFOBorder guifg=' .. M.current.palette.mauve)
  vim.cmd('highlight NotifyINFOTitle guifg=' .. M.current.palette.mauve)
  vim.cmd('highlight BufferLineIndicatorSelected guifg=' .. M.current.palette.mauve)
  vim.cmd('highlight SnacksNotifierTitleInfo guifg=' .. M.current.palette.mauve)
  vim.cmd('highlight SnacksNotifierBorderInfo guifg=' .. M.current.palette.mauve)
  vim.cmd('highlight SnacksDashboardHeader guifg=' .. M.current.palette.mauve)
  vim.cmd('highlight SnacksDashboardDesc guifg=' .. M.current.palette.subtext0)
  vim.cmd('highlight SnacksDashboardFooter guifg=' .. M.current.palette.blue)

  M.notify_subscribers()
end

function M.show_flavour_menu()
  local flavours = { 'latte', 'frappe', 'macchiato', 'mocha' }
  vim.ui.select(flavours, {
    prompt = 'Выберите тему Catppuccin:',
    format_item = function(item)
      return item:gsub('^%l', string.upper)
    end,
  }, function(choice)
    if choice then
      M.set_flavour(choice)
    end
  end)
end

function M.subscribe(fn)
  table.insert(M.subscribers, fn)
end

function M.notify_subscribers()
  for _, fn in ipairs(M.subscribers) do
    pcall(fn, M.current.palette)
  end
end

function M.toggle_transparency()
  M.current.transparent = not M.current.transparent
  M.setup()
  print('Прозрачность: ' .. (M.current.transparent and 'ВКЛ' or 'ВЫКЛ'))
end

function M.set_flavour(flavour)
  M.current.flavour = flavour
  M.setup()
  print('Тема: ' .. flavour:gsub('^%l', string.upper))
end

return M
