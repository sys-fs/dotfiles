(setq debug-on-error t)

(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(require 'package-init)
(require 'interaction)
(require 'interface)
(require 'notes)
(require 'languages)
(require 'keys)

(server-start)
(put 'downcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
