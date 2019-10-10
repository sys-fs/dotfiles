;;; init-c --- C settings
;;; Commentary:
;;; Code:

(add-to-list 'company-backends 'company-c-headers)

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (setq indent-tabs-mode t)
	    (c-set-style "linux")))

(provide 'init-c)
;;; init-c ends here
