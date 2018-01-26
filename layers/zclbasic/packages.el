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
       ;; company-jedi
        ssh-agency
        ;;cygwin-mount
                ))


(defun zclbasic/init-matlab-mode()
  (use-package matlab-mode
    :defer t
    :init
    (progn
      )))
(defun zclbasic/init-cygwin-mount()
  (use-package cygwin-mount
    :defer t
    :init
    (progn
      )))

(defun zclbasic/init-ssh-agency()
  (use-package ssh-agency
    :defer nil
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
