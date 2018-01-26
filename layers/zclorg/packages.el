(setq zclorg-packages
      '(
        (org )
        ox-hugo
        cdlatex
              ))

(defun zclorg/init-cdlatex()
    (use-package cdlatex
      :defer t
      :init
      ))
(defun zclorg/init-ox-hugo()
  (use-package ox-hugo
    :defer t
    :init
    :after ox
    ))
(defun zclorg/post-init-org()
  (use-package org
    ;;:defer t
    :init
    ))

(defun zclorg/post-init-cdlatex()
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex))
