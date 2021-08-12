(require 'use-package)

(use-package geiser
  :init
  (setf geiser-active-implementations '(racket guile)))

(use-package geiser-racket
  :after (geiser))

(use-package geiser-guile
  :after (geiser))

(use-package quack
  :init
  (setf quack-fontify-style 'emacs))

;(use-package racket-mode)
