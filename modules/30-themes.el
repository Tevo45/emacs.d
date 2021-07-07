;; so custom won't dump it's stuff on init.el
(let ((custom (concat user-emacs-directory "custom.el")))
  (setq custom-file custom)
  (load-if-exists custom))

(use-package all-the-icons
  :if (display-graphic-p))

(use-package doom-themes
  :config
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  (load-theme 'doom-solarized-dark t)
  (defun switch-theme ()
    "An interactive function to switch themes."
    (interactive)
    (disable-theme (intern (car (mapcar #'symbol-name custom-enabled-themes))))
    (call-interactively #'load-theme)))
