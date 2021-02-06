
;; packages 'n stuff
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;;; use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(require 'use-package-ensure)

(setq use-package-always-ensure t)

;;; auto-updates
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;;; shell environment
(use-package exec-path-from-shell
  :config
  (when (or (memq window-system '(mac ns x)) (daemonp))
    (exec-path-from-shell-initialize)))

;; general options
;;; for standalone elisp files
(add-to-list 'load-path (concat user-emacs-directory "lisp/"))

;;; line numbers
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;;; so custom won't dump it's stuff here
(let ((custom (concat user-emacs-directory "custom.el")))
  (setq custom-file custom)
  (load-file custom))

;;; damn emacs, stop littering my filesystem already
(setq backup-directory-alist
      `((".*" . ,(concat user-emacs-directory "/backup"))))
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "/autosave"))))

;;; acme-style mouse chording >:D
(require 'acme-mouse)

;; fancyness
(use-package zenburn-theme
  :config
  (enable-theme 'zenburn))

(use-package dashboard
  :config
  (setq dashboard-startup-banner 'logo)
  (dashboard-setup-startup-hook))

(use-package neotree)

;; language support files
(mapc #'load-file
      (directory-files (concat user-emacs-directory "/languages")
		       t
		       ".el$"))
