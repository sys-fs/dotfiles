(defun light ()
  "Enable light theme"
  (interactive)
  (load-theme 'solarized-light t))

(defun dark ()
  "Enable dark theme."
  (interactive)
  (load-theme 'solarized-dark t))

;; default to light theme
(light)

(setq x-underline-at-descent-line t)

(set-frame-font "terminus 12" t t)

(provide 'init-themes)
