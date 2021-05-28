(require 'use-package)

(use-package eglot-fsharp)

(use-package fsharp-mode
  :hook eglot
  :custom-face
  (fsharp-ui-operator-face ((t nil))))
