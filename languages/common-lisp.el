(require 'use-package)

(setq common-lisp
      (case system-type
	(darwin "ccl64")
	(windows-nt "ccl")
	(otherwise "sbcl")))

(use-package slime
  :init
  (setq inferior-lisp-program common-lisp)
  :hook
  (lisp-mode . (lambda ()
		 (setq display-fill-column-indicator-column 100))))
