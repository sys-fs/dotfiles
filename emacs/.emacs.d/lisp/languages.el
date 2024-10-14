;; C
(use-package cc-mode
  :ensure nil
  :hook ((c-mode-common-hook . (lambda ()
				(setq indent-tabs-mode t)
				(c-set-style "linux")))))

;; Common Lisp
(use-package slime
  :ensure t
  :ensure-system-package sbcl
  :config
  (setq inferior-lisp-program "sbcl")
  (slime-setup '(slime-fancy)))

;; Docker
(use-package dockerfile-mode
  :ensure t)

;; Groovy
(use-package groovy-mode
  :ensure t)

;; Python
(use-package elpy
  :ensure t
  :init (elpy-enable)
  :config
  (setq elpy-formatter 'black)
  (remove-hook 'elpy-modules 'elpy-module-flymake)
  :hook (elpy-mode . (lambda ()
                       (add-hook 'before-save-hook
                                 'elpy-black-fix-code nil t))))

(use-package python-mode
  :ensure nil
  :config
  (setq flycheck-python-pycompile-executable "python3"
	flycheck-python-pylint-executable "python3"
	fill-column 120)
  (add-to-list 'flycheck-disabled-checkers 'python-flake8)
  :hook (python-mode . lsp))

(if (eq system-type 'darwin)
    (use-package poetry
      :ensure t
      :ensure-system-package ("/opt/homebrew/bin/poetry" . "pip3 install poetry")
      :hook (python-mode-hook . poetry-tracking-mode))
  (use-package poetry
    :ensure t
    :ensure-system-package ("~/.local/bin/poetry" . "pip3 install --user poetry")
    :hook (python-mode-hook . poetry-tracking-mode)))

;; Golang
(use-package go-mode
  :ensure t
  :ensure-system-package ((go . go)
			  ("~/go/bin/gopls" . "go install golang.org/x/tools/gopls@latest"))
  :hook ((go-mode . lsp)
	 (before-save . gofmt-before-save)))

;; Terraform
(if (eq system-type 'darwin)
    (use-package terraform-mode
      :ensure t
      :hook ((terraform-mode . terraform-format-on-save-mode)
	     (terraform-mode . lsp)))
  (use-package terraform-mode
    :ensure t
    :ensure-system-package terraform
    :hook ((terraform-mode . terraform-format-on-save-mode)
	   (terraform-mode . lsp))))

;; Markup
(use-package markdown-mode
  :ensure t)

(use-package pandoc
  :ensure t
  :ensure-system-package pandoc)

;; Data formats
(use-package json-mode
  :ensure t)

(use-package yaml-mode
  :ensure t)

;; Ansible
(if (eq system-type 'darwin)
    (use-package ansible
      :ensure t
      :ensure-system-package ansible
      :hook ((yaml-mode-hook . ansible)
	     (ansible-mode-hook . lsp)))
  (use-package ansible
    :ensure t
    :ensure-system-package ("~/.local/bin/ansible" . "pip3 install --user ansible")
    :hook ((yaml-mode-hook . ansible)
	   (ansible-mode-hook . lsp))))

(use-package ansible-doc
  :ensure t
  :hook (ansible-mode-hook . ansible-doc-mode))

(use-package jinja2-mode
  :ensure t)

;; Web development
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.gohtml\\'" . web-mode))
  (setq web-mode-engines-alist '(("go" . "\\.gohtml\\'"))
	web-mode-enable-auto-pairing nil))

(use-package company-web
  :ensure t
  :config (require 'company-web-html))

(provide 'languages)
