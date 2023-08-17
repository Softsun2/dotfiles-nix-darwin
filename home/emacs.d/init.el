;; Emacs Configurtions  -- ELisp

;; C-M-i completes options
;; C-h v describe variables
;; C-h f describes functions

;; TOOD:
;; Sentences delimeted by ".  " instead of ". "
;; org mode move headlines with M-n and M-p ?


;; Add config dir to load path
(add-to-list "~/.emacs.d")

(scroll-bar-mode -1) ; disable scroll bar
(global-display-line-numbers-mode 1) ; enable line numbers
(load-theme 'modus-vivendi nil) ; set theme
(setq ring-bell-function 'ignore) ; disable audio bell
(setq make-backup-files nil) ; disable backup files
(setq mac-command-modifier 'meta) ; set command-key to meta
(setq auto-save-default nil) ; disable auto-save
(require 'org)


;; Package Management
(require 'ss2-package)
