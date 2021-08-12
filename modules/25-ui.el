;; plan9-style mouse chording >:D
(require 'acme-mouse)

;; hide certain minor modes
(use-package diminish)

;; centered windows
(use-package centered-window)

;; line numbers and fill column
(add-hook 'prog-mode-hook
	  (lambda ()
	    (display-line-numbers-mode)
	    (display-fill-column-indicator-mode)))

;;
(unless (eq system-type 'darwin)
  (menu-bar-mode -1))

(tool-bar-mode -1)
(scroll-bar-mode -1)

;; stolen from https://github.com/MatthewZMD/.emacs.d/blob/master/elisp/init-ui-config.el
(global-prettify-symbols-mode 1)
(defun add-pretty-lambda ()
  "Make some word or string show as pretty Unicode symbols.  See https://unicodelookup.com for more."
  (setq prettify-symbols-alist
        '(("lambda" . 955)
          ("delta" . 120517)
          ("epsilon" . 120518)
	  ("<->" . 8596)
          ("->" . 8594)
	  ("<-" . 8592)
	  ("=>" . 8658)
          ("<=" . 8804)
          (">=" . 8805))))
(add-hook 'prog-mode-hook 'add-pretty-lambda)
(add-hook 'org-mode-hook 'add-pretty-lambda)

(fset 'yes-or-no-p 'y-or-n-p)

(column-number-mode 1)

(use-package doom-modeline
  :custom
  (doom-modeline-minor-modes t)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-color-icon t)
  :init
  (doom-modeline-mode 1))

(use-package solaire-mode
  :init
  (solaire-global-mode 1))

;; Adjust font size like web browsers
(global-set-key (kbd "C-=") #'text-scale-increase)
(global-set-key (kbd "C-+") #'text-scale-increase)
(global-set-key (kbd "C--") #'text-scale-decrease)

;; ^L -> horizontal line
(use-package page-break-lines
  :diminish
  :init (global-page-break-lines-mode))

;; time in modeline
(display-time-mode 1)

;; treemacs
(use-package treemacs
  :custom
  (treemacs-collapse-dirs 3)
  (treemacs-deferred-git-apply-delay 0.5)
  (treemacs-display-in-side-window t)
  (treemacs-file-event-delay 5000)
  (treemacs-file-follow-delay 0.2)
  (treemacs-follow-after-init t)
  (treemacs-follow-recenter-distance 0.1)
  (treemacs-git-command-pipe "")
  (treemacs-goto-tag-strategy 'refetch-index)
  (treemacs-indentation 2)
  (treemacs-indentation-string " ")
  (treemacs-is-never-other-window nil)
  (treemacs-max-git-entries 5000)
  (treemacs-no-png-images nil)
  (treemacs-no-delete-other-windows t)
  (treemacs-project-follow-cleanup nil)
  (treemacs-persist-file (expand-file-name ".cache/treemacs-persist" user-emacs-directory))
  (treemacs-recenter-after-file-follow nil)
  (treemacs-recenter-after-tag-follow nil)
  (treemacs-show-cursor nil)
  (treemacs-show-hidden-files t)
  (treemacs-silent-filewatch nil)
  (treemacs-silent-refresh nil)
  (treemacs-sorting 'alphabetic-desc)
  (treemacs-space-between-root-nodes t)
  (treemacs-tag-follow-cleanup t)
  (treemacs-tag-follow-delay 1.5)
  (treemacs-width 35)
  :config
  ;; The default width and height of the icons is 22 pixels. If you are
  ;; using a Hi-DPI display, uncomment this to double the icon size.
  ;;(treemacs-resize-icons 44)
  (treemacs-resize-icons 22)
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-fringe-indicator-mode t)
;  :bind
;  (("M-0"       . treemacs-select-window)
;   ("C-x t 1"   . treemacs-delete-other-windows)
;   ("C-x t t"   . treemacs)
;   ("C-x t B"   . treemacs-bookmark)
;   ("C-x t C-t" . treemacs-find-file)
;   ("C-x t M-t" . treemacs-find-tag))
;  (:map treemacs-mode-map ("C-p" . treemacs-previous-line)))
  )

(use-package treemacs-magit
  :defer t
  :after (treemacs magit))

(use-package treemacs-projectile
  :defer t
  :after (treemacs projectile))

;; confirm before quit
(setf confirm-kill-emacs #'y-or-n-p)
