(setq c-default-style "linux")

(add-to-list 'company-backends 'company-c-headers)

(add-hook 'c-mode-common-hook
	  (lambda ()
	    (setq indent-tabs-mode t
		  smart-tabs-mode t)))

(provide 'init-c)
