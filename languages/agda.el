(require 'utilities)

(load-if-exists
 (let ((coding-system-for-read 'utf-8))
   (shell-command-to-string "agda-mode locate")))
