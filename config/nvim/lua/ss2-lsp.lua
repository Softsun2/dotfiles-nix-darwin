-- language server configurations
Ss2.bootstrapModule({
  name = "lspconfig",
  configure = function (lspconfig)
    -- configure with neovim in mind
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          workspace = {
            checkThirdParty = false,
            library = { vim.env.VIMRUNTIME }
          },
          telemetry = { enable = false }
        }
      }
    })
    lspconfig.rnix.setup({})
    lspconfig.hls.setup({})
  end
})

-- completion engine
Ss2.bootstrapModule({
  name = "cmp",
  configure = function (cmp)
    cmp.setup({
      snippet = {
        expand = function(args)
          Ss2.safeLoadModule("luasnip").lsp_expand(args.body)
        end
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(2),
        ["<C-u>"] = cmp.mapping.scroll_docs(-2),
        ["<C-h>"] = cmp.mapping.confirm({ select = true }), -- <3
        ["<C-g>"] = cmp.mapping({
          i = cmp.mapping.abort(),  -- insert mode
          c = cmp.mapping.close(),  -- command mode
        })
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp", keyword_length = 3, entry_filter =
          -- don't suggest buffer text or snippet completions
          function (entry, _)
            local kind = Ss2.safeLoadModule("cmp.types").lsp.CompletionItemKind[entry:get_kind()]
            return kind ~= "Text" and kind ~= "Snippet"
          end
        },
        { name = "path", keyword_length = 3 },
      },
      {
        { name = "nvim_lua", keyword_length = 3 }
      }),
      experimental = { ghost_text = true }
    })
  end
})
