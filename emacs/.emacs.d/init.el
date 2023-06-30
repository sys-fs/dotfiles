(setq debug-on-error t)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(require 'package-init)
(require 'interaction)
(require 'interface)
(require 'notes)
(require 'languages)

;; unsure why this doesn't work when it's in init-ui
(elpaca nil (progn
	      (centaur-tabs-headline-match)
	      (centaur-tabs-group-by-projectile-project)
	      (if (memq window-system '(mac))
		  (centaur-tabs-change-fonts "Monaco" 120)
		(centaur-tabs-change-fonts "terminus" 120))))

(elpaca nil (server-start))
