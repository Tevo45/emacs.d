;; from https://stackoverflow.com/questions/20682244/how-to-disable-bold-fonts-by-overriding-set-face-attribute-in-emacs/20693389#20693389
(defun remap-faces-default-attributes ()
   (let ((family (face-attribute 'default :family))
         (height (face-attribute 'default :height)))
     (mapcar (lambda (face)
              (face-remap-add-relative
               face :family family :weight 'normal :height height))
          (face-list))))

(when (and (display-graphic-p)
	   nil) ; TODO check for VGA
   (add-hook 'minibuffer-setup-hook 'remap-faces-default-attributes)
   (add-hook 'change-major-mode-after-body-hook 'remap-faces-default-attributes)
   (mapc
    (lambda (face)
      (set-face-attribute face nil :weight 'normal))
    (face-list)))
