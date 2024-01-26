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

;; Docker
(use-package dockerfile-mode
  :demand t)

;; Python
(use-package elpy
  :demand t
  :init (elpy-enable)
  :config (setq elpy-formatter 'black)
  :hook (elpy-mode . (lambda ()
                       (add-hook 'before-save-hook
                                 'elpy-black-fix-code nil t))))

(use-package python-mode
  :elpaca nil
  :config
  (setq flycheck-python-pycompile-executable "python3"
	flycheck-python-pylint-executable "python3"
	fill-column 120)
  (add-to-list 'flycheck-disabled-checkers 'python-flake8)
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

;; PHP
(use-package php-mode
  :demand t
  :config
  (setq lsp-intelephense-licence-key (password-store-get "intelephense"))
  (add-to-list 'lsp--formatting-indent-alist '(php-mode . 2)))

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

(use-package pandoc
  :demand t
  :ensure-system-package pandoc)

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
  :hook (ansible-mode-hook . ansible-doc-mode))

(use-package jinja2-mode
  :demand t)

;; Web development
(use-package web-mode
  :demand t
  :config
  (add-to-list 'auto-mode-alist '("\\.gohtml\\'" . web-mode))
  (setq web-mode-engines-alist '(("go" . "\\.gohtml\\'")))
  :hook (web-mode . (lambda ()
		      (indent-tabs-mode nil))))

(provide 'languages)
