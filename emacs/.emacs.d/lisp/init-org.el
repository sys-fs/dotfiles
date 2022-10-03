(use-package org-roam
  :config
  (mapc (lambda (directory)
	  (unless (file-exists-p directory)
	    (make-directory directory)))
	'("~/org-roam" "~/org-roam/main" "~/org-roam/reference" "~/org-roam/articles"))
  (cl-defmethod org-roam-node-type ((node org-roam-node))
    "Return the TYPE of NODE."
    (condition-case nil
	(file-name-nondirectory
	 (directory-file-name
          (file-name-directory
           (file-relative-name (org-roam-node-file node) org-roam-directory))))
      (error "")))
  (defvar tfm/org-roam-command-map (let ((map (make-sparse-keymap)))
				     (define-key map (kbd "b") #'org-roam-buffer-toggle)
				     (define-key map (kbd "c") #'org-roam-capture)
				     (define-key map (kbd "d") #'org-roam-buffer-display-dedicated)
				     (define-key map (kbd "f") #'org-roam-node-find)
				     (define-key map (kbd "i") #'org-roam-node-insert)
				     map)
    "Custom command map for use with org-roam.")
  (fset 'tfm/org-roam-command-map tfm/org-roam-command-map)
  (setq org-roam-directory "~/org-roam"
	org-roam-capture-templates '(("m" "main" plain
				      "%?"
				      :if-new (file+head "main/${slug}.org"
							 "#+title: ${title}\n")
				      :immediate-finish t
				      :unnarrowed t)
				     ("r" "reference" plain "%?"
				      :if-new
				      (file+head "reference/${title}.org" "#+title: ${title}\n")
				      :immediate-finish t
				      :unnarrowed t)
				     ("a" "article" plain "%?"
				      :if-new
				      (file+head "articles/${title}.org" "#+title: ${title}\n#+filetags: :article:\n")
				      :immediate-finish t
				      :unnarrowed t))
	org-roam-node-display-template (concat "${type:15} ${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (add-to-list 'display-buffer-alist
               '("\\*org-roam\\*"
		 (display-buffer-in-direction)
		 (direction . right)
		 (window-width . 0.33)
		 (window-height . fit-window-to-buffer)))
  (org-roam-db-autosync-mode)
  :bind
  (:map ergoemacs-user-keymap ("<menu> r" . tfm/org-roam-command-map)))

(use-package ox-reveal)

(use-package org
  :config
  (setq org-agenda-files '("~/org")
	org-priority-default ?C
	org-priority-lowest ?E
	org-todo-keywords '((sequence "BACKLOG" "TODO" "IN PROGRESS" "WAITING" "VALIDATING" "|" "DONE")))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((php . t)
     (emacs-lisp . t))))

(provide 'init-org)
