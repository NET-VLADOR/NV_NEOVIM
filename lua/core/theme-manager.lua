local M = {}

M.current = {
  name = 'catppuccin',
  flavour = 'mocha',
  transparent = false,
  palette = nil,
}

M.subscribers = {}

function M.setup()
  M.reload_theme()
end

function M.reload_theme()
  require('catppuccin').setup {
    flavour = M.current.flavour,
    transparent_background = M.current.transparent,
    integrations = {
      alpha = true,
      notify = true,
      telescope = true,
      which_key = true,
      nvimtree = true,
      lsp_trouble = true,
      cmp = true,
      gitsigns = true,
      treesitter = true,
    },
  }

  vim.cmd.colorscheme(M.current.name)
  M.current.palette = require('catppuccin.palettes').get_palette()

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
  M.reload_theme()
  print('Прозрачность: ' .. (M.current.transparent and 'ВКЛ' or 'ВЫКЛ'))
end

function M.set_flavour(flavour)
  M.current.flavour = flavour
  M.reload_theme()
  print('Тема: ' .. flavour:gsub('^%l', string.upper))
end

return M
