-- language server configurations

require('ss2-lib').bootstrapModule({
  name = 'lspconfig',
  install = function ()
    -- TODO: plug/packer install
  end,
  configure = function (lspconfig)
    -- configure with neovim in mind
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT'
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
            }
          },
          telemetry = {
            enable = false
          }
        }
      }
    })
    lspconfig.rnix.setup({})
    lspconfig.hls.setup({})
  end
})
