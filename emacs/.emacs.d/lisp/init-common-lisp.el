;;; init-common-lisp --- Common Lisp settings
;;; Commentary:
;;; Code:

(setq inferior-lisp-program "/usr/bin/sbcl")

(slime-setup '(slime-fancy slime-company))

(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (smartparens-strict-mode t)))

(provide 'init-common-lisp)
;;; init-common-lisp ends here
