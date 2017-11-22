(setq zclorgmobile-packages
      '(
        (org )
        (org-mobile-sync)
              ))

(defun zclorgmobile/post-init-org()
  (use-package org
    ;;:defer t
    :init
    ))

(defun zclorgmobile/init-org-mobile-sync()
  (use-package org
    ;;:defer t
    :init
    ))
