(setq zclorg-packages
      '(
        (org )
        htmlize
        cdlatex
              ))

(defun zclorg/init-cdlatex()
    (use-package cdlatex
      :defer t
      :init
      ))
(defun zclorg/init-org()
  (use-package org
    ;;:defer t
    :init
    ))

(defun zclorg/post-init-cdlatex()
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex))
(defun zclorg/post-init-htmlize()
  (use-package htmlize
    :defer t
    :init
    ))


