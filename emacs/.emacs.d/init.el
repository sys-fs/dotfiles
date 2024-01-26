(setq debug-on-error t)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(require 'package-init)
(require 'interaction)
(require 'interface)
(require 'notes)
(require 'languages)

(elpaca nil (server-start))
(put 'downcase-region 'disabled nil)
