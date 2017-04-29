;;; packages.el --- shell packages File for Spacemacs
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq zclbasic-packages
      '(
        matlab-mode
        highlight-symbol
        chinese-fonts-setup
       ;; company-jedi
        dired+        ))


(defun zclbasic/init-matlab-mode()
  (use-package matlab-mode
    :defer t
    :init
    (progn
      )))

(defun zclbasic/init-highlight-symbol()
  (use-package highlight-symbol
    :defer t
    :init
    (progn
      (global-set-key (kbd "M-n") 'highlight-symbol-next)
      (global-set-key (kbd "M-p") 'highlight-symbol-prev)
      )))

(defun zclbasic/init-chinese-fonts-setup()
  (use-package chinese-fonts-setup
    :defer t
    :init
    (progn
      ;;(setq cfs-profiles '("coding" "orging" "reading"))
      )
    :config
    ;;(setq cfs-profiles '("coding" "orging" "reading"))
  ))

(defun zclbasic/init-dired+()
  (use-package dired+
    :defer t
    :init
    (progn
      )))
(defun zclorg/init-company-jedi()
  (use-package company-jedi
    :defer t
    :init
    (push 'company-jedi company-backends-python-mode)
    (push 'company-jedi company-backends)
    :config
    (push 'company-jedi company-backends-python-mode)))

