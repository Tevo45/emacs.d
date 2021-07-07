;; so-long
(unless (require 'so-long nil :noerror)
  (use-package so-long))
(require 'so-long)
(global-so-long-mode 1)
