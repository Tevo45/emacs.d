
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

;;; so-long
(unless (require 'so-long nil :noerror)
  (use-package so-long))
(require 'so-long)
(global-so-long-mode 1)

(use-package magit)

;; general options
;;; for standalone elisp files
(add-to-list 'load-path (concat user-emacs-directory "lisp/"))

;;; line numbers
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;;; so custom won't dump it's stuff here
(let ((custom (concat user-emacs-directory "custom.el")))
  (setq custom-file custom)
  (when (file-exists-p custom)
    (load-file custom)))

;;; damn emacs, stop littering my filesystem already
(setq backup-directory-alist
      `((".*" . ,(concat user-emacs-directory "/backup"))))
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "/autosave"))))

;;; acme-style mouse chording >:D
(require 'acme-mouse)

;; fancyness
(use-package brutal-theme
  :config
  (enable-theme 'brutal))

(use-package dashboard
  :config
  (setq dashboard-startup-banner 'logo)
  (dashboard-setup-startup-hook))

;; os-specific configuration
(let ((conf (concat user-emacs-directory "/os/"
		    (symbol-name system-type) ".el")))
  (when (file-exists-p conf)
    (load-file conf)))

;; language support files
(mapc #'load-file
      (directory-files (concat user-emacs-directory "/languages")
		       t
		       ".el$"))

;; machine-specific configuration
(let ((conf (concat user-emacs-directory "/cfg/"
		    (downcase (system-name)) ".el")))
  (when (file-exists-p conf)
    (load-file conf)))
