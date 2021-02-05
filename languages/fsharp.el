(require 'use-package)

(use-package eglot-fsharp)

(use-package fsharp-mode
  :hook eglot
  :init
  (setq inferior-fsharp-program "fsharpi"))
