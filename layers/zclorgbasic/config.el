(with-eval-after-load 'org
  (setq org-directory "~/zorg/")
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
  (add-hook 'org-mode-hook 'turn-on-font-lock)
  (setq org-default-notes-file  "~/zorg/output/znotes/znotes.org")
  ;;(spacemacs/set-leader-keys "oSPC" 'bh/clock-in-last-task)
  ;; ❀❤♫♠♣♥♦♡♢♤♧
  (setq org-bullets-bullet-list '("✿" "❀" "♣" "♧" ))
  (setq org-ellipsis "⤵");Other interesting characters are ▼, ↴, and ⋱.
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
              (auto-fill-mode t))
            (org-indent-mode t))
  ;;calendar
  (setq diary-file "~/zorg/base/diary");; 默认的日记文件
  (setq diary-mail-addr "emacsun@163.com")
  ;;sorted diary display
  (add-hook 'list-diary-entries-hook 'sort-diary-entries t)
  ;; make your calender fancy
  (setq view-diary-entries-initially t
        mark-diary-entries-in-calendar t
        number-of-diary-entries 7)
  (add-hook 'diary-display-hook 'fancy-diary-display)
  (add-hook 'today-visible-calendar-hook 'calendar-mark-today)
  (add-hook 'fancy-diary-display-mode-hook
            '(lambda ()
               (alt-clean-equal-signs)))
  (define-derived-mode fancy-diary-display-mode  fundamental-mode
                       "Diary"
    (set (make-local-variable 'font-lock-defaults)
         '(fancy-diary-font-lock-keywords t))
    (define-key (current-local-map) "q" 'quit-window)
    (define-key (current-local-map) "h" 'calendar))
  (defadvice fancy-diary-display (after set-mode activate)
    "Set the mode of the buffer *Fancy Diary Entries* to `fancy-diary-display-mode'."
    (save-excursion
      (set-buffer fancy-diary-buffer)
      (fancy-diary-display-mode)))
  )
