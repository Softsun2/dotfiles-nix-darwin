;;; LSP Configuration

;;; Language Modes
(use-package tuareg :ensure nil)
(use-package nix-mode :ensure nil :mode "\\.nix\\'")

;;; LSP
(use-package eglot
  :ensure nil
  :hook
  (nix-mode . eglot-ensure)
  (python-mode . eglot-ensure)
  (c-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (tuareg-mode . eglot-ensure)

  :config
  ;; explicitly declare which language servers to use
  ;; https://github.com/joaotavora/eglot/blob/master/eglot.el
  (setq eglot-server-programs '())

  (add-to-list 'eglot-server-programs
	       '(nix-mode . ("rnix-lsp")))
  
  (add-to-list 'eglot-server-programs
	       '((python-mode python-ts-mode) .
		 ("pyright-langserver" "--stdio")))
  
  (add-to-list 'eglot-server-programs
	       '((c-mode c-ts-mode c++-mode c++-ts-mode) . ("ccls")))
  
  (add-to-list 'eglot-server-programs
	       '(tuareg-mode . ("ocamllsp"))))


(provide 'ss2-lsp)
