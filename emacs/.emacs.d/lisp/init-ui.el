(use-package all-the-icons
  :if (display-graphic-p))

(use-package ranger
  :config (ranger-override-dired-mode t))

(use-package dashboard
  :init
  (setq dashboard-projects-backend 'projectile
	dashboard-items '((recents . 25)
			  (projects . 25))
	dashboard-set-navigator t)
  (dashboard-setup-startup-hook))

(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-set-modified-marker t
      centaur-tabs-modified-marker "*"
      centaur-tabs-style "bar"
      centaur-tabs-set-icons t
      centaur-tabs-gray-out-icons 'buffer))

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1))

(use-package helm
  :init (require 'helm-config)
  :config
  (helm-mode 1)
  (helm-autoresize-mode 1)
  (define-key global-map [remap find-file] 'helm-find-files)
  (define-key global-map [remap occur] 'helm-occur)
  (define-key global-map [remap list-buffers] 'helm-buffers-list)
  (define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
  (define-key global-map [remap execute-extended-command] 'helm-M-x)
  (define-key global-map [remap apropos-command] 'helm-apropos))

(use-package zoom
  :config
  (zoom-mode t)
  (setq zoom-size '(0.618 . 0.618)))

(use-package drag-stuff
  :config
  (drag-stuff-global-mode)
  (drag-stuff-define-keys))

(use-package eshell-prompt-extras
  :config
  (with-eval-after-load "esh-opt"
    (autoload 'epe-theme-lambda "eshell-prompt-extras")
    (setq eshell-highlight-prompt nil
          eshell-prompt-function 'epe-theme-lambda)))

(use-package eshell-up
  :config
  (require 'eshell-up))

(use-package eshell-syntax-highlighting
  :config
  (eshell-syntax-highlighting-global-mode))

(use-package emacs
  :config
  (setq x-underline-at-descent-line t)
  (if (eq system-type 'gnu/linux)
      (set-frame-font "terminus 12" t t))
  (defun tfm/scroll-left ()
    (interactive)
    (scroll-left 1))
  (defun tfm/scroll-right ()
    (interactive)
    (scroll-right 1))
  (load-theme 'solarized-light t)
  (global-linum-mode t)
  (line-number-mode t)
  (column-number-mode t)
  (show-paren-mode t)
  (menu-bar-mode -1)
  (blink-cursor-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (horizontal-scroll-bar-mode -1)
  (rainbow-mode 1)
  (windmove-default-keybindings)
  (delete-selection-mode t)
  (fset 'yes-or-no-p 'y-or-n-p)
  (which-key-mode)
  (set-default 'truncate-lines t)
  :bind
  (:map ergoemacs-user-keymap
	("<mouse-6>" . tfm/scroll-right)
	("<mouse-7>" . tfm/scroll-left)))

(provide 'init-ui)
