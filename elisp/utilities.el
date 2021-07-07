(defun load-if-exists (file)
  (when (file-exists-p file)
    (load-file file)))

(defun load-all (directory)
  (mapc #'load-file
	(directory-files directory t ".el$")))

(defun unixp ()
  (member system-type
	  '(aix berkeley-unix cygwin darwin gnu gnu/linux
		gnu/kfreebsd hpux usg-unix-v))) ; did i miss any?

(defun .emacs.d (&rest components)
  (mapconcat #'identity
	     (cons user-emacs-directory components)
	     "/"))

(provide 'utilities)
