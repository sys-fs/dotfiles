(mapc (lambda (hook)
	(add-hook 'terraform-mode hook))
      '(company-terraform-init terraform-format-on-save-mode))

(provide 'init-terraform)
