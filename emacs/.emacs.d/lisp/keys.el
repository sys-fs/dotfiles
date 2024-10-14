(use-package emacs
  :ensure nil
  :bind
  ((:map ergoemacs-user-keymap
          ("C-a" . move-beginning-of-line)
          ("C-e" . move-end-of-line)
          ("C-d" . delete-char)
          ("C-k" . kill-line)
          ("C-S-k" . ergoemacs-kill-line-backward)
          ("M-;" . comment-or-uncomment-region))))

(provide 'keys)
