;; From https://github.com/progfolio/elpaca
(defvar elpaca-installer-version 0.4)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil
                              :files (:defaults (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (call-process "git" nil buffer t "clone"
                                       (plist-get order :repo) repo)))
                 ((zerop (call-process "git" nil buffer t "checkout"
                                       (or (plist-get order :ref) "--"))))
                 (emacs (concat invocation-directory invocation-name))
                 ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                       "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                 ((require 'elpaca))
                 ((elpaca-generate-autoloads "elpaca" repo)))
            (kill-buffer buffer)
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

;; Install use-package support
(elpaca elpaca-use-package
  ;; Enable :elpaca use-package keyword.
  (elpaca-use-package-mode)
  ;; Assume :elpaca t unless otherwise specified.
  (setq elpaca-use-package-by-default t))

;; Block until current queue processed.
(elpaca-wait)

;; (require 'package)
;; (setq package-archives '(("melpa" . "https://melpa.org/packages/")
;; 			 ("gnu" . "http://elpa.gnu.org/packages/")))
;; (package-initialize)
;; (package-refresh-contents)

;; (mapc (lambda (package)
;; 	(unless (package-installed-p package)
;; 	  (package-install package)))
;;       '(ansible
;; 	ansible-doc
;; 	ansible-vault
;; 	all-the-icons
;; 	avy
;;         centaur-tabs
;;         company
;;         company-quickhelp
;;         company-statistics
;; 	composer
;; 	dashboard
;; 	doom-modeline
;; 	drag-stuff
;; 	drupal-mode
;; 	edit-server
;; 	eldoc
;; 	elpy
;; 	ergoemacs-mode
;; 	eshell-prompt-extras
;; 	eshell-syntax-highlighting
;; 	eshell-up
;; 	exec-path-from-shell
;; 	feature-mode
;; 	flycheck
;;         go-mode
;; 	google-this
;; 	helm
;; 	helm-lsp
;; 	helm-pass
;; 	helm-slime
;; 	helm-system-packages
;; 	htmlize
;; 	jinja2-mode
;; 	json-mode
;; 	ledger-mode
;; 	lsp-mode
;; 	lsp-ui
;; 	magit
;; 	markdown-mode
;; 	nerd-icons
;; 	ob-php
;; 	org-ref
;; 	org-roam
;; 	org-roam-ui
;; 	ox-reveal
;; 	password-store
;;         php-mode
;; 	poetry
;; 	projectile
;; 	rainbow-delimiters
;; 	rainbow-mode
;; 	ranger
;; 	restclient
;; 	ripgrep
;;         smartparens
;; 	solarized-theme
;; 	slime
;; 	slime-company
;; 	terraform-mode
;; 	use-package
;; 	visual-regexp-steroids
;; 	which-key
;; 	yaml-mode
;; 	yasnippet
;; 	yasnippet-snippets
;; 	zoom))

(provide 'init-elpaca)
