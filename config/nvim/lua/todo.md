# 01/06/24 todo

## lsp desired functionality
* [X] preview signature in normal mode: <C-k>
* [X] preview signature in insert mode: <C-k>
    * subtlety: overloaded functions only show the first available signature... Theres a cool package I found called lsp-overloads that appears to handle this pretty well. I actually found a [bug and a workaround](https://github.com/Issafalcon/lsp-overloads.nvim/issues/35)
* [X] hover doc is minimal but clear: K
* [ ] calls to function
* [X] rename: <leader>rn
* [X] format: <leader>f
* [X] code actions: <leader>ca
* [ ] a decent system for organizing jumping to errors/warnings

## VS lsp feature ~parity
* [ ] goto def
    * definition -> declaration -> definition ...
* [ ] goto dec (always goes to declaration)
* [ ] peek def
* [ ] find refs
    * vs does this just by grepping.. would be nice if you could search for references by signature
* [ ] completion suggestions
    * completion entries are just \[symbol] \[symbolname]
    * signature help floats for the best match

