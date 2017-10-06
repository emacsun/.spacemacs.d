(setq zclorgbasic-packages
      '(
        (org )
        htmlize
        ox-hugo
        cdlatex
              ))

(defun zclorgbasic/init-cdlatex()
    (use-package cdlatex
      :defer t
      :init
      ))
(defun zclorgbasic/init-ox-hugo()
  (use-package ox-hugo
    :defer t
    :init
    :after ox
    ))
(defun zclorgbasic/post-init-org()
  (use-package org
    ;;:defer t
    :init
    ))

(defun zclorgbasic/post-init-cdlatex()
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex))
(defun zclorgbasic/post-init-htmlize()
  (use-package htmlize
    :defer t
    :init
    ))
