;;; utilities used by all languages
(use-package company
  :demand t
  :config (global-company-mode t))

(use-package company-statistics
  :demand t
  :config (company-statistics-mode))

(use-package company-quickhelp
  :demand t
  :config (company-quickhelp-mode))

(use-package flycheck
  :demand t
  :config
  (setq flycheck-python-pycompile-executable "python3"
	flycheck-python-flake8-executable "python3")
  (global-flycheck-mode t))

(use-package lsp-mode
  :demand t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "<menu> l"
	lsp-prefer-flymake nil
	lsp-diagnostics-provider :none
	;;lsp-intelephense-licence-key (password-store-get "intelephense")
	)
  :config (unbind-key "<mouse-3>" lsp-mode-map)
  ;;  (add-to-list 'lsp--formatting-indent-alist '(php-mode . 2))
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :bind
  (:map lsp-mode-map ([<mouse-3>] . mouse-save-then-kill))
  :commands lsp)

(use-package lsp-ui
  :demand t
  :commands lsp-ui-mode)

(use-package helm-lsp
  :demand t
  :commands helm-lsp-workspace-symbol)

(use-package magit
  :demand t
  :bind ("C-x g" . magit-status))

(use-package smartparens
  :demand t
  :init
  (require 'smartparens-config)
  :config
  (sp-local-pair 'terraform-mode "/*" "*/" :post-handlers '((" | " "SPC")
							    ("* ||\n[i]" "RET")))
  (smartparens-global-mode)
  :hook (emacs-lisp-mode-hook . smartparens-strict-mode))

(use-package yasnippet
  :demand t
  :config
  (yas-reload-all)
  (yas-global-mode t)
  :bind
  (:map yas-minor-mode-map
	([tab] . nil)
	("TAB" . nil)
	("<tab>" . nil)
	:map ergoemacs-user-keymap ("C-'" . yas-expand)))

;;; languages

;; C
(use-package cc-mode
  :elpaca nil
  :hook ((c-mode-common-hook . (lambda ()
				(setq indent-tabs-mode t)
				(c-set-style "linux")))))

;; Common Lisp
(use-package slime
  :demand t
  :ensure-system-package sbcl
  :config
  (setq inferior-lisp-program "sbcl")
  (slime-setup '(slime-fancy)))

;; Python
(use-package elpy
  :demand t
  :init (elpy-enable))

(use-package python-mode
  :elpaca nil
  :hook (python-mode . lsp-deferred))

(if (eq system-type 'darwin)
    (use-package poetry
      :demand t
      :ensure-system-package ("/opt/homebrew/bin/poetry" . "pip3 install poetry")
      :hook (python-mode-hook . poetry-tracking-mode))
  (use-package poetry
    :demand t
    :ensure-system-package ("~/.local/bin/poetry" . "pip3 install --user poetry")
    :hook (python-mode-hook . poetry-tracking-mode)))

;; Golang
(use-package go-mode
  :demand t
  :ensure-system-package ((go . go)
			  ("~/go/bin/gopls" . "go install golang.org/x/tools/gopls@latest"))
  :hook ((go-mode . lsp-deferred)
	 (go-mode . gofmt-before-save)))

;; Terraform
(if (eq system-type 'darwin)
    (use-package terraform-mode
      :demand t
      :ensure-system-package (terraform .  hashicorp/tap/terraform)
      :hook ((terraform-mode . terraform-format-on-save-mode)
	     (terraform-mode . lsp-deferred)))
  (use-package terraform-mode
    :demand t
    :ensure-system-package terraform
    :hook ((terraform-mode . terraform-format-on-save-mode)
	   (terraform-mode . lsp-deferred))))

;; Markup
(use-package markdown-mode
  :demand t)

;; Data formats
(use-package json-mode
  :demand t)

(use-package yaml-mode
  :demand t)

;; Ansible
(if (eq system-type 'darwin)
    (use-package ansible
      :demand t
      :ensure-system-package ansible
      :hook ((yaml-mode-hook . ansible)
	     (ansible-mode-hook . lsp-deferred)))
  (use-package ansible
    :demand t
    :ensure-system-package ("~/.local/bin/ansible" . "pip3 install --user ansible")
    :hook ((yaml-mode-hook . ansible)
	   (ansible-mode-hook . lsp-deferred))))

(use-package ansible-doc
  :demand t
  :hook (yaml-mode-hook . ansible-doc-mode))

(use-package jinja2-mode
  :demand t)

(provide 'languages)
