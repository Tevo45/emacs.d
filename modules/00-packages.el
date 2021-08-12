(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(require 'use-package-ensure)

(setf use-package-always-ensure t)

;; auto-updates
(use-package auto-package-update
  :config
  (setf auto-package-update-delete-old-versions t)
  (setf auto-package-update-hide-results t)
  (auto-package-update-maybe))
