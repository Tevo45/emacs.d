(require 'use-package)

;; FIXME doesn't build on nix ofc
(use-package vterm)

;; TODO disable only when Motif/GTK+
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
