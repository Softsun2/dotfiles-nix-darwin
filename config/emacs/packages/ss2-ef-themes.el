;;; Ef Themes

(use-package ef-themes
  :ensure nil
  :init
  (load-theme 'ef-day :no-confirm)
  (custom-set-faces
   '(mode-line ((t :box (:style released-button)))))
  :custom
  (ef-themes-to-toggle '(ef-day ef-autumn))
  :bind
  (("<f5>" . ef-themes-toggle)))

(provide 'ss2-ef-themes)
