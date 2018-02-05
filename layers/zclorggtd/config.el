;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(with-eval-after-load 'org
  ;;;;(setq org-directory "~/zorg/")
  ;;;;The following lines are always needed. Choose your own keys.
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
  (add-hook 'org-mode-hook 'turn-on-font-lock) ;; not needed when global-font-lock-mode is on
  (require 'org-habit)
;;;;;;;;orggtd;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq org-default-notes-file  "~/zorg/output/znotes/znotes.org")
  (setq org-agenda-files (list "~/zorg/Dropbox/base/zlife.org"
                               "~/zorg/Dropbox/base/zwork.org"
                               "~/zorg/Dropbox/base/zrefile.org"
                               "~/zorg/Dropbox/base/zdiary.org"
                               "~/zorg/Dropbox/base/ztimelog.org"
                               "~/zorg/Dropbox/org/refile.org"
                             ))
  (setq org-refile-targets (quote (
            ("~/zorg/Dropbox/base/zwork.org" :maxlevel . 6)
            ("~/zorg/Dropbox/base/zlife.org" :maxlevel . 6)
            ("~/zorg/Dropbox/base/zdiary.org" :maxlevel . 6)
            ("~/zorg/zcl.space/content_org/math.org" :maxlevel . 6)
            ("~/zorg/zcl.space/content_org/computer.org" :maxlevel . 6)
            ("~/zorg/zcl.space/content_org/telecommunication.org" :maxlevel . 6)
            ("~/zorg/zcl.space/content_org/life.org" :maxlevel . 6)
            ("~/zorg/zcl.space/content_org/tools.org" :maxlevel . 6))))

  (setq org-agenda-use-tag-inheritance t)
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "NEXT(n)"  "|" "DONE(d)")
                (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "red" :weight bold)
                ("NEXT" :foreground "purple" :weight bold)
                ("DONE" :foreground "forest green" :weight bold)
                ("WAITING" :foreground "orange" :weight bold)
                ("HOLD" :foreground "magenta" :weight bold)
                ("CANCELLED" :foreground "forest green" :weight bold)
                ("MEETING" :foreground "forest green" :weight bold)
                ("PHONE" :foreground "forest green" :weight bold))))

  (setq org-use-fast-todo-selection t)

  (setq org-treat-S-cursor-todo-selection-as-state-change nil)

  ;;;; (setq org-todo-state-tags-triggers
  ;;;;       (quote
  ;;;;        (("CANCELLED" ("CANCELLED" . t) ("TODO" . nil) ("NEXT" . nil))
  ;;;;         ("WAITING" ("WAITING" . t) ("TODO" . nil) ("NEXT" . nil))
  ;;;;         ("HOLD" ("WAITING" . t) ("HOLD" . t) ("TODO" . nil) ("NEXT" . nil))
  ;;;;         ("NEXT" ("NEXT" . t) ("TODO" . nil) ("DONE" . nil))
  ;;;;         ("TODO" ("TODO" . t) ("NEXT" . nil) ("DONE" . nil))
  ;;;;         ("DONE" ("DONE" . t) ("TODO" . nil) ("NEXT" . nil))
  ;;;;         (done ("WAITING") ("HOLD"))
  ;;;;         ;;;;("TODO" ("TODO" . t) ("WAITING") ("CANCELLED") ("HOLD") ("NEXT"))
  ;;;;         ;;;;("NEXT" ("NEXT" . t) ("WAITING") ("CANCELLED") ("HOLD") ("TODO"))
  ;;;;         ;;;;("DONE" ("DONE" . t) ("WAITING") ("CANCELLED") ("HOLD") ("NEXT") ("TODO"))
  ;;;;         )))

  (setq org-todo-state-tags-triggers nil);;

  (setq org-capture-templates
        '(
          ("t" "todo" entry (file "~/zorg/Dropbox/base/zrefile.org")
           "* TODO %? :TODO: \n Added:%T\n"
           :clock-in t :clock-resume t)
          ("h" "Hugo post")
          ("hm" "Math"
           entry (file+olp "~/zorg/zcl.space/content_org/math.org" "Math")
           (function org-hugo-new-subtree-post-capture-template)
           ":math:"
           :clock-in t :clock-resume t)
          ("hc" "Computer"
           entry (file+olp "~/zorg/zcl.space/content_org/computer.org" "Computer")
           (function org-hugo-new-subtree-post-capture-template)
           :clock-in t :clock-resume t)

          ("ht" "Telecommunication"
           entry (file+olp "~/zorg/zcl.space/content_org/telecommunication.org" "Telecommunication")
           (function org-hugo-new-subtree-post-capture-template)
           :clock-in t :clock-resume t)
          ("hl" "Life"
           entry (file+olp "~/zorg/zcl.space/content_org/life.org" "Life")
           (function org-hugo-new-subtree-post-capture-template)
           :clock-in t :clock-resume t)
          ("ho" "Tools"
           entry (file+olp "~/zorg/zcl.space/content_org/tools.org" "Tools")
           (function org-hugo-new-subtree-post-capture-template)
           :clock-in t :clock-resume t)
          ("hm" "movie"
           entry (file+olp "~/zorg/zcl.space/content_org/all-posts.org" "Movie")
           (function org-hugo-new-subtree-post-capture-template)
           :clock-in t :clock-resume t)
          ("hl" "life"
           entry (file+olp "~/zorg/zcl.space/content_org/all-posts.org" "Life")
           (function org-hugo-new-subtree-post-capture-template)
           :clock-in t :clock-resume t)
          ;;;; ("w" "wordpress" entry (file+headline "~/zorg/Dropbox/base/zwork.org" "wordpress")"** TODO %? \n Added:%T\n" )
          ;;;; ("n" "notes" entry (file "~/zorg/output/znotes/znotes-index.org")"* %?   :note:\n" :clock-in t :clock-resume t)
          ;;;; ("c" "communication" entry (file "~/zorg/output/communication/communication-index.org")"* %?   :communication:\n" :clock-in t :clock-resume t)
          ("l" "my Log Time" entry (file+datetree "~/zorg/Dropbox/base/ztimelog.org" ) "** %T - %?  :timelog:" :clock-in t :clock-resume t)
          ("d" "diary" entry (file+datetree "~/zorg/Dropbox/base/zdiary.org" ) "* %t - %?  :diary:" :clock-in t :clock-resume t)
          ("x" "org-protocol" entry (file "~/zorg/Dropbox/base/zrefile.org")
           "* TODO Review %c \n Added:%T\n")
          ;;;;	("m" "Meeting" entry (file+datetree "~/zorg/Dropbox/base/timelog.org") "** %T MEETING with %? :MEETING:"
          ;;;;          :clock-in t :clock-resume t )
          ;;;;	("p" "Phone call" entry (file+datetree "~/zorg/Dropbox/base/timelog.org") "** %T PHONE %? :PHONE:"
          ;;;;          :clock-in t :clock-resume t)
          ))


  (add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)
  ;;;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
  ;;;; Use full outline paths for refile targets - we file directly with IDO
  (setq org-refile-use-outline-path t)
  ;;;; Targets complete directly with IDO
  (setq org-outline-path-complete-in-steps nil)

  ;;;; Allow refile to create parent tasks with confirmation
  (setq org-refile-allow-creating-parent-nodes (quote confirm))

  ;;;; Use IDO for both buffer and file completion and ido-everywhere to t
  (setq org-completion-use-ido t)
  (setq ido-everywhere t)
  (setq ido-max-directory-size 100000)
  (ido-mode (quote both))
  ;; Use the current window when visiting files and buffers with ido
  (setq ido-default-file-method 'selected-window)
  (setq ido-default-buffer-method 'selected-window)
  ;; Use the current window for indirect buffer display
  (setq org-indirect-buffer-display 'current-window)

  (setq org-refile-target-verify-function 'bh/verify-refile-target)

  ;;;; Do not dim blocked tasks
  (setq org-agenda-dim-blocked-tasks nil)

  ;;;; Compact the block agenda view
  (setq org-agenda-compact-blocks t)

  ;;;; Custom agenda command definitions
  (setq org-agenda-custom-commands
        (quote (
                ;;;; ("N" "Notes" tags "NOTE"
                ;;;;  ((org-agenda-overriding-header "Notes")
                ;;;;   (org-tags-match-list-sublevels t)))
                ;;;; ("d" "Diary" tags "diary"
                ;;;;  ((org-agenda-overriding-header "my diaries")
                ;;;;   (org-tags-match-list-sublevels t)))
                ;;;; ("h" "Habits" tags-todo "STYLE=\"habit\""
                ;;;;  ((org-agenda-overriding-header "Habits")
                ;;;;   (org-agenda-sorting-strategy
                ;;;;    '(todo-state-down effort-up category-keep))))
                ;;;; ("f" occur-tree "FIXME")
                (" " "Agenda"
                 ((agenda "" )
                  (tags "NOTES"
                        ((org-agenda-overriding-header "NOTES to Refile")
                         (org-tags-match-list-sublevels nil)))
                  (tags "REFILE"
                        ((org-agenda-overriding-header "Tasks to Refile")
                         (org-tags-match-list-sublevels nil)))
                  (tags-todo "-CANCELLED/!"
                             ((org-agenda-overriding-header "Stuck Projects")
                              (org-agenda-skip-function 'bh/skip-non-stuck-projects)
                              (org-agenda-sorting-strategy
                               '(priority-down category-keep))))
                  (tags-todo "-HOLD-CANCELLED/!"
                             ((org-agenda-overriding-header "Projects")
                              (org-agenda-skip-function 'bh/skip-non-projects)
                              (org-agenda-sorting-strategy
                               '(priority-down category-keep))))
                  (tags-todo "-CANCELLED/!NEXT"
                             ((org-agenda-overriding-header "Project NEXT Tasks")
                              (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
                              (org-tags-match-list-sublevels t)
                              (org-agenda-sorting-strategy
                               '(priority-down todo-state-down effort-up category-keep))))
                  (todo "TODO"
                        ((org-agenda-overriding-header "Project Subtasks TODO")
                         (org-tags-match-list-sublevels t)))
                  (todo "DONE"
                        ((org-agenda-overriding-header "Project Subtasks DONE")
                         (org-tags-match-list-sublevels t)))
                  ;;;;(tags-todo "-CANCELLED+WAITING+HOLD/!"
                  (todo "HOLD"
                        ((org-agenda-overriding-header "Waiting and Postponed Tasks")
                         (org-agenda-skip-function 'bh/skip-stuck-projects)
                         (org-tags-match-list-sublevels nil)
                         (org-agenda-todo-ignore-scheduled 'future)
                         (org-agenda-todo-ignore-deadlines 'future)))
                  (tags "-REFILE/"
                        ((org-agenda-overriding-header "Tasks to Archive")
                         (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
                         (org-tags-match-list-sublevels nil))))
                 nil))))

  (setq org-agenda-auto-exclude-function 'bh/org-auto-exclude-function)

  ;;;; tell Emacs to save the clock history when Emacs is closed.
  ;;;; and resume clocking task when emacs is restarted
  (org-clock-persistence-insinuate)
  ;;;;
  ;;;; Show lot of clocking history so it's easy to pick items off the C-F11 list
  (setq org-clock-history-length 23)
  ;;;; Resume clocking task on clock-in if the clock is open
  (setq org-clock-in-resume t)
  ;;;; Change tasks to NEXT when clocking in
  (setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
  ;;;; Separate drawers for clocking and logs
  (setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
  ;;;; Save clock data and state changes and notes in the LOGBOOK drawer
  (setq org-clock-into-drawer t)
  ;;;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
  (setq org-clock-out-remove-zero-time-clocks t)
  ;;;; Clock out when moving task to a done state
  (setq org-clock-out-when-done t)
  ;;;; Save the running clock and all clock history when exiting Emacs, load it on startup
  (setq org-clock-persist t)
  ;;;; Do not prompt to resume an active clock
  (setq org-clock-persist-query-resume nil)
  ;;;; Enable auto clock resolution for finding open clocks
  (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
  ;;;; Include current clocking task in clock reports
  (setq org-clock-report-include-clocking-task t)
  (setq bh/keep-clock-running nil)

;;;; the task-id must stay closely under the Organization in a Property drawer
  (defvar bh/organization-task-id "eb155a82-92b2-4f25-a3c6-0304591af2f9")

  (add-hook 'org-clock-out-hook 'bh/clock-out-maybe 'append)

;;;;;;###autoload
  ;;(require 'org-id)
  (setq org-time-stamp-rounding-minutes (quote (1 1)))
  (setq org-agenda-clock-consistency-checks
        (quote (:max-duration "4:00"
                              :min-duration 0
                              :max-gap 0
                              :gap-ok-around ("4:00"))))

  ;;;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
  (setq org-clock-out-remove-zero-time-clocks t)

  ;;;; Agenda clock report parameters
  (setq org-agenda-clockreport-parameter-plist
        (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80)))

  ;; Set default column view headings: Task Effort Clock_Summary
  (setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

  ;; global Effort estimate values
  ;; global STYLE property values for completion
  (setq org-global-properties (quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
                                      ("STYLE_ALL" . "habit"))))

  ;;;; Agenda log mode items to display (closed and state changes by default)
  (setq org-agenda-log-mode-items (quote (closed state)))

  ;; Tags with fast selection keys
  (setq org-tag-alist (quote ((:startgroup)
                              ("@office" . ?o)
                              ("@home" . ?H)
                              (:endgroup)
                              ("WAITING" . ?w)
                              ("HOLD" . ?h)
                              ("WORK" . ?W)
                              ("NEXT" . ?n)
                              ("TODO" . ?t)
                              ("DONE" . ?d)
                              ("CANCELLED" . ?c)
                              ("FLAGGED" . ??))))

  ;; Allow setting single tags without the menu
  (setq org-fast-tag-selection-single-key (quote expert))

  ;; For tag searches ignore tasks with scheduled and deadline dates
  (setq org-agenda-tags-todo-honor-ignore-options t)
  ;;;;(global-set-key (kbd "<f9> p") 'bh/phone-call)
  ;;;; Phone capture template handling with BBDB lookup
  ;;;; Adapted from code by Gregory J. Grubbs
  (setq org-agenda-span 'day)

  (setq org-stuck-projects (quote ("" nil nil "")))

  (defvar bh/hide-scheduled-and-waiting-next-tasks t)

  (setq org-archive-mark-done nil)
  (setq org-archive-location "%s_archive::* Archived Tasks")

  (setq org-export-allow-BIND t)

  ;;;; Rebuild the reminders everytime the agenda is displayed
  (add-hook 'org-finalize-agenda-hook 'bh/org-agenda-to-appt 'append)

  ;; This is at the end of my .emacs - so appointments are set up when Emacs starts
  (bh/org-agenda-to-appt)

  ;; Activate appointments so we get notifications
  (appt-activate t)

  ;; If we leave Emacs running overnight - reset the appointments one minute after midnight
  (run-at-time "24:01" nil 'bh/org-agenda-to-appt)

  ;;;; Enable abbrev-mode
  (add-hook 'org-mode-hook (lambda () (abbrev-mode 1)))


  (add-hook 'org-agenda-mode-hook
            '(lambda () (org-defkey org-agenda-mode-map "W" 'bh/widen))
            'append)

  (add-hook 'org-agenda-mode-hook
            '(lambda () (org-defkey org-agenda-mode-map "F" 'bh/restrict-to-file-or-follow))
            'append)

  (add-hook 'org-agenda-mode-hook
            '(lambda () (org-defkey org-agenda-mode-map "N" 'bh/narrow-to-subtree))
            'append)

  (add-hook 'org-agenda-mode-hook
            '(lambda () (org-defkey org-agenda-mode-map "U" 'bh/narrow-up-one-level))
            'append)


  (add-hook 'org-agenda-mode-hook
            '(lambda () (org-defkey org-agenda-mode-map "P" 'bh/narrow-to-project))
            'append)

  (defvar bh/project-list nil)

  (add-hook 'org-agenda-mode-hook
            '(lambda () (org-defkey org-agenda-mode-map "V" 'bh/view-next-project))
            'append)

  (setq org-show-entry-below (quote ((default))))

  (add-hook 'org-agenda-mode-hook
            '(lambda () (org-defkey org-agenda-mode-map "\C-c\C-x<" 'bh/set-agenda-restriction-lock))
            'append)

  ;;;; Limit restriction lock highlighting to the headline only
  (setq org-agenda-restriction-lock-highlight-subtree nil)

  ;;;; Always hilight the current agenda line
  (add-hook 'org-agenda-mode-hook
            '(lambda () (hl-line-mode 1))
            'append)

  ;;;; Keep tasks with dates on the global todo lists
  (setq org-agenda-todo-ignore-with-date nil)

  ;;;; Keep tasks with deadlines on the global todo lists
  (setq org-agenda-todo-ignore-deadlines nil)

  ;;;; Keep tasks with scheduled dates on the global todo lists
  (setq org-agenda-todo-ignore-scheduled nil)

  ;;;; Keep tasks with timestamps on the global todo lists
  (setq org-agenda-todo-ignore-timestamp nil)

  ;;;; Remove completed deadline tasks from the agenda view
  (setq org-agenda-skip-deadline-if-done t)

  ;;;; Remove completed scheduled tasks from the agenda view
  (setq org-agenda-skip-scheduled-if-done t)

  ;;;; Remove completed items from search results
  (setq org-agenda-skip-timestamp-if-done t)

  ;;;;(setq org-agenda-include-diary t)
  ;;;;(setq org-agenda-diary-file "~/zorg/diary.org")

  (setq org-agenda-insert-diary-extract-time t)

  ;;;; Include agenda archive files when searching for things
  (setq org-agenda-text-search-extra-files (quote (agenda-archives)))

  ;;;; Show all future entries for repeating tasks
  (setq org-agenda-repeating-timestamp-show-all t)

  ;;;; Show all agenda dates - even if they are empty
  (setq org-agenda-show-all-dates t)

  ;;;; Sorting order for tasks on the agenda
  (setq org-agenda-sorting-strategy
        (quote ((agenda habit-down time-up user-defined-up priority-down effort-up category-keep)
                (todo category-up priority-down effort-up)
                (tags category-up priority-down effort-up)
                (search category-up))))

  ;;;; Start the weekly agenda on Monday
  (setq org-agenda-start-on-weekday 1)

  ;;;; Enable display of the time grid so we can see the marker for the current time
  ;;;; (setq org-agenda-time-grid (quote ((daily today remove-match)
  ;;;;                                    #("----------------" 0 16 (org-heading t))
  ;;;;                                    (0900 1100 1300 1500 1700))))
  (setq org-agenda-time-grid (quote
                              ((daily today remove-match)
                               (0900 1100 1300 1500 1700)
                               "......" "----------------")))
  ;;;; Display tags farther right
  (setq org-agenda-tags-column -102)

  ;;;;
  ;;;; Agenda sorting functions
  ;;;;
  (setq org-agenda-cmp-user-defined 'bh/agenda-sort)



  ;;;; Use sticky agenda's so they persist
  (setq org-agenda-sticky t)

  (setq org-enforce-todo-dependencies t)

  (setq org-hide-leading-stars nil)

  (setq org-startup-indented nil)

  (setq org-cycle-separator-lines 0)

  (setq org-blank-before-new-entry (quote ((heading)
                                           (plain-list-item . auto))))

  (setq org-insert-heading-respect-content nil)

  (setq org-reverse-note-order nil)

  (setq org-show-following-heading t)
  (setq org-show-hierarchy-above t)
  (setq org-show-siblings (quote ((default))))

  (setq org-special-ctrl-a/e t)
  (setq org-special-ctrl-k t)
  (setq org-yank-adjusted-subtrees t)

  (setq org-id-method (quote uuidgen))

  (setq org-deadline-warning-days 30)

  (setq org-table-export-default-format "orgtbl-to-csv")

  (setq org-link-frame-setup (quote ((vm . vm-visit-folder)
                                     (gnus . org-gnus-no-new-news)
                                     (file . find-file))))

  ;; Use the current window for C-c ' source editing
  (setq org-src-window-setup 'current-window)

  (setq org-log-into-drawer t)
  (setq org-log-state-notes-insert-after-drawers nil)

  ;;;;(setq org-clock-sound "/usr/local/lib/tngchime.wav")

  ;; Enable habit tracking (and a bunch of other modules)
  (setq org-modules (quote (org-bibtex
                            org-crypt
                            org-gnus
                            org-id
                            org-info
                            org-jsinfo
                            org-habit
                            org-inlinetask
                            org-irc
                            org-mew
                            org-mhe
                            org-protocol
                            org-rmail
                            org-vm
                            org-wl
                            org-w3m)))

  ;; position the habit graph on the agenda to the right of the default
  (setq org-habit-graph-column 50)

  (run-at-time "06:00" 86400 '(lambda () (setq org-habit-show-habits t)))

  (global-auto-revert-mode t)

;;;;;;###autoload
  ;;(require 'org-crypt)
  ;; Encrypt all entries before saving
  ;;(org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt")))
  ;; GPG key to use for encryption
  (setq org-crypt-key "F0B66B40")

  (setq org-crypt-disable-auto-save nil)

  (setq org-use-speed-commands t)
  (setq org-speed-commands-user (quote (("0" . ignore)
                                        ("1" . ignore)
                                        ("2" . ignore)
                                        ("3" . ignore)
                                        ("4" . ignore)
                                        ("5" . ignore)
                                        ("6" . ignore)
                                        ("7" . ignore)
                                        ("8" . ignore)
                                        ("9" . ignore)

                                        ("a" . ignore)
                                        ("d" . ignore)
                                        ("h" . bh/hide-other)
                                        ("i" progn
                                         (forward-char 1)
                                         (call-interactively 'org-insert-heading-respect-content))
                                        ("k" . org-kill-note-or-show-branches)
                                        ("l" . ignore)
                                        ("m" . ignore)
                                        ("o" . bh/toggle-next-task-display)
                                        ("q" . bh/show-org-agenda)
                                        ("r" . ignore)
                                        ("s" . org-save-all-org-buffers)
                                        ("w" . org-refile)
                                        ("x" . ignore)
                                        ("y" . ignore)
                                        ("z" . org-add-note)

                                        ("A" . ignore)
                                        ("B" . ignore)
                                        ("E" . ignore)
                                        ("F" . bh/restrict-to-file-or-follow)
                                        ("G" . ignore)
                                        ("H" . ignore)
                                        ("J" . org-clock-goto)
                                        ("K" . ignore)
                                        ("L" . ignore)
                                        ("M" . ignore)
                                        ("N" . bh/narrow-to-org-subtree)
                                        ("P" . bh/narrow-to-org-project)
                                        ("Q" . ignore)
                                        ("R" . ignore)
                                        ("S" . ignore)
                                        ("T" . bh/org-todo)
                                        ("U" . bh/narrow-up-one-org-level)
                                        ("V" . ignore)
                                        ("W" . bh/widen)
                                        ("X" . ignore)
                                        ("Y" . ignore)
                                        ("Z" . ignore))))


;;;;;;###autoload
  ;;(require 'org-protocol)

  (setq require-final-newline t)

  (defvar bh/insert-inactive-timestamp t)

  (add-hook 'org-insert-heading-hook 'bh/insert-heading-inactive-timestamp 'append)

  (setq org-export-with-timestamps nil)

  (setq org-return-follows-link t)

  (setq org-remove-highlights-with-change t)

  (add-to-list 'Info-default-directory-list "~/git/org-mode/doc")

  (setq org-read-date-prefer-future 'time)

  (setq org-list-demote-modify-bullet (quote (("+" . "-")
                                              ("*" . "-")
                                              ("1." . "-")
                                              ("1)" . "-")
                                              ("A)" . "-")
                                              ("B)" . "-")
                                              ("a)" . "-")
                                              ("b)" . "-")
                                              ("A." . "-")
                                              ("B." . "-")
                                              ("a." . "-")
                                              ("b." . "-"))))

  (setq org-tags-match-list-sublevels t)

  (setq org-agenda-persistent-filter t)

  (setq org-link-mailto-program (quote (compose-mail "%a" "%s")))

  (setq org-agenda-skip-additional-timestamps-same-entry t)

  (setq org-table-use-standard-references (quote from))

  (setq org-file-apps (quote ((auto-mode . emacs)
                              ("\\.mm\\'" . system)
                              ("\\.x?html?\\'" . system)
                              ("\\.pdf\\'" . system))))

  ;; Overwrite the current window with the agenda
  (setq org-agenda-window-setup 'current-window)

  (setq org-clone-delete-id t)

  (setq org-cycle-include-plain-lists t)

  (setq org-src-fontify-natively t)

  (setq org-structure-template-alist
        (quote (("s" "#+begin_src ?\n\n#+end_src" "<src lang=\"?\">\n\n</src>")
                ("e" "#+begin_example\n?\n#+end_example" "<example>\n?\n</example>")
                ("d" "#+begin_definition\n?\n#+end_definition" "<definition>\n?\n</definition>")
                ("x" "#+begin_tikzinstance\n?\n#+end_tikzinstance" "<tikzinstance>\n?\n</tikzinstance>")
                ("p" "#+begin_proof\n?\n#+end_proof" "<proof>\n?\n</proof>")
                ("t" "#+begin_tikztheorem\n?\n#+end_tikztheorem" "<tikztheorem>\n?\n</tikztheorem>")
                ("o" "#+begin_output\n?\n#+end_output" "<output>\n?\n</output>")
                ("P" "#+begin_tikzproblem\n?\n#+end_tikzproblem" "<tikzproblem>\n?\n</tikzproblem>")
                ("a" "#+begin_tikzanswer\n?\n#+end_tikzanswer" "<tikzanswer>\n?\n</tikzanswer>")
                ("q" "#+begin_quote\n?\n#+end_quote" "<quote>\n?\n</quote>")
                ("Q" "#+begin_tikzquote\n?\n#+end_tikzquote" "<tikzquote>\n?\n</tikzquote>")
                ("v" "#+begin_verse\n?\n#+end_verse" "<verse>\n?\n</verse>")
                ("c" "#+begin_center\n?\n#+end_center" "<center>\n?\n</center>")
                ("l" "#+begin_latex\n?\n#+end_latex" "<literal style=\"latex\">\n?\n</literal>")
                ("L" "#+latex: " "<literal style=\"latex\">?</literal>")
                ("h" "#+begin_html\n?\n#+end_html" "<literal style=\"html\">\n?\n</literal>")
                ("H" "#+html: " "<literal style=\"html\">?</literal>")
                ;;;;("a" "#+begin_ascii\n?\n#+end_ascii")
                ("A" "#+ascii: ")
                ("i" "#+index: ?" "#+index: ?")
                ("I" "#+include %file ?" "<include file=%file markup=\"?\">"))))


  (add-hook 'org-after-todo-state-change-hook 'bh/mark-next-parent-tasks-todo 'append)
  (add-hook 'org-clock-in-hook 'bh/mark-next-parent-tasks-todo 'append)

  (setq org-startup-folded t)

  (add-hook 'message-mode-hook 'orgstruct++-mode 'append)
  (add-hook 'message-mode-hook 'turn-on-auto-fill 'append)
  ;;;;(add-hook 'message-mode-hook 'bbdb-define-all-aliases 'append)
  (add-hook 'message-mode-hook 'orgtbl-mode 'append)
  ;;;;(add-hook 'message-mode-hook 'turn-on-flyspell 'append)
  (add-hook 'message-mode-hook
            '(lambda () (setq fill-column 72))
            'append)

  ;;;;flyspell mode for spell checking everywhere
  ;;;;(add-hook 'org-mode-hook 'turn-on-flyspell 'append)

  ;;;;Disable C-c [ and C-c ] and C-c ;; in org-mode
  (add-hook 'org-mode-hook
            '(lambda ()
               ;;;; Undefine C-c [ and C-c ] since this breaks my
               ;;;; org-agenda files when directories are include It
               ;;;; expands the files in the directories individually
               (org-defkey org-mode-map "\C-c["    'undefined)
               (org-defkey org-mode-map "\C-c]"    'undefined)
               ;;(org-defkey org-mode-map "\C-c;;"    'undefined)
               )
            'append)

  (add-hook 'org-mode-hook
            (lambda ()
              (local-set-key (kbd "C-c M-o") 'bh/mail-subtree))
            'append)


  (setq org-enable-priority-commands t)
  (setq org-default-priority ?E)
  (setq org-lowest-priority ?E)

  (setq org-src-preserve-indentation nil)
  (setq org-edit-src-content-indentation 0)

  (setq org-catch-invisible-edits 'error)


  (setq org-time-clocksum-format
        '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

  (setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)

  (setq org-emphasis-alist (quote (("*" bold "<b>" "</b>")
                                   ("/" italic "<i>" "</i>")
                                   ("_" underline "<span style=\"text-decoration:underline;;\">" "</span>")
                                   ("=" org-code "<code>" "</code>" verbatim)
                                   ("~" org-verbatim "<code>" "</code>" verbatim))))

  (setq org-use-sub-superscripts nil)

  (setq org-odd-levels-only nil)

  (run-at-time "00:59" 3600 'org-save-all-org-buffers)

  (setq org-log-done 'note);;;;提示你输入一个记录（note），并将它保存在n标题为“Closing Note”项目之下
  )
