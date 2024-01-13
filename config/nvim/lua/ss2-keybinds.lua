-- leader key: space
vim.g.mapleader = " "

-- TODO: insert mode jump to center like <C-l> in emacs

-- swap escape and C-c in insert mode: the scarier one should be harder to press
Ss2.iKeymap("<Esc>", "<C-c>")
Ss2.iKeymap("<C-c>", "<Esc>")
