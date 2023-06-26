(setq package-enable-at-startup nil)

;; Has Emacs gone too far?
(when (eq system-type 'gnu/linux)
  (shell-command "wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg")
  (write-region
   "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
   nil
   "/sudo::/etc/apt/sources.list.d/hashicorp.list"))
