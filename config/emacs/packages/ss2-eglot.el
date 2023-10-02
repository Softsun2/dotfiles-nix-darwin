;; Eglot Configuration

(use-package eglot
  :ensure t
  :after nix-mode
  :hook (nix-mode . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs '(nix-mode . ("rnix-lsp"))))

(provide 'ss2-eglot)
