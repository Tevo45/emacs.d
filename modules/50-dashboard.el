(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
;  (setf dashboard-set-heading-icons t)
;  (setf dashboard-set-file-icons t)
  (setf dashboard-startup-banner 'logo)
  (setf initial-buffer-choice
	(lambda () (get-buffer "*dashboard*"))))
