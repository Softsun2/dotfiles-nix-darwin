;;; org mode config

(use-package org
  :ensure nil

  :commands
  (org-agenda-file-find)
  
  :custom
  (org-agenda-files '("~/softsun2/agenda/"))
  (org-todo-keywords
   '((sequence "TODO(t)" "|" "DONE(d!)")
     (sequence "|" "CANCELLED(c@)")))
  ;; TODO: Make rest of cancelled text red
  (org-todo-keyword-faces
   '(("CANCELLED" . (:foreground "red" :weight bold))))
  (org-habit-graph-column 60)
  (org-log-into-drawer t)
  (org-enforce-todo-dependencies t)
  
  :config
  ;; TODO: Capture template for new agenda files?
  (defun org-agenda-file-find ()
    "Search for an agenda file and open it, if the agenda file doesn't
     exist it is created."
    (interactive)
    (let*
	((agenda-directory (car org-agenda-files))
	 (agenda-files
	  (directory-files agenda-directory nil org-agenda-file-regexp))
	 (input
	  (completing-read "Agenda File: " agenda-files))
	 (target-agenda-file (concat agenda-directory input)))
      (find-file target-agenda-file)))

  ;; TODO: Make an option to view agenda by file
  
  (add-to-list 'org-modules 'org-habit)
  
  :bind
  (("C-c a n" . org-agenda)
   ("C-c a f" . org-agenda-file-find)))

(provide 'ss2-org)
