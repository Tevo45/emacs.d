(require 'utilities)

(load-if-exists
 (let ((coding-system-for-read 'utf-8))
   (shell-command-to-string "agda-mode locate")))

(add-to-list 'auto-mode-alist '("\\.lagda.md\\'" . agda2-mode))
