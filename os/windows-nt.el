
;; findstr instead of grep
(with-eval-after-load 'grep
  (grep-apply-setting 'grep-find-template
		      "findstr /S /N /D:. /C:<R> <F>")
  (setq find-name-arg nil))

;; no menu/tool/scrollbar
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
