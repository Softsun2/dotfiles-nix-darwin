;;; Ss2 Lib


;; Variables


;; Functions


;; Commands

(defun ss2-edit-init ()
  "Opens ss2's init.el file."
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
