(require 'mu4e)
(require 'mu4e-alert)

(setq mail-user-agent 'mu4e-user-agent
      mu4e-maildir "~/maildir"
      mu4e-trash-folder "/disroot/Trash"
      mu4e-sent-folder "/disroot/Sent"
      mu4e-drafts-folder "/disroot/Drafts"
      user-mail-address "tfm@disroot.org"
      smtpmail-smtp-user "tfm"
      smtpmail-default-smtp-server "disroot.org"
      smtpmail-smtp-server "disroot.org"
      smtpmail-smtp-service 587
      message-send-mail-function 'smtpmail-send-it
      mu4e-sent-messages-behavior 'sent)

(defvar my-mu4e-account-alist '(("disroot"
				 (mu4e-sent-folder "/disroot/Sent")
				 (mu4e-drafts-folder "/disroot/Drafts")
				 (mu4e-trash-folder "/disroot/Trash")
				 (user-mail-address "tfm@disroot.org")
				 (smtpmail-smtp-user "tfm")
				 (smtpmail-default-smtp-server "disroot.org")
				 (smtpmail-smtp-server "disroot.org")
				 (smtpmail-smtp-service 587))))

(defun my-mu4e-set-account ()
  "Set the account for composing a message.
   This function is taken from:
     https://www.djcbsoftware.nl/code/mu/mu4e/Multiple-accounts.html"
  (let* ((account
	  (if mu4e-compose-parent-message
	      (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
		(string-match "/\\(.*?\\)/" maildir)
		(match-string 1 maildir))
	    (completing-read (format "Compose with account: (%s) "
				     (mapconcat #'(lambda (var) (car var))
						my-mu4e-account-alist "/"))
			     (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
			     nil t nil nil (caar my-mu4e-account-alist))))
	 (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
	(mapc #'(lambda (var)
		  (set (car var) (cadr var)))
	      account-vars)
      (error "No email account found"))))
(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)

(mu4e-alert-set-default-style 'libnotify)
(add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
(add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)

(provide 'init-mu4e)
