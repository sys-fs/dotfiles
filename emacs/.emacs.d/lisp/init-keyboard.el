(setq ergoemacs-theme nil)
(setq ergoemacs-keyboard-layout "dv")
(require 'ergoemacs-mode)
(ergoemacs-mode 1)
(define-key key-translation-map (kbd "<f13>") (kbd "<menu>"))

;; I really can't deal with the loss of Unix navigation keys in ergoemacs
(define-key ergoemacs-user-keymap (kbd "C-a") 'move-beginning-of-line)
(define-key ergoemacs-user-keymap (kbd "C-e") 'move-end-of-line)
(define-key ergoemacs-user-keymap (kbd "C-d") 'delete-char)
(define-key ergoemacs-user-keymap (kbd "C-k") 'kill-line)
(define-key ergoemacs-user-keymap (kbd "C-S-k") 'ergoemacs-kill-line-backward)

(define-key ergoemacs-user-keymap (kbd "M-;") 'comment-or-uncomment-region)

;; Use Mac keys for copypaste
(define-key ergoemacs-user-keymap (kbd "M-c") 'ergoemacs-copy-line-or-region)
(define-key ergoemacs-user-keymap (kbd "M-v") 'ergoemacs-paste)

(use-package visual-regexp-steroids
  :bind
  (:map ergoemacs-user-keymap ("C-f" . vr/isearch-forward)))

(provide 'init-keyboard)
