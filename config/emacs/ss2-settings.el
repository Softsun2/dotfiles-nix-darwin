;; TOOD:
;; Sentences delimeted by ".  " instead of ". "
;; org mode move headlines with M-n and M-p ?

; disable scroll bar
(scroll-bar-mode -1)
; enable line numbers
(global-display-line-numbers-mode 1)
; set theme
(setq ss2-dark-theme-mode t)
(setq ss2-light-theme 'modus-operandi)
(setq ss2-dark-theme 'modus-vivendi)
(ss2-load-theme)
; disable audio bell
(setq ring-bell-function 'ignore)
; disable backup files
(setq make-backup-files nil)
; set command-key to meta
(setq mac-command-modifier 'meta)
; disable auto-save
(setq auto-save-default nil)
; discard imperative configuration
(setq custom-file (make-temp-file ""))
; use 'y' and 'n' instead of 'yes' and 'no'
(fset 'yes-or-no-p 'y-or-n-p)
; paragraph filling
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;; enable icomplete mode
(fido-vertical-mode 1)


(provide 'ss2-settings)
