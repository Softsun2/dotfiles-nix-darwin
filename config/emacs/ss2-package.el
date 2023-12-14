;; Package configuration

(add-to-list 'load-path "~/.dotfiles/config/emacs/packages")

(require 'use-package)

(require 'ss2-org)
(require 'ss2-org-roam)
(require 'ss2-company)
;; (require 'ss2-expand-region)

(provide 'ss2-package)
