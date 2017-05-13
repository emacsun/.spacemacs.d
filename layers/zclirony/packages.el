(setq zclirony-packages
      '(
        irony
        company-irony
        company-irony-c-headers
        irony-eldoc
        ))

(defun zclirony/init-irony()
    (use-package irony
      :defer t
      :init
      (progn
        (when (boundp 'w32-pipe-read-delay)
          (setq w32-pipe-read-delay 0))
        ;; Set the buffer size to 64K on Windows (from the original 4K)
        (when (boundp 'w32-pipe-buffer-size)
          (setq irony-server-w32-pipe-buffer-size (* 64 1024)))
        (add-hook 'c-mode-hook 'irony-mode)
        (add-hook 'c++-mode-hook 'irony-mode)

        ;; replace the `completion-at-point' and `complete-symbol' bindings in
        ;; irony-mode's buffers by irony-mode's function
        (defun my-irony-mode-hook ()
          (define-key irony-mode-map [remap completion-at-point]
            'irony-completion-at-point-async)
          (define-key irony-mode-map [remap complete-symbol]
            'irony-completion-at-point-async))
        (add-hook 'irony-mode-hook 'my-irony-mode-hook)
        (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
        )))
(defun zclirony/init-company-irony()
  (use-package company-irony
    ;;:defer t
    :init
    (progn
      (with-eval-after-load 'company
        '(add-to-list 'company-backends 'company-irony)
        ))))


(defun zclirony/init-irony-eldoc()
  (use-package irony-eldoc
    :defer t
    :init
    (progn

      )))
(defun zclirony/init-company-irony-c-headers()
  (use-package company-irony-c-headers
    :defer t
    :init
    (progn
      (with-eval-after-load 'company
        '(add-to-list
          'company-backends '(company-irony-c-headers company-irony)))
      )))
