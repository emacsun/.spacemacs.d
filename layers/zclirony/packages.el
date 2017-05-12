(setq zclirony-packages
      '(
        irony-mode
        company-irony
        irony-eldoc
        ))

(defun zclirony/init-irony-mode()
    (use-package irony-mode
      :defer t
      :init
      (progn
        (when (boundp 'w32-pipe-read-delay)
          (setq w32-pipe-read-delay 0))
        ;; Set the buffer size to 64K on Windows (from the original 4K)
        (when (boundp 'w32-pipe-buffer-size)
          (setq irony-server-w32-pipe-buffer-size (* 64 1024)))
        )))
(defun zclirony/init-company-irony()
  (use-package company-irony
    ;;:defer t
    :init
    (progn
      (add-to-list 'company-backends 'company-irony)
      )))


(defun zclirony/init-irony-eldoc()
  (use-package irony-eldoc
    :defer t
    :init
    (progn

      )))
