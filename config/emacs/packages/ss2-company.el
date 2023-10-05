;;; Company

(use-package company
  :hook
  ;; enable for prog and text modes only
  (prog-mode . company-mode)
  (text-mode . company-mode)
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 3)
  :config
  ;; disable buffer completion candidates
  ;; (setq company-backends
  ;; 	(delete 'company-dabbrev company-backends))
  ;; (setq company-backends
  ;; 	(delete 'company-dabbrev-code company-backends)))
  )

(provide 'ss2-company)
