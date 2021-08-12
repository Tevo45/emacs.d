(require 'use-package)

(use-package csharp-mode
  :hook
  (csharp-mode . (lambda ()
		   (setf display-fill-column-indicator-column 120))))

(use-package omnisharp
  :after company
  :hook
  (csharp-mode . (lambda ()
		   (company-mode)
		   (omnisharp-mode)))
  :config
  (add-to-list 'company-backends 'company-omnisharp))

;; for unity
(require 'unity)
(add-hook
 'after-init-hook
 (lambda ()
   (unity-build-code-shim)
   (unity-setup)))
