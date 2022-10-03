(use-package calibredb
  :config
  (setq calibredb-root-dir "~/Calibre Library"
	calibredb-db-dir (expand-file-name "metadata.db" calibredb-root-dir)))

(provide 'init-calibre)
