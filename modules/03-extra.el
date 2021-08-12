(require 'cl)

(mapc
 (lambda (dir) (add-to-list 'load-path dir))
 (remove-if
  (lambda (dir)
    (or (string= (file-name-nondirectory dir) "..")
	(not (file-directory-p dir))))
  (directory-files (.emacs.d "extra") t)))
