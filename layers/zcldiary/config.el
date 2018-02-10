(setq diary-file "~/zorg/base/diary");; 默认的日记文件
;;sorted diary display
(setq view-diary-entries-initially t
      mark-diary-entries-in-calendar t
      number-of-diary-entries 7)
(add-hook 'list-diary-entries-hook 'sort-diary-entries t)
;; make your calender fancy
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)
(add-hook 'fancy-diary-display-mode-hook
          '(lambda ()
             (alt-clean-equal-signs)))
(define-derived-mode fancy-diary-display-mode  org-mode
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
