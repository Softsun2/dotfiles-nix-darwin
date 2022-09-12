local opt = vim.opt


-- nvim-treesitter
require("nvim-treesitter.configs").setup {
  -- gcc is capable of compiling the following parsers
  -- clang was unable to (for me)
  ensure_installed = {
    "nix", "lua",
    "bash",
    "c", "cpp", "make",
    "python",
    "html", "css", "json",
  },
  highlight = { enable = true },
}
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
-- if running into invalid node errors:
-- rm -rf ~/.local/share/nvim
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/1858


-- nvim-tree-lua
require("nvim-tree").setup {
  git = {
    enable = false    -- git component creates lag
  }
}

-- indent-blankline-nvim
opt.list = true
opt.listchars:append "space:⋅"
opt.listchars:append "eol:↴"
opt.listchars:append "trail:⌢"
require("indent_blankline").setup {
  show_end_of_line = true,
  space_char_blankline = " ",
}

