;; Package configuration

(add-to-list 'load-path "~/.dotfiles/config/emacs/packages")

;; unconfigured packages
(require 'use-package)

;; configured packages
(require 'ss2-eglot)
(require 'ss2-org)
(require 'ss2-org-roam)
(require 'ss2-nix-mode)

(provide 'ss2-package)
