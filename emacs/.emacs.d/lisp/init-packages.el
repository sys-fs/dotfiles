(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(package-refresh-contents)

(mapc (lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      '(ansible
	ansible-doc
	ansible-vault
        company
	company-c-headers
	company-terraform
	elpy
	helm
	jinja2-mode
	json-mode
	magit
	mu4e-alert
	rainbow-delimiters
	smartparens
	solarized-theme
	terraform-mode
	yaml-mode))

(provide 'init-packages)
