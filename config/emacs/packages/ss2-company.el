;;; Company

(use-package company
  :hook
  ;; enable for prog and text modes only
  ('prog-mode-hook 'company-mode)
  ('text-mode-hook 'company-mode)
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 1)
  :config
  ;; disable buffer completion candidates
  (setq company-backends (delete 'company-dabbrev company-backends))
  (setq company-backends (delete 'company-dabbrev-code company-backends)))

(provide 'ss2-company)
