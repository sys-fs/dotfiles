;;; init --- Initialise Emacs
;;; Commentary:
;;; Code:
(setq debug-on-error t)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(require 'init-packages)

(require 'init-company)
(require 'init-flycheck)
(require 'init-git)
(require 'init-helm)
(require 'init-emacs-tweaks)
(require 'init-mu4e)
(require 'init-rainbow-delimiters)
(require 'init-smartparens)
(require 'init-themes)

(require 'init-c)
(require 'init-common-lisp)
(require 'init-elisp)
(require 'init-python)
(require 'init-terraform)
(require 'init-yaml)

(server-start)
