(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode))

(use-package company
  :ensure t
  :config (global-company-mode t))

(use-package company-statistics
  :ensure t
  :config (company-statistics-mode))

;; (use-package company-quickhelp
;;   :ensure t
;;   :config (company-quickhelp-mode))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode t)
  (setq flycheck-checker-error-threshold 1000))

(use-package aweshell
  :ensure (:host github :repo "manateelazycat/aweshell")
  :config
  (defvar tfm/aweshell-command-map (let ((map (make-sparse-keymap)))
                                     (define-key map (kbd "s") #'aweshell-new)
                                     (define-key map (kbd "n") #'aweshell-next)
                                     (define-key map (kbd "p") #'aweshell-prev)
                                     (define-key map (kbd "t") #'aweshell-dedicated-toggle)
                                     (define-key map (kbd "r") #'aweshell-sudo-toggle)
                                     (define-key map (kbd "b") #'aweshell-switch-buffer)
                                     map)
    "Custom command map for use with aweshell.")
  (fset 'tfm/aweshell-command-map tfm/aweshell-command-map)
  (setq eshell-prompt-function 'epe-theme-lambda)
  :bind
  (:map ergoemacs-user-keymap ("<menu> s" . tfm/aweshell-command-map)))

(use-package eshell-up
  :ensure t
  :config
  (setq eshell-up-ignore-case nil
        eshell-up-print-parent-dir t))

(use-package dap-mode
  :ensure t
  :config
  (defvar tfm/dap-mode-command-map (let ((map (make-sparse-keymap)))
                                     (define-key map (kbd "b") #'dap-ui-breakpoints-list)
                                     (define-key map (kbd "c") #'dap-continue)
                                     (define-key map (kbd "d") #'dap-debug)
                                     (define-key map (kbd "i") #'dap-step-in)
                                     (define-key map (kbd "k") #'dap-breakpoint-delete-all)
                                     (define-key map (kbd "l") #'dap-ui-locals)
                                     (define-key map (kbd "n") #'dap-next)
                                     (define-key map (kbd "o") #'dap-step-out)
                                     (define-key map (kbd "r") #'dap-ui-repl)
                                     (define-key map (kbd "s") #'dap-ui-sessions)
                                     (define-key map (kbd "z") #'dap-disconnect)
                                     map)
    "Custom command map for use with dap-mode.")
  (fset 'tfm/dap-mode-command-map tfm/dap-mode-command-map)
  (require 'dap-python)
  (require 'dap-dlv-go)
  (setq dap-python-executable "python3"
	dap-python-debugger 'debugpy
	dap-auto-configure-features '(tooltip))
  :bind
  (:map ergoemacs-user-keymap ("<menu> d" . tfm/dap-mode-command-map)))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "<menu> l"
	lsp-prefer-flymake nil
	lsp-diagnostics-provider :none)
  :config
  (unbind-key "<mouse-3>" lsp-mode-map)
  (fset 'lsp-command-map lsp-command-map)
  (add-to-list 'lsp-language-id-configuration '(".*\\.gohtml$" . "html"))
  (add-to-list 'lsp-language-id-configuration '(".*\\.html$" . "html"))
  (add-to-list 'lsp-language-id-configuration '(".*\\.css$" . "css"))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "html-ls")
		    :activation-fn (lsp-activate-on "html")
		    :server-id 'html-ls))
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :bind
  (:map lsp-mode-map
	([<mouse-3>] . mouse-save-then-kill)
	("<menu> l" . lsp-command-map))
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package helm-lsp
  :ensure t
  :commands helm-lsp-workspace-symbol)

(use-package taskrunner
  :ensure t)

(use-package transient
  :ensure t)

(use-package magit
  :ensure t
  :after transient
  :bind ("C-x g" . magit-status))

(use-package projectile
  :ensure t
  :config (projectile-mode t)
  :bind (:map ergoemacs-user-keymap
	      ("<menu> p" . projectile-command-map)))

(use-package google-this
  :ensure t
  :config (google-this-mode)
  :bind (:map ergoemacs-user-keymap ("<menu> g". google-this-mode-submap)))

(use-package ripgrep
  :ensure t
  :ensure-system-package (rg . ripgrep))

(use-package yasnippet
  :ensure t
  :config
  (yas-reload-all)
  (yas-global-mode t))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package buffer-name-relative
  :ensure t
  :init (buffer-name-relative-mode))

(use-package dashboard
  :ensure t
  :config
  (add-hook 'elpaca-after-init-hook #'dashboard-insert-startupify-lists)
  (add-hook 'elpaca-after-init-hook #'dashboard-initialize)
  (setq dashboard-projects-backend 'projectile
	dashboard-items '((recents . 25)
			  (projects . 25))
	dashboard-set-navigator nil)
  (dashboard-setup-startup-hook))

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1))

(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  (helm-autoresize-mode 1)
  (setq helm-move-to-line-cycle-in-source nil)
  (define-key global-map [remap find-file] 'helm-find-files)
  (define-key global-map [remap occur] 'helm-occur)
  (define-key global-map [remap list-buffers] 'helm-buffers-list)
  (define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
  (define-key global-map [remap execute-extended-command] 'helm-M-x)
  (define-key global-map [remap apropos-command] 'helm-apropos))

(use-package helm-rg :ensure t)

(use-package zoom
  :ensure t
  :config
  (zoom-mode t)
  (setq zoom-size '(0.618 . 0.618)))

(use-package drag-stuff
  :ensure t
  :config
  (drag-stuff-global-mode)
  (drag-stuff-define-keys))

(use-package solarized-theme
  :ensure t
  :config (load-theme 'solarized-light t))

(use-package rainbow-delimiters
  :ensure t
  :hook ((prog-mode . rainbow-delimiters-mode)))

(use-package rainbow-mode
  :ensure t
  :config (rainbow-mode))

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package kubernetes
  :ensure t
  :ensure-system-package kubectl)

(use-package docker
  :ensure t)

(use-package emacs
  :ensure nil
  :config
  (setq x-underline-at-descent-line t
	frame-resize-pixelwise t)
  (if (eq system-type 'gnu/linux)
      (set-frame-font "terminus 12" t t))
  (display-line-numbers-mode t)
  (line-number-mode t)
  (column-number-mode t)
  (show-paren-mode t)
  (if (not (eq system-type 'darwin))
      (menu-bar-mode -1))
  (blink-cursor-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (horizontal-scroll-bar-mode -1)
  (windmove-default-keybindings)
  (delete-selection-mode t)
  (fset 'yes-or-no-p 'y-or-n-p)
  (set-default 'truncate-lines t))

(provide 'interface)
