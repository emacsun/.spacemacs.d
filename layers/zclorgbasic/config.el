(with-eval-after-load 'org
  (setq org-directory "~/zorg/")
  (setq org-src-fontify-natively t)
  (setq diary-mail-addr "emacsun@163.com")
  (setq org-default-notes-file  "~/zorg/output/znotes/znotes.org")
  ;;(spacemacs/set-leader-keys "oSPC" 'bh/clock-in-last-task)
  ;; ❀❤♫♠♣♥♦♡♢♤♧
  (setq org-bullets-bullet-list '("✿" "❀" "♣" "♧" ))
  (setq org-ellipsis "⤵");Other interesting characters are ▼, ↴, and ⋱.
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
  (add-hook 'org-mode-hook 'turn-on-font-lock)
  ;; Org
  (add-hook 'org-mode-hook
            (lambda ()
              ;; Enable fill column indicator
              ;;(fci-mode t)
              ;; Turn off line numbering, it makes org so slow
              (linum-mode -1)
              ;; Set fill column to 79
              (setq fill-column 70)
              (setq org-tags-column -65)
              (setq org-agenda-tags-column -70)
              ;; Enable automatic line wrapping at fill column
              (auto-fill-mode t)
              (wc-mode t)
              (org-indent-mode t)))
  (setq org-ref-open-pdf-function
        (lambda (fpath)
          (start-process "sumatrapdf" "*helm-bibtex-sumatrapdf*" "c:/Emacs64/bin/SumatraPDF.exe" fpath)))

  )
