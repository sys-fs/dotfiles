(use-package ergoemacs-mode
  :demand t
  :config
  (setq ergoemacs-theme nil
	ergoemacs-keyboard-layout "dv")
  (ergoemacs-mode 1)

  (if (eq system-type 'darwin)
      (setq mac-command-modifier 'meta
	    mac-option-modifier 'super))
  :bind
  ((:map ergoemacs-user-keymap
	 ("C-a" . move-beginning-of-line)
	 ("C-e" . move-end-of-line)
	 ("C-d" . delete-char)
	 ("C-k" . kill-line)
	 ("C-S-k" . ergoemacs-kill-line-backward)
	 ("M-;" . comment-or-uncomment-region)
	 ("M-c" . ergoemacs-copy-line-or-region)
	 ("M-v" . ergoemacs-paste))))

(use-package projectile
  :demand t
  :config (projectile-mode t)
  :bind (:map ergoemacs-user-keymap
	      ("<menu> p" . projectile-command-map)))

(use-package google-this
  :config (google-this-mode)
  :bind (:map ergoemacs-user-keymap ("<menu> g". google-this-mode-submap)))

(use-package emacs
  :elpaca nil
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
  ;; Ergodox
  (define-key key-translation-map (kbd "<f13>") (kbd "<menu>"))
  ;; MacBook Pro
  (define-key key-translation-map (kbd "§") (kbd "<menu>"))
  (when (memq window-system '(mac))
    (exec-path-from-shell-initialize)
    (setq browse-url-browser-function 'browse-url-generic
	  browse-url-generic-program "open"))
  (electric-indent-mode t)
  :hook
  ((before-save . delete-trailing-whitespace)))

(provide 'interaction)
