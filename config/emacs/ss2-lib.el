;;; Ss2 Lib


;; Variables

(defvar ss2-dark-theme-mode t
  "Boolean indicating if the theme is in dark mode.")
(defvar ss2-light-theme nil
  "Configured light theme.")
(defvar ss2-dark-theme nil
  "Configured dark theme.")


;; Functions

(defun ss2-load-theme ()
  "Loads configured light or dark theme depending on ss2-dark-theme-mode."
  (if (and ss2-dark-theme-mode ss2-dark-theme)
      (load-theme ss2-dark-theme)
    (if ss2-light-theme
	(load-theme ss2-light-theme))))


;; Commands

(defun ss2-toggle-theme-mode ()
  "Toggles between the configured ss2-dark-theme and ss2-light-theme."
  (interactive)
  (setq ss2-dark-theme-mode (not ss2-dark-theme-mode))
  (ss2-load-theme))
(defun ss2-edit-init ()
  "Opens ss2's init.el file"
  (interactive)
  (find-file "~/.dotfiles/config/emacs/ss2-init.el"))
(defun ss2-open-emacs-dir ()
  "Opens ss2's configuration directory."
  (interactive)
  (find-file "~/.dotfiles/config/emacs/"))
(defun ss2-open-dotfiles-dir ()
  "Opens ss2's dotfiles directory."
  (interactive)
  (find-file "~/.dotfiles/"))


(provide 'ss2-lib)
