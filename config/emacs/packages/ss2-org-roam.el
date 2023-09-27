(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/softsun2/writing/org-roam")
  (org-roam-completion-everywhere t)
  (org-roam-dailies-directory "journal/")  ; relative to the org-roam dir
  :bind
  (("C-c n l" . org-roam-buffer-toggle)
   ("C-c n f" . org-roam-node-find)
   ("C-c n i" . org-roam-node-insert)
   :map org-mode-map
   ("C-M-i" . completion-at-point)
   :map org-roam-dailies-map
   ; explicity map org-roam-dailies-map
   ("n" . org-roam-dailies-capture-today)
   ("Y" . org-roam-dailies-capture-yesterday)
   ("T" . org-roam-dailies-capture-tomorrow)
   ("f" . org-roam-dailies-goto-next-note)
   ("b" . org-roam-dailies-goto-previous-note)
   ("c" . org-roam-dailies-goto-date)
   ("v" . org-roam-dailies-capture-date)
   ("." . org-roam-dailies-find-directory))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies)
  (org-roam-setup))

(provide 'ss2-org-roam)
