(require 'use-package)

(use-package geiser
  :init
  (setq geiser-active-implementations '(racket)))

(use-package quack
  :init
  (setq quack-fontify-style 'emacs))
