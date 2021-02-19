
;; findstr instead of grep
(with-eval-after-load 'grep
  (grep-apply-setting 'grep-find-template
		      "findstr /S /N /D:. /C:<R> <F>")
  (setq find-name-arg nil))
