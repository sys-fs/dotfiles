(use-package smartparens
  :demand t
  :config (smartparens-global-mode))

(use-package company
  :demand t
  :config (global-company-mode t))

(use-package company-statistics
  :demand t
  :config (company-statistics-mode))

;; (use-package company-quickhelp
;;   :demand t
;;   :config (company-quickhelp-mode))

(use-package flycheck
  :demand t
  :config
  (global-flycheck-mode t)
  (setq flycheck-checker-error-threshold 1000))

;; (use-package dap-mode
;;   :demand t
;;   :config
;;   (defvar tfm/dap-mode-command-map (let ((map (make-sparse-keymap)))
;;                                      (define-key map (kbd "b") #'dap-ui-breakpoints-list)
;;                                      (define-key map (kbd "c") #'dap-continue)
;;                                      (define-key map (kbd "d") #'dap-debug)
;;                                      (define-key map (kbd "i") #'dap-step-in)
;;                                      (define-key map (kbd "k") #'dap-breakpoint-delete-all)
;;                                      (define-key map (kbd "l") #'dap-ui-locals)
;;                                      (define-key map (kbd "n") #'dap-next)
;;                                      (define-key map (kbd "o") #'dap-step-out)
;;                                      (define-key map (kbd "r") #'dap-ui-repl)
;;                                      (define-key map (kbd "s") #'dap-ui-sessions)
;;                                      (define-key map (kbd "z") #'dap-disconnect)
;;                                      map)
;;     "Custom command map for use with dap-mode.")
;;   (fset 'tfm/dap-mode-command-map tfm/dap-mode-command-map)
;;   (require 'dap-python)
;;   (require 'dap-dlv-go)
;;   (setq dap-python-executable "python3"
;; 	dap-python-debugger 'debugpy
;; 	dap-auto-configure-features '(tooltip))
;;   :bind
;;   (:map ergoemacs-user-keymap ("<menu> d" . tfm/dap-mode-command-map)))

(use-package lsp-mode
  :demand t
  :init
  (setq lsp-keymap-prefix "<menu> l"
	lsp-prefer-flymake nil
	lsp-diagnostics-provider :none)
  :config
  (unbind-key "<mouse-3>" lsp-mode-map)
  (fset 'lsp-command-map lsp-command-map)
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :bind
  (:map lsp-mode-map
	([<mouse-3>] . mouse-save-then-kill)
	("<menu> l" . lsp-command-map))
  :commands lsp)

(use-package lsp-ui
  :demand t
  :commands lsp-ui-mode)

(use-package helm-lsp
  :demand t
  :commands helm-lsp-workspace-symbol)

(use-package taskrunner
  :demand t)

(use-package magit
  :demand t
  :bind ("C-x g" . magit-status))

(use-package projectile
  :demand t
  :config (projectile-mode t)
  :bind (:map ergoemacs-user-keymap
	      ("<menu> p" . projectile-command-map)))

(use-package google-this
  :demand t
  :config (google-this-mode)
  :bind (:map ergoemacs-user-keymap ("<menu> g". google-this-mode-submap)))

(use-package ripgrep
  :demand t
  :ensure-system-package (rg . ripgrep))

(use-package password-store
  :demand t
  :config (setq epg-pinentry-mode 'loopback))

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

(use-package all-the-icons
  :demand t
  :if (display-graphic-p))

(use-package buffer-name-relative
  :demand t
  :init (buffer-name-relative-mode))

(use-package dashboard
  :demand t
  :init
  (setq dashboard-projects-backend 'projectile
	dashboard-items '((recents . 25)
			  (projects . 25))
	dashboard-set-navigator nil)
  (dashboard-setup-startup-hook))

(use-package doom-modeline
  :demand t
  :init
  (doom-modeline-mode 1))

(use-package helm
  :demand t
  :config
  (helm-mode 1)
  (helm-autoresize-mode 1)
  (define-key global-map [remap find-file] 'helm-find-files)
  (define-key global-map [remap occur] 'helm-occur)
  (define-key global-map [remap list-buffers] 'helm-buffers-list)
  (define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
  (define-key global-map [remap execute-extended-command] 'helm-M-x)
  (define-key global-map [remap apropos-command] 'helm-apropos))

(use-package helm-rg :demand t)

(use-package zoom
  :demand t
  :config
  (zoom-mode t)
  (setq zoom-size '(0.618 . 0.618)))

(use-package drag-stuff
  :demand t
  :config
  (drag-stuff-global-mode)
  (drag-stuff-define-keys))

(use-package solarized-theme
  :demand t
  :config (load-theme 'solarized-light t))

(use-package rainbow-delimiters
  :demand t
  :hook ((prog-mode . rainbow-delimiters-mode)))

(use-package rainbow-mode
  :demand t
  :config (rainbow-mode))

(use-package which-key
  :demand t
  :config (which-key-mode))

(use-package kubernetes
  :demand t
  :ensure-system-package kubectl)

(use-package docker
  :demand t)

(use-package emacs
  :elpaca nil
  :config
  (setq x-underline-at-descent-line t
	frame-resize-pixelwise t)
  (if (eq system-type 'gnu/linux)
      (set-frame-font "terminus 12" t t))
  (defun tfm/scroll-left ()
    (interactive)
    (scroll-left 1))
  (defun tfm/scroll-right ()
    (interactive)
    (scroll-right 1))
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
