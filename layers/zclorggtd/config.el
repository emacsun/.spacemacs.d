
(with-eval-after-load 'org
    (require 'org-habit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;(setq org-directory "~/zorg/")
  ;;The following lines are always needed. Choose your own keys.
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
  (add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
;;;;orggtd;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq org-default-notes-file  "~/zorg/output/znotes/znotes.org")
  (setq org-agenda-files (list "~/zorg/base/"
                               ;; "~/zorg/output/lte"
                               ;; "~/zorg/output/lte/physical"
                               ;; "~/zorg/output/communication"
                               ;; "~/zorg/output/communication/ECC"
                               ;; "~/zorg/output/communication/matlab/"
                               ;; "~/zorg/output/math"
                               ;; "~/zorg/output/math/PMA"
                               ;; "~/zorg/output/znotes/"
                               ))
  (setq org-refile-targets (quote (
                                   ("~/zorg/base/zwork.org" :maxlevel . 6)
                                   ("~/zorg/base/zlife.org" :maxlevel . 6)
                                   ;; ("~/zorg/output/znotes/zjoke.org" :maxlevel . 6)
                                   ;; ("~/zorg/output/znotes/math.org" :maxlevel . 6)
                                   ;; ("~/zorg/output/znotes/emacs.org" :maxlevel . 6)
                                   ;; ("~/zorg/output/znotes/computer.org" :maxlevel . 6)
                                   ;; ("~/zorg/output/znotes/communication.org" :maxlevel . 6)
                                   ;; ("~/zorg/output/znotes/misc.org" :maxlevel . 6)
                                   )))



  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
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

  (setq org-todo-state-tags-triggers
        (quote
         (("CANCELLED" ("CANCELLED" . t) ("TODO" . nil) ("NEXT" . nil))
          ("WAITING" ("WAITING" . t) ("TODO" . nil) ("NEXT" . nil))
          ("HOLD" ("WAITING" . t) ("HOLD" . t) ("TODO" . nil) ("NEXT" . nil))
          ("NEXT" ("NEXT" . t) ("TODO" . nil) ("DONE" . nil))
          ("TODO" ("TODO" . t) ("NEXT" . nil) ("DONE" . nil))
          ("DONE" ("DONE" . t) ("TODO" . nil) ("NEXT" . nil))
          (done ("WAITING") ("HOLD"))
          ;;("TODO" ("TODO" . t) ("WAITING") ("CANCELLED") ("HOLD") ("NEXT"))
          ;;("NEXT" ("NEXT" . t) ("WAITING") ("CANCELLED") ("HOLD") ("TODO"))
          ;;("DONE" ("DONE" . t) ("WAITING") ("CANCELLED") ("HOLD") ("NEXT") ("TODO"))
          )))


  (setq org-capture-templates
        '(
          ;;	("t" "todo" entry (file "~/zorg/base/zrefile.org")"* TODO %? \n Added:%T\n" :clock-in t :clock-resume t)
          ("t" "todo" entry (file "~/zorg/base/zrefile.org")"* TODO %? \n   Added:%U\n")
          ("h" "Hugo post")
          ("hr" "Reading"
           entry (file+olp "~/zorg/readingbar/content_org/all-posts.org" "Reading")
                 (function org-hugo-new-subtree-post-capture-template))

          ("hm" "movie"
           entry (file+olp "~/zorg/readingbar/content_org/all-posts.org" "movie")
           (function org-hugo-new-subtree-post-capture-template))

          ;; ("w" "wordpress" entry (file+headline "~/zorg/base/zwork.org" "wordpress")"** TODO %? \n Added:%T\n" )
          ;; ("n" "notes" entry (file "~/zorg/output/znotes/znotes-index.org")"* %?   :note:\n" :clock-in t :clock-resume t)
          ;; ("c" "communication" entry (file "~/zorg/output/communication/communication-index.org")"* %?   :communication:\n" :clock-in t :clock-resume t)
          ;; ("m" "math" entry (file "~/zorg/output/math/math-index.org")"* %?   :math:\n" :clock-in t :clock-resume t)
          ;; ("a" "computer" entry (file "~/zorg/output/computer/computer-index.org")"* %?   :computer:\n" :clock-in t :clock-resume t)
          ;; ("u" "linux" entry (file "~/zorg/output/computer/computer-index.org")"* %?   :computer:\n" :clock-in t :clock-resume t)
          ;; ("l" "my Log Time" entry (file+datetree "~/zorg/base/ztimelog.org" ) "** %T - %?  :timelog:" :clock-in t :clock-resume t)
          ;; ("j" "haha joke" entry (file "~/zorg/base/zjoke.org")"* %?   :joke:\n" :clock-in t :clock-resume t)
          ("x" "org-protocol" entry (file "~/zorg/base/zrefile.org") "* TODO Review %c %U \n Added:%T\n")
                                        ;;	("m" "Meeting" entry (file+datetree "~/zorg/base/timelog.org") "** %T MEETING with %? :MEETING:"
                                        ;;          :clock-in t :clock-resume t )
                                        ;;	("p" "Phone call" entry (file+datetree "~/zorg/base/timelog.org") "** %T PHONE %? :PHONE:"
                                        ;;          :clock-in t :clock-resume t)
          ))


  (add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)
  ;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
  ;; Use full outline paths for refile targets - we file directly with IDO
  (setq org-refile-use-outline-path t)

  ;; Targets complete directly with IDO
  (setq org-outline-path-complete-in-steps nil)

  ;; Allow refile to create parent tasks with confirmation
  (setq org-refile-allow-creating-parent-nodes (quote confirm))

  ;; Use IDO for both buffer and file completion and ido-everywhere to t
  (setq org-completion-use-ido t)
  (setq ido-everywhere t)
  (setq ido-max-directory-size 100000)
  (ido-mode (quote both))
                                        ; Use the current window when visiting files and buffers with ido
  (setq ido-default-file-method 'selected-window)
  (setq ido-default-buffer-method 'selected-window)
                                        ; Use the current window for indirect buffer display
  (setq org-indirect-buffer-display 'current-window)

;;;; Refile settings

  (setq org-refile-target-verify-function 'bh/verify-refile-target)

  ;; Do not dim blocked tasks
  (setq org-agenda-dim-blocked-tasks nil)

  ;; Compact the block agenda view
  (setq org-agenda-compact-blocks t)

  ;; Custom agenda command definitions
  (setq org-agenda-custom-commands
        (quote (("N" "Notes" tags "NOTE"
                 ((org-agenda-overriding-header "Notes")
                  (org-tags-match-list-sublevels t)))
                ("h" "Habits" tags-todo "STYLE=\"habit\""
                 ((org-agenda-overriding-header "Habits")
                  (org-agenda-sorting-strategy
                   '(todo-state-down effort-up category-keep))))
                ("f" occur-tree "FIXME")
                (" " "Agenda"
                 ((agenda "" nil)
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
                             ((org-agenda-overriding-header "Project Next Tasks")
                              (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
                              (org-tags-match-list-sublevels t)
                              (org-agenda-sorting-strategy
                               '(priority-down todo-state-down effort-up category-keep))))
                  ;; (tags-todo "-REFILE-CANCELLED-WAITING/!"
                  ;;     ((org-agenda-overriding-header (if (marker-buffer org-agenda-restrict-begin) "Project Subtasks" "Standalone Tasks"))
                  ;;      (org-agenda-skip-function 'bh/skip-project-tasks-maybe)
                  ;;      (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                  ;;      (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                  ;;      (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                  ;;      (org-agenda-sorting-strategy
                  ;;       '(category-keep))))
                  (tags "TODO"
                        ((org-agenda-overriding-header "Project Subtasks TODO")
                         (org-tags-match-list-sublevels nil)))
                  (tags "DONE"
                        ((org-agenda-overriding-header "Project Subtasks DONE")
                         (org-tags-match-list-sublevels nil)))
                  (tags-todo "-CANCELLED+WAITING/!"
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

  ;; tell Emacs to save the clock history when Emacs is closed.
  ;; and resume clocking task when emacs is restarted
  (org-clock-persistence-insinuate)
  ;;
  ;; Show lot of clocking history so it's easy to pick items off the C-F11 list
  (setq org-clock-history-length 23)
  ;; Resume clocking task on clock-in if the clock is open
  (setq org-clock-in-resume t)
  ;; Change tasks to NEXT when clocking in
  (setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
  ;; Separate drawers for clocking and logs
  (setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
  ;; Save clock data and state changes and notes in the LOGBOOK drawer
  (setq org-clock-into-drawer t)
  ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
  (setq org-clock-out-remove-zero-time-clocks t)
  ;; Clock out when moving task to a done state
  (setq org-clock-out-when-done t)
  ;; Save the running clock and all clock history when exiting Emacs, load it on startup
  (setq org-clock-persist t)
  ;; Do not prompt to resume an active clock
  (setq org-clock-persist-query-resume nil)
  ;; Enable auto clock resolution for finding open clocks
  (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
  ;; Include current clocking task in clock reports
  (setq org-clock-report-include-clocking-task t)

  (setq bh/keep-clock-running nil)

;; the task-id must stay closely under the Organization in a Property drawer
  (defvar bh/organization-task-id "eb155a82-92b2-4f25-a3c6-0304591af2f9")


  (add-hook 'org-clock-out-hook 'bh/clock-out-maybe 'append)

  (require 'org-id)

  (setq org-time-stamp-rounding-minutes (quote (1 1)))

  (setq org-agenda-clock-consistency-checks
        (quote (:max-duration "4:00"
                              :min-duration 0
                              :max-gap 0
                              :gap-ok-around ("4:00"))))

  ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
  (setq org-clock-out-remove-zero-time-clocks t)

  ;; Agenda clock report parameters
  (setq org-agenda-clockreport-parameter-plist
        (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80)))

                                        ; Set default column view headings: Task Effort Clock_Summary
  (setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

                                        ; global Effort estimate values
                                        ; global STYLE property values for completion
  (setq org-global-properties (quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
                                      ("STYLE_ALL" . "habit"))))

  ;; Agenda log mode items to display (closed and state changes by default)
  (setq org-agenda-log-mode-items (quote (closed state)))

                                        ; Tags with fast selection keys
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

                                        ; Allow setting single tags without the menu
  (setq org-fast-tag-selection-single-key (quote expert))

                                        ; For tag searches ignore tasks with scheduled and deadline dates
  (setq org-agenda-tags-todo-honor-ignore-options t)

                                        ;(require 'bbdb)
                                        ;(require 'bbdb-com)

  ;;(global-set-key (kbd "<f9> p") 'bh/phone-call)

  ;; Phone capture template handling with BBDB lookup
  ;; Adapted from code by Gregory J. Grubbs
  (setq org-agenda-span 'day)

  (setq org-stuck-projects (quote ("" nil nil "")))


  (defvar bh/hide-scheduled-and-waiting-next-tasks t)


  (setq org-archive-mark-done nil)
  (setq org-archive-location "%s_archive::* Archived Tasks")

  (setq org-export-allow-BIND t)


                                        ; Rebuild the reminders everytime the agenda is displayed
  (add-hook 'org-finalize-agenda-hook 'bh/org-agenda-to-appt 'append)

                                        ; This is at the end of my .emacs - so appointments are set up when Emacs starts
  (bh/org-agenda-to-appt)

                                        ; Activate appointments so we get notifications
  (appt-activate t)

                                        ; If we leave Emacs running overnight - reset the appointments one minute after midnight
  (run-at-time "24:01" nil 'bh/org-agenda-to-appt)

  ;; Enable abbrev-mode
  (add-hook 'org-mode-hook (lambda () (abbrev-mode 1)))


  (add-hook 'org-agenda-mode-hook
            '(lambda () (org-defkey org-agenda-mode-map "W" 'bh/widen))
            'append)

  (defun bh/restrict-to-file-or-follow (arg)
    "Set agenda restriction to 'file or with argument invoke follow mode.
I don't use follow mode very often but I restrict to file all the time
so change the default 'F' binding in the agenda to allow both"
    (interactive "p")
    (if (equal arg 4)
        (org-agenda-follow-mode)
      (widen)
      (bh/set-agenda-restriction-lock 4)
      (org-agenda-redo)
      (beginning-of-buffer)))

  (add-hook 'org-agenda-mode-hook
            '(lambda () (org-defkey org-agenda-mode-map "F" 'bh/restrict-to-file-or-follow))
            'append)

  (defun bh/narrow-to-org-subtree ()
    (widen)
    (org-narrow-to-subtree))

  (defun bh/narrow-to-subtree ()
    (interactive)
    (if (equal major-mode 'org-agenda-mode)
        (progn
          (org-with-point-at (org-get-at-bol 'org-hd-marker)
            (bh/narrow-to-org-subtree)
            (save-restriction
              (org-agenda-set-restriction-lock)))
          (when org-agenda-sticky
            (org-agenda-redo)))
      (bh/narrow-to-org-subtree)
      (save-restriction
        (org-agenda-set-restriction-lock))))

  (add-hook 'org-agenda-mode-hook
            '(lambda () (org-defkey org-agenda-mode-map "N" 'bh/narrow-to-subtree))
            'append)

  (defun bh/narrow-up-one-org-level ()
    (widen)
    (save-excursion
      (outline-up-heading 1 'invisible-ok)
      (bh/narrow-to-org-subtree)))

  (defun bh/get-pom-from-agenda-restriction-or-point ()
    (or (org-get-at-bol 'org-hd-marker)
        (and (marker-position org-agenda-restrict-begin) org-agenda-restrict-begin)
        (and (equal major-mode 'org-mode) (point))
        org-clock-marker))

  (defun bh/narrow-up-one-level ()
    (interactive)
    (if (equal major-mode 'org-agenda-mode)
        (org-with-point-at (bh/get-pom-from-agenda-restriction-or-point)
          (bh/narrow-up-one-org-level))
      (bh/narrow-up-one-org-level)))

  (add-hook 'org-agenda-mode-hook
            '(lambda () (org-defkey org-agenda-mode-map "U" 'bh/narrow-up-one-level))
            'append)

  (defun bh/narrow-to-org-project ()
    (widen)
    (save-excursion
      (bh/find-project-task)
      (org-agenda-set-restriction-lock)
      (bh/narrow-to-org-subtree)))

  (defun bh/narrow-to-project ()
    (interactive)
    (if (equal major-mode 'org-agenda-mode)
        (progn
          (org-with-point-at (bh/get-pom-from-agenda-restriction-or-point)
            (bh/narrow-to-org-project)
            (save-excursion
              (bh/find-project-task)
              (org-agenda-set-restriction-lock)))
          (org-agenda-redo)
          (beginning-of-buffer))
      (bh/narrow-to-org-project)
      (save-restriction
        (org-agenda-set-restriction-lock))))

  (add-hook 'org-agenda-mode-hook
            '(lambda () (org-defkey org-agenda-mode-map "P" 'bh/narrow-to-project))
            'append)

  (defvar bh/project-list nil)

  (defun bh/view-next-project ()
    (interactive)
    (let (num-project-left current-project)
      (unless (marker-position org-agenda-restrict-begin)
        (goto-char (point-min))
                                        ; Clear all of the existing markers on the list
        (while bh/project-list
          (set-marker (pop bh/project-list) nil))
        (re-search-forward "Tasks to Refile")
        (forward-visible-line 1))

                                        ; Build a new project marker list
      (unless bh/project-list
        (while (< (point) (point-max))
          (while (and (< (point) (point-max))
                      (or (not (org-get-at-bol 'org-hd-marker))
                          (org-with-point-at (org-get-at-bol 'org-hd-marker)
                            (or (not (bh/is-project-p))
                                (bh/is-project-subtree-p)))))
            (forward-visible-line 1))
          (when (< (point) (point-max))
            (add-to-list 'bh/project-list (copy-marker (org-get-at-bol 'org-hd-marker)) 'append))
          (forward-visible-line 1)))

                                        ; Pop off the first marker on the list and display
      (setq current-project (pop bh/project-list))
      (when current-project
        (org-with-point-at current-project
          (setq bh/hide-scheduled-and-waiting-next-tasks nil)
          (bh/narrow-to-project))
                                        ; Remove the marker
        (setq current-project nil)
        (org-agenda-redo)
        (beginning-of-buffer)
        (setq num-projects-left (length bh/project-list))
        (if (> num-projects-left 0)
            (message "%s projects left to view" num-projects-left)
          (beginning-of-buffer)
          (setq bh/hide-scheduled-and-waiting-next-tasks t)
          (error "All projects viewed.")))))

  (add-hook 'org-agenda-mode-hook
            '(lambda () (org-defkey org-agenda-mode-map "V" 'bh/view-next-project))
            'append)

  (setq org-show-entry-below (quote ((default))))

  (add-hook 'org-agenda-mode-hook
            '(lambda () (org-defkey org-agenda-mode-map "\C-c\C-x<" 'bh/set-agenda-restriction-lock))
            'append)

  (defun bh/set-agenda-restriction-lock (arg)
    "Set restriction lock to current task subtree or file if prefix is specified"
    (interactive "p")
    (let* ((pom (bh/get-pom-from-agenda-restriction-or-point))
           (tags (org-with-point-at pom (org-get-tags-at))))
      (let ((restriction-type (if (equal arg 4) 'file 'subtree)))
        (save-restriction
          (cond
           ((and (equal major-mode 'org-agenda-mode) pom)
            (org-with-point-at pom
              (org-agenda-set-restriction-lock restriction-type))
            (org-agenda-redo))
           ((and (equal major-mode 'org-mode) (org-before-first-heading-p))
            (org-agenda-set-restriction-lock 'file))
           (pom
            (org-with-point-at pom
              (org-agenda-set-restriction-lock restriction-type))))))))

  ;; Limit restriction lock highlighting to the headline only
  (setq org-agenda-restriction-lock-highlight-subtree nil)

  ;; Always hilight the current agenda line
  (add-hook 'org-agenda-mode-hook
            '(lambda () (hl-line-mode 1))
            'append)

  ;; Keep tasks with dates on the global todo lists
  (setq org-agenda-todo-ignore-with-date nil)

  ;; Keep tasks with deadlines on the global todo lists
  (setq org-agenda-todo-ignore-deadlines nil)

  ;; Keep tasks with scheduled dates on the global todo lists
  (setq org-agenda-todo-ignore-scheduled nil)

  ;; Keep tasks with timestamps on the global todo lists
  (setq org-agenda-todo-ignore-timestamp nil)

  ;; Remove completed deadline tasks from the agenda view
  (setq org-agenda-skip-deadline-if-done t)

  ;; Remove completed scheduled tasks from the agenda view
  (setq org-agenda-skip-scheduled-if-done t)

  ;; Remove completed items from search results
  (setq org-agenda-skip-timestamp-if-done t)

  ;;(setq org-agenda-include-diary t)
  ;;(setq org-agenda-diary-file "~/zorg/diary.org")

  (setq org-agenda-insert-diary-extract-time t)

  ;; Include agenda archive files when searching for things
  (setq org-agenda-text-search-extra-files (quote (agenda-archives)))

  ;; Show all future entries for repeating tasks
  (setq org-agenda-repeating-timestamp-show-all t)

  ;; Show all agenda dates - even if they are empty
  (setq org-agenda-show-all-dates t)

  ;; Sorting order for tasks on the agenda
  (setq org-agenda-sorting-strategy
        (quote ((agenda habit-down time-up user-defined-up priority-down effort-up category-keep)
                (todo category-up priority-down effort-up)
                (tags category-up priority-down effort-up)
                (search category-up))))

  ;; Start the weekly agenda on Monday
  (setq org-agenda-start-on-weekday 1)

  ;; Enable display of the time grid so we can see the marker for the current time
  (setq org-agenda-time-grid (quote ((daily today remove-match)
                                     #("----------------" 0 16 (org-heading t))
                                     (0900 1100 1300 1500 1700))))

  ;; Display tags farther right
  (setq org-agenda-tags-column -102)

  ;;
  ;; Agenda sorting functions
  ;;
  (setq org-agenda-cmp-user-defined 'bh/agenda-sort)

  (defun bh/agenda-sort (a b)
    "Sorting strategy for agenda items.
Late deadlines first, then scheduled, then non-late deadlines"
    (let (result num-a num-b)
      (cond
                                        ; time specific items are already sorted first by org-agenda-sorting-strategy

                                        ; non-deadline and non-scheduled items next
       ((bh/agenda-sort-test 'bh/is-not-scheduled-or-deadline a b))

                                        ; deadlines for today next
       ((bh/agenda-sort-test 'bh/is-due-deadline a b))

                                        ; late deadlines next
       ((bh/agenda-sort-test-num 'bh/is-late-deadline '> a b))

                                        ; scheduled items for today next
       ((bh/agenda-sort-test 'bh/is-scheduled-today a b))

                                        ; late scheduled items next
       ((bh/agenda-sort-test-num 'bh/is-scheduled-late '> a b))

                                        ; pending deadlines last
       ((bh/agenda-sort-test-num 'bh/is-pending-deadline '< a b))

                                        ; finally default to unsorted
       (t (setq result nil)))
      result))

  (defmacro bh/agenda-sort-test (fn a b)
    "Test for agenda sort"
    `(cond
                                        ; if both match leave them unsorted
      ((and (apply ,fn (list ,a))
            (apply ,fn (list ,b)))
       (setq result nil))
                                        ; if a matches put a first
      ((apply ,fn (list ,a))
       (setq result -1))
                                        ; otherwise if b matches put b first
      ((apply ,fn (list ,b))
       (setq result 1))
                                        ; if none match leave them unsorted
      (t nil)))

  (defmacro bh/agenda-sort-test-num (fn compfn a b)
    `(cond
      ((apply ,fn (list ,a))
       (setq num-a (string-to-number (match-string 1 ,a)))
       (if (apply ,fn (list ,b))
           (progn
             (setq num-b (string-to-number (match-string 1 ,b)))
             (setq result (if (apply ,compfn (list num-a num-b))
                              -1
                            1)))
         (setq result -1)))
      ((apply ,fn (list ,b))
       (setq result 1))
      (t nil)))

  (defun bh/is-not-scheduled-or-deadline (date-str)
    (and (not (bh/is-deadline date-str))
         (not (bh/is-scheduled date-str))))

  (defun bh/is-due-deadline (date-str)
    (string-match "Deadline:" date-str))

  (defun bh/is-late-deadline (date-str)
    (string-match "\\([0-9]*\\) d\. ago:" date-str))

  (defun bh/is-pending-deadline (date-str)
    (string-match "In \\([^-]*\\)d\.:" date-str))

  (defun bh/is-deadline (date-str)
    (or (bh/is-due-deadline date-str)
        (bh/is-late-deadline date-str)
        (bh/is-pending-deadline date-str)))

  (defun bh/is-scheduled (date-str)
    (or (bh/is-scheduled-today date-str)
        (bh/is-scheduled-late date-str)))

  (defun bh/is-scheduled-today (date-str)
    (string-match "Scheduled:" date-str))

  (defun bh/is-scheduled-late (date-str)
    (string-match "Sched\.\\(.*\\)x:" date-str))

  ;; Use sticky agenda's so they persist
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

                                        ; Use the current window for C-c ' source editing
  (setq org-src-window-setup 'current-window)

  (setq org-log-done (quote time))
  (setq org-log-into-drawer t)
  (setq org-log-state-notes-insert-after-drawers nil)

  ;;(setq org-clock-sound "/usr/local/lib/tngchime.wav")

                                        ; Enable habit tracking (and a bunch of other modules)
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

                                        ; position the habit graph on the agenda to the right of the default
  (setq org-habit-graph-column 50)

  (run-at-time "06:00" 86400 '(lambda () (setq org-habit-show-habits t)))

  (global-auto-revert-mode t)

  (require 'org-crypt)
                                        ; Encrypt all entries before saving
  (org-crypt-use-before-save-magic)
  (setq org-tags-exclude-from-inheritance (quote ("crypt")))
                                        ; GPG key to use for encryption
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

  (defun bh/show-org-agenda ()
    (interactive)
    (if org-agenda-sticky
        (switch-to-buffer "*Org Agenda( )*")
      (switch-to-buffer "*Org Agenda*"))
    (delete-other-windows))

  (require 'org-protocol)

  (setq require-final-newline t)

  (defvar bh/insert-inactive-timestamp t)

  (defun bh/toggle-insert-inactive-timestamp ()
    (interactive)
    (setq bh/insert-inactive-timestamp (not bh/insert-inactive-timestamp))
    (message "Heading timestamps are %s" (if bh/insert-inactive-timestamp "ON" "OFF")))

  (defun bh/insert-inactive-timestamp ()
    (interactive)
    (org-insert-time-stamp nil t t nil nil nil))
  ;;参见org-insert-time-stamp的函数帮助
  ;;nil t nil nil nil nil  插入一个active时间标签
  ;;nil t t   nil nil nil  插入一个inactive时间标签


  (defun bh/insert-heading-inactive-timestamp ()
    (save-excursion
      (when bh/insert-inactive-timestamp
        (org-return)
        (org-cycle)
        (bh/insert-inactive-timestamp))))

  (add-hook 'org-insert-heading-hook 'bh/insert-heading-inactive-timestamp 'append)

  (setq org-export-with-timestamps nil)

  (setq org-return-follows-link t)

  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(org-mode-line-clock ((t (:foreground "red" :box (:line-width -1 :style released-button)))) t))

  (defun bh/prepare-meeting-notes ()
    "Prepare meeting notes for email
   Take selected region and convert tabs to spaces, mark TODOs with leading >>>, and copy to kill ring for pasting"
    (interactive)
    (let (prefix)
      (save-excursion
        (save-restriction
          (narrow-to-region (region-beginning) (region-end))
          (untabify (point-min) (point-max))
          (goto-char (point-min))
          (while (re-search-forward "^\\( *-\\\) \\(TODO\\|DONE\\): " (point-max) t)
            (replace-match (concat (make-string (length (match-string 1)) ?>) " " (match-string 2) ": ")))
          (goto-char (point-min))
          (kill-ring-save (point-min) (point-max))))))

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

  ;;(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
  ;;(require 'smex)
  ;;(smex-initialize)

  ;;(global-set-key (kbd "M-x") 'smex)
  ;; (global-set-key (kbd "C-x x") 'smex)
  ;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)

  ;; Bookmark handling
  ;;
  ;; (global-set-key (kbd "<C-f6>") '(lambda () (interactive) (bookmark-set "SAVED")))
  ;; (global-set-key (kbd "<f6>") '(lambda () (interactive) (bookmark-jump "SAVED")))

  ;;(require 'org-mime)

  (setq org-agenda-skip-additional-timestamps-same-entry t)

  (setq org-table-use-standard-references (quote from))

  (setq org-file-apps (quote ((auto-mode . emacs)
                              ("\\.mm\\'" . system)
                              ("\\.x?html?\\'" . system)
                              ("\\.pdf\\'" . system))))

                                        ; Overwrite the current window with the agenda
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
                ;;("a" "#+begin_ascii\n?\n#+end_ascii")
                ("A" "#+ascii: ")
                ("i" "#+index: ?" "#+index: ?")
                ("I" "#+include %file ?" "<include file=%file markup=\"?\">"))))

  (defun bh/mark-next-parent-tasks-todo ()
    "Visit each parent task and change NEXT states to TODO"
    (let ((mystate (or (and (fboundp 'org-state)
                            state)
                       (nth 2 (org-heading-components)))))
      (when mystate
        (save-excursion
          (while (org-up-heading-safe)
            (when (member (nth 2 (org-heading-components)) (list "NEXT"))
              (org-todo "TODO")))))))

  (add-hook 'org-after-todo-state-change-hook 'bh/mark-next-parent-tasks-todo 'append)
  (add-hook 'org-clock-in-hook 'bh/mark-next-parent-tasks-todo 'append)

  (setq org-startup-folded t)

  (add-hook 'message-mode-hook 'orgstruct++-mode 'append)
  (add-hook 'message-mode-hook 'turn-on-auto-fill 'append)
  ;;(add-hook 'message-mode-hook 'bbdb-define-all-aliases 'append)
  (add-hook 'message-mode-hook 'orgtbl-mode 'append)
  ;;(add-hook 'message-mode-hook 'turn-on-flyspell 'append)
  (add-hook 'message-mode-hook
            '(lambda () (setq fill-column 72))
            'append)

  ;;flyspell mode for spell checking everywhere
  ;;(add-hook 'org-mode-hook 'turn-on-flyspell 'append)

  ;;Disable C-c [ and C-c ] and C-c ; in org-mode
  (add-hook 'org-mode-hook
            '(lambda ()
               ;; Undefine C-c [ and C-c ] since this breaks my
               ;; org-agenda files when directories are include It
               ;; expands the files in the directories individually
               (org-defkey org-mode-map "\C-c["    'undefined)
               (org-defkey org-mode-map "\C-c]"    'undefined)
               (org-defkey org-mode-map "\C-c;"    'undefined))
            'append)

  (add-hook 'org-mode-hook
            (lambda ()
              (local-set-key (kbd "C-c M-o") 'bh/mail-subtree))
            'append)

  ;; (defun bh/mail-subtree ()
  ;;   (interactive)
  ;;   (org-mark-subtree)
  ;;   (org-mime-subtree))

  (setq org-enable-priority-commands t)
  (setq org-default-priority ?E)
  (setq org-lowest-priority ?E)

  (setq org-src-preserve-indentation nil)
  (setq org-edit-src-content-indentation 0)

  (setq org-catch-invisible-edits 'error)

  ;; (setq org-export-coding-system 'utf-8)
  ;; (prefer-coding-system 'utf-8)
  ;; (set-charset-priority 'unicode)
  ;; (setq default-process-coding-system '(utf-8-unix . utf-8-unix))

  (setq org-time-clocksum-format
        '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

  (setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)

  (setq org-emphasis-alist (quote (("*" bold "<b>" "</b>")
                                   ("/" italic "<i>" "</i>")
                                   ("_" underline "<span style=\"text-decoration:underline;\">" "</span>")
                                   ("=" org-code "<code>" "</code>" verbatim)
                                   ("~" org-verbatim "<code>" "</code>" verbatim))))

  (setq org-use-sub-superscripts nil)

  (setq org-odd-levels-only nil)

  (run-at-time "00:59" 3600 'org-save-all-org-buffers)

  (setq org-log-done 'time);;一个 TODO（未完成）状态改变为一个完成状态时，标题下面就会插入一行 “CLOSED:[timestamp]”
  (setq org-log-done 'note);;提示你输入一个记录（note），并将它保存在n标题为“Closing Note”项目之下
  )
