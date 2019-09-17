(require 'smartparens-config)

(sp-local-pair 'terraform-mode "/*" "*/" :post-handlers '((" | " "SPC")
							  ("* ||\n[i]" "RET")))
(smartparens-global-mode)

(provide 'init-smartparens)
