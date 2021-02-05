(require 'use-package)

(setq common-lisp "sbcl")

(use-package slime
  :init
  (setq inferior-lisp-program common-lisp))
