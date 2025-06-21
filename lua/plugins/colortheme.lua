return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    local catppuccin_state = {
      flavour = vim.g.catppuccin_flavour,
      transparent_background = false,
      flavours = { 'latte', 'frappe', 'macchiato', 'mocha' },
    }

    local function setup_catppuccin()
      require('catppuccin').setup {
        flavour = catppuccin_state.flavour,
        transparent_background = catppuccin_state.transparent_background,
        integrations = {
          alpha = true,
          notify = true,
          telescope = true,
          which_key = true,
          neotree = true,
          lsp_trouble = true,
          cmp = true,
          gitsigns = true,
          treesitter = true,
        },
      }
      vim.cmd.colorscheme 'catppuccin'
    end

    setup_catppuccin()

    local function toggle_transparency()
      catppuccin_state.transparent_background = not catppuccin_state.transparent_background
      setup_catppuccin()

      local state = catppuccin_state.transparent_background and 'ВКЛ' or 'ВЫКЛ'
      print('Прозрачный фон: ' .. state)
    end

    local function switch_flavour(flavour)
      catppuccin_state.flavour = flavour
      vim.g.catppuccin_flavour = flavour
      setup_catppuccin()
      print('Тема изменена на: ' .. flavour:gsub('^%l', string.upper))
    end

    local function show_flavour_menu()
      vim.ui.select(catppuccin_state.flavours, {
        prompt = 'Выберите тему Catppuccin:',
        format_item = function(item)
          return item:gsub('^%l', string.upper)
        end,
      }, function(choice)
        if choice then
          switch_flavour(choice)
        end
      end)
    end

    vim.keymap.set('n', '<leader>tt', toggle_transparency, {
      noremap = true,
      silent = true,
      desc = 'Переключить прозрачность фона',
    })

    vim.keymap.set('n', '<leader>tc', show_flavour_menu, {
      noremap = true,
      silent = true,
      desc = 'Выбрать тему Catppuccin',
    })

    vim.keymap.set('n', '<leader>tfl', function()
      switch_flavour 'latte'
    end, {
      noremap = true,
      silent = true,
      desc = 'Тема: Latte (светлая)',
    })

    vim.keymap.set('n', '<leader>tff', function()
      switch_flavour 'frappe'
    end, {
      noremap = true,
      silent = true,
      desc = 'Тема: Frappe',
    })

    vim.keymap.set('n', '<leader>tfm', function()
      switch_flavour 'macchiato'
    end, {
      noremap = true,
      silent = true,
      desc = 'Тема: Macchiato',
    })

    vim.keymap.set('n', '<leader>tfM', function()
      switch_flavour 'mocha'
    end, {
      noremap = true,
      silent = true,
      desc = 'Тема: Mocha (тёмная)',
    })

    vim.api.nvim_create_user_command('CatppuccinFlavour', function(opts)
      if vim.tbl_contains(catppuccin_state.flavours, opts.args) then
        switch_flavour(opts.args)
      else
        print('Доступные темы: ' .. table.concat(catppuccin_state.flavours, ', '))
      end
    end, {
      nargs = 1,
      complete = function()
        return catppuccin_state.flavours
      end,
    })
  end,
}
