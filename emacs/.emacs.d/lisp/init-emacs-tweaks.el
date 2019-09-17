(global-linum-mode t)
(line-number-mode t)
(column-number-mode t)
(show-paren-mode t)
(menu-bar-mode -1)
(blink-cursor-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key (kbd "M-;") 'comment-or-uncomment-region)

(windmove-default-keybindings)
(delete-selection-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(electric-indent-mode t)
(auto-fill-mode 1)

(setq-default save-place t
	      fill-column 79
	      tab-width 8)

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

(provide 'init-emacs-tweaks)
