(use-package all-the-icons
  :demand t
  :if (display-graphic-p))

(use-package dashboard
  :demand t
  :init
  (setq dashboard-projects-backend 'projectile
	dashboard-items '((recents . 25)
			  (projects . 25))
	dashboard-set-navigator nil
	dashboard-navigator-buttons `((;; Kanban
				       (,(all-the-icons-faicon "cogs" :height 0.9 :v-adjust 0.0)
					"JIRA"
					"Go to kanban"
					(lambda (&rest _)
					  (browse-url "https://adaptiveweb.atlassian.net/jira/software/c/projects/DEVO/boards/171")))
				       ;; Pantheon
				       (,(all-the-icons-wicon "lightning" :height 0.9 :v-adjust 0.0)
					"Pantheon"
					"Go to the Adaptive UK organisation"
					(lambda (&rest _)
					  (browse-url "https://dashboard.pantheon.io/organizations/05ffca43-9041-4bb4-8a31-94c37e52ba1f")))
				       ;; GitLab
				       (,(all-the-icons-faicon "gitlab" :height 0.9 :v-adjust 0.0)
					"GitLab"
					"Go to the adaptive-web group"
					(lambda (&rest _)
					  (browse-url "https://gitlab.com/adaptive-web"))))))
  (dashboard-setup-startup-hook))

(use-package centaur-tabs
  :demand t
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-set-modified-marker t
      centaur-tabs-modified-marker "*"
      centaur-tabs-style "bar"
      centaur-tabs-set-icons t
      centaur-tabs-gray-out-icons 'buffer))

(use-package doom-modeline
  :demand t
  :ensure t
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
  (menu-bar-mode -1)
  (blink-cursor-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (horizontal-scroll-bar-mode -1)
  (windmove-default-keybindings)
  (delete-selection-mode t)
  (fset 'yes-or-no-p 'y-or-n-p)
  (set-default 'truncate-lines t))

(provide 'interface)