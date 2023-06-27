(setq package-enable-at-startup nil)

;; Has Emacs gone too far?
(when (eq system-type 'gnu/linux)
  (setq tfm/release-codename (substring (shell-command-to-string "lsb_release -cs") 0 -1)
	tfm/hashicorp-repo (concat
			    "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com "
			    tfm/release-codename
			    " main"))
  (if (not (file-exists-p "/usr/share/keyrings/hashicorp-archive-keyring.gpg"))
      (shell-command "wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg"))
  (if (not (file-exists-p "/etc/apt/sources.list.d/hashicorp.list"))
      (write-region tfm/hashicorp-repo nil "/sudo::/etc/apt/sources.list.d/hashicorp.list")))
