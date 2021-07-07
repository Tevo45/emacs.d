;; shell environment
(use-package exec-path-from-shell
  :config
  (when (or (memq window-system '(mac ns x)) (daemonp))
    (exec-path-from-shell-initialize)))

;; damn emacs, stop littering my filesystem already
(setq backup-directory-alist
      `((".*" . ,(concat user-emacs-directory "/backup"))))
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "/autosave"))))
