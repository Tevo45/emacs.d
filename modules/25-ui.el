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
          ("->" . 8594)
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
