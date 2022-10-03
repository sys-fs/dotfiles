;;; init-php --- PHP settings
;;; Commentary:
;;; Code:

(require 'php-mode)

(add-to-list 'auto-mode-alist '("\\.module$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.theme$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.install$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.profile$" . php-mode))

(define-key json-mode-map (kbd "C-c C-c") 'composer-update)

(add-hook 'php-mode-hook (drupal-mode))

(provide 'init-php)
;;; init-php.el ends here
