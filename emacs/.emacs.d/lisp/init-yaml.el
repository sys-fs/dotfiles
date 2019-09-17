(mapc (lambda (mode)
	(add-hook 'yaml-mode-hook mode))
      '(ansible
	ansible-doc-mode))

(provide 'init-yaml)
