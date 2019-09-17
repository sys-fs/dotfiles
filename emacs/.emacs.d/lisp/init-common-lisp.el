(setq inferior-lisp-program "/usr/bin/sbcl"
      slime-contribs '(slime-fancy))

(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (smartparens-strict-mode t)))

(provide 'init-common-lisp)
