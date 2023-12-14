-- richer language parsing features

require('ss2-lib').bootstrapModule({
  name = 'nvim-treesitter.configs',
  install = function ()
    -- TODO: plug/packer install
  end,
  configure = function (nvimTreesitter)
    -- local parserInstallDir = nix vs non-nix
    nvimTreesitter.setup({
      auto_install = false,
        -- parser_install_dir = parserInstallDir
        -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
      highlights = { enable = true }
    })
    -- TODO: use treesitter for folding
  end
})
