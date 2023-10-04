;; Emacs Configurtions

;; C-M-i completes options
;; C-h v describe variables
;; C-h f describes functions

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (message "Loaded Emacs in %.03fs"
		     (float-time (time-subtract after-init-time before-init-time)))))

(add-to-list 'load-path "~/.dotfiles/config/emacs")

(require 'ss2-lib) ; needs to be loaded first

(require 'ss2-settings)
(require 'ss2-appearance)
(require 'ss2-package)
(require 'ss2-lsp)
