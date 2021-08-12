(require 'use-package)

(setf common-lisp
      (case system-type
	(darwin "ccl64")
	(windows-nt "ccl")
	(gnu/linux "cmucl") ; thanks, hoyte
	(berkeley-unix "sbcl")
	(otherwise "lisp")))

(use-package slime
  :init
  (setf inferior-lisp-program common-lisp)
  :hook
  (lisp-mode . (lambda ()
		 (setf display-fill-column-indicator-column 100))))
