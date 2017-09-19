(setq zclorgexport-packages
      '(
        (org )
        ox-hugo
              ))

(defun zclorgexport/post-init-ox-hugo()
  (use-package ox-hugo
    :defer t
    :init
    :after ox
    ))
(defun zclorgexport/post-init-org()
  (use-package org
    ;;:defer t
    :init
    ))
