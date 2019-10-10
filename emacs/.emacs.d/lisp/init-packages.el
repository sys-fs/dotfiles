;;; package --- Install packages
;;; Commentary:
;;; Code:

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(package-refresh-contents)

(mapc (lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      '(ac-php
	ansible
	ansible-doc
	ansible-vault
        company
	company-c-headers
	company-terraform
	elpy
	flycheck
	flycheck-status-emoji
	helm
	jinja2-mode
	json-mode
	magit
	mu4e-alert
	php-mode
	rainbow-delimiters
	smartparens
	solarized-theme
	slime
	terraform-mode
	yaml-mode))

(provide 'init-packages)
;;; init-packages ends here
