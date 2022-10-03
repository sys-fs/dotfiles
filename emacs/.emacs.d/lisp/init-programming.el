(use-package projectile
  :config (projectile-mode t)
  :bind (:map ergoemacs-user-keymap
	      ("<menu> p" . projectile-command-map)))

(use-package aggressive-indent
  :config
  (global-aggressive-indent-mode 1)
  (add-to-list
   'aggressive-indent-dont-indent-if
   '(and (derived-mode-p 'php-mode)
	 (null (string-match "->" (thing-at-point 'line))))))

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "<menu> l"
	lsp-prefer-flymake nil
	lsp-diagnostics-provider :none)
  ;;  (add-to-list 'lsp--formatting-indent-alist '(php-mode . 2))
  :hook ((php-mode . lsp)
	 (python-mode . lsp)
	 (ansible . lsp)
	 (terraform-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)

(use-package helm-lsp :commands helm-lsp-workspace-symbol)

(use-package company
  :config
  (global-company-mode t)
  (company-quickhelp-mode)
  (company-statistics-mode))

(use-package flycheck
  :config
  (setq flycheck-phpcs-standard "Drupal,DrupalPractice")
  (global-flycheck-mode t))

(use-package smartparens
  :init
  (require 'smartparens-config)
  :config
  (sp-local-pair 'terraform-mode "/*" "*/" :post-handlers '((" | " "SPC")
							  ("* ||\n[i]" "RET")))
  (smartparens-global-mode))

(use-package yasnippet
  :config
  (yas-reload-all)
  (yas-global-mode t)
  :bind
  (:map yas-minor-mode-map
	([tab] . nil)
	("TAB" . nil)
	("<tab>" . nil)
	:map ergoemacs-user-keymap ("C-'" . yas-expand)))

(use-package emacs
  :config
  (setq-default save-place t
			fill-column 79
			tab-width 8)
  (if (not (boundp 'turn-on-orgtbl))
      (defun turn-on-orgtbl ()
	(interactive)
	(orgtbl-mode)))
  (setq load-prefer-newer t
	show-paren-delay 0
	show-paren-when-point-inside-paren t
	uniquify-buffer-name-style 'forward
	save-place-file (concat user-emacs-directory "places")
	apropos-do-all t
	ediff-window-setup-function 'ediff-setup-windows-plain
	require-final-newline t
	load-prefer-newer t
	browse-url-browser-function 'browse-url-xdg-open
	inhibit-startup-message t
	auth-sources '((:source "~/.emacs.d/authinfo.gpg")))
  (when (memq window-system '(mac))
    (exec-path-from-shell-initialize)
    (setq browse-url-browser-function 'browse-url-generic
	  browse-url-generic-program "open"))
  (electric-indent-mode t)
  (google-this-mode 1)
  :bind (("C-x g" . magit-status)
	 :map ergoemacs-user-keymap ("<menu> g". google-this-mode-submap))
  :hook
  ((before-save . delete-trailing-whitespace)
   (prog-mode . rainbow-delimiters-mode)))

(provide 'init-programming)
