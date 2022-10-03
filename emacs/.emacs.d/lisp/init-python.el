(require 'poetry)

(elpy-enable)

(setq flycheck-python-pycompile-executable "python3")
(setq flycheck-python-flake8-executable "python3")

(add-hook 'python-mode-hook 'poetry-tracking-mode)

(provide 'init-python)
