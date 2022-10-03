(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(package-refresh-contents)

(mapc (lambda (package)
	(unless (package-installed-p package)
	  (package-install package)))
      '(0x0
	ansible
	ansible-doc
	ansible-vault
        aggressive-indent
	avy
	calibredb
        centaur-tabs
        company
	composer
	dashboard
	doom-modeline
	drag-stuff
	drupal-mode
	edit-server
	eldoc
	elpy
	ergoemacs-mode
	eshell-prompt-extras
	eshell-syntax-highlighting
	eshell-up
	exec-path-from-shell
	feature-mode
	flycheck
        go-mode
	google-this
	helm
	helm-lsp
	helm-pass
	helm-slime
	helm-system-packages
	htmlize
	jinja2-mode
	json-mode
	lastpass
	ledger-mode
	lsp-mode
	lsp-ui
	magit
	markdown-mode
	ob-php
	org-roam
	ox-reveal
	password-store
        php-mode
	poetry
	projectile
	rainbow-delimiters
	rainbow-mode
	ranger
	restclient
	ripgrep
        smartparens
	solarized-theme
	slime
	slime-company
	terraform-mode
	use-package
	visual-regexp-steroids
	yaml-mode
	yasnippet
	yasnippet-snippets
	zoom))

(provide 'init-packages)
