;;; Company

(use-package company
  :hook
  ;; enable for prog and text modes only
  (prog-mode . company-mode)
  (text-mode . company-mode)
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 2))

(provide 'ss2-company)
