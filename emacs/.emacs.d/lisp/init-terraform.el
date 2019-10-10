(add-hook 'terraform-mode-hook #'company-terraform-init)
(add-hook 'terraform-mode-hook #'terraform-format-on-save-mode)

(provide 'init-terraform)
