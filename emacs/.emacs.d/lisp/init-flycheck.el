;;; init-flycheck --- Configure flycheck
;;; Commentary:
;;; Code:

(add-hook 'after-init-hook #'global-flycheck-mode)

(flycheck-status-emoji-mode)

(provide 'init-flycheck)
;;; init-flycheck ends here
