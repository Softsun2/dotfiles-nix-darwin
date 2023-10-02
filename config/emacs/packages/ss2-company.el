;;; Company

(use-package company
  :hook (after-init . global-company-mode)
  :custom
  (company-minimum-prefix-length 2))

(provide 'ss2-company)
