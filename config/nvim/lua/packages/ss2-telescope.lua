Ss2.useModule({
  name = 'telescope',
  required = true,
  configure = function (telescope)
    -- setup telescope
    local actions = Ss2.safeLoadModule('telescope.actions')
    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        results_title = false,
        mappings = {
          -- TODO: make this consistent with lsp completions
          i = {
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<C-w>'] = "which_key",
            ['<C-h>'] = actions.select_default,
            ['<C-u>'] = actions.preview_scrolling_up,
            ['<C-d>'] = actions.preview_scrolling_down,
            ['<C-n>'] = false,
            ['<C-p>'] = false,
          },
        },
      },
      pickers = {
        find_files = {
          theme = 'ivy',
          previewer = false,
          layout_config = { height = 9, },
        },
        live_grep = {
          theme = 'dropdown',
        },
      },
    })
    -- additional keybinds
    local builtin = Ss2.safeLoadModule('telescope.builtin')
    -- TODO: situationally use builtin.git_files
    Ss2.nKeymap('<leader>tf', builtin.find_files)
    Ss2.nKeymap('<leader>tg', builtin.live_grep)
    Ss2.nKeymap('<leader>th', builtin.help_tags)
    Ss2.nKeymap('<leader>ta', ":Telescope<CR>")
  end
})
