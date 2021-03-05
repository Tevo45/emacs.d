(require 'use-package)

(use-package haskell-mode
  :bind (("C-c C-l" . haskell-process-load-or-reload)
	 ("C-`" . haskell-interactive-bring)
	 ("C-c C-t" . haskell-process-do-type)
	 ("C-c C-i" . haskell-process-do-info)
	 ("C-c C-c" . haskell-process-cabal-build)
	 ("C-c C-k" . haskell-interactive-mode-clear)
	 ("C-c c" . haskell-process-cabal))
  :hook
  (haskell-mode . (lambda ()
		    ;; there's probably a better way to do this?
		    (require 'haskell-interactive-mode)
		    (require 'haskell-process)
		    (interactive-haskell-mode))))
