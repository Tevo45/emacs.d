;; private configuration (i.e. things with passwords, etc)
(load-if-exists (.emacs.d "secret.el"))

(when (unixp)
  (load-if-exists (.emacs.d "os" "unix.el")))

;; os-specific configuration
(load-if-exists
 (.emacs.d
  "os"
  (replace-regexp-in-string "/" "-"
			    (symbol-name system-type))))

;; host-specific configuration
(load-if-exists
 (.emacs.d
  "host"
  (concat (downcase (system-name)) ".el")))
