(setq debug-on-error t)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(require 'init-packages)
(require 'init-keyboard)
(require 'init-programming)
(require 'init-ui)

(require 'init-org)
(require 'init-mu4e)
(require 'init-calibre)

(require 'init-c)
(require 'init-common-lisp)
(require 'init-elisp)
(require 'init-python)
(require 'init-terraform)
(require 'init-yaml)

;; unsure why this doesn't work when it's in init-ui
(centaur-tabs-headline-match)
(centaur-tabs-group-by-projectile-project)
(if (memq window-system '(mac))
    (centaur-tabs-change-fonts "Monaco" 120)
  (centaur-tabs-change-fonts "terminus" 120))

(use-package edit-server
  :config (edit-server-start))

(server-start)
