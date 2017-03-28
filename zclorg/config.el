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
  ;; Custom Key Bindings
  (global-set-key (kbd "<f5>") 'org-agenda)
  (global-set-key (kbd "<f6>") 'org-capture)
  (define-prefix-command 'org-f7-map)
  (global-set-key (kbd "<f7>") 'org-f7-map)
  (global-set-key (kbd "<f7> <f8>") 'org-agenda)
  (global-set-key (kbd "<f7> <f7>") 'org-capture)
  ;;(global-set-key (kbd "<f7> b") 'bbdb)
  (global-set-key (kbd "<f7> c") 'org-cycle-agenda-files)
  (global-set-key (kbd "<f7> d") 'sydict-look-up-word)
  (global-set-key (kbd "<f7> f") 'boxquote-insert-file)
  (global-set-key (kbd "<f7> i") 'org-toggle-inline-images)
  (global-set-key (kbd "<f7> n") 'narrow-to-region)
  (global-set-key (kbd "<f7> p") 'bh/phone-call)
  (global-set-key (kbd "<f7> s") 'bh/set-truncate-lines)
  (global-set-key (kbd "<f7> t") 'bh/org-todo)

  (define-prefix-command 'org-f8-map)
  (global-set-key (kbd "<f8>") 'org-f8-map)
  (global-set-key (kbd "<f8> a") 'org-agenda)
  (global-set-key (kbd "<f8> b") 'previous-buffer)
  (global-set-key (kbd "<f8> c") 'calendar)
  (global-set-key (kbd "<f8> d") 'bh/show-org-agenda)
  (global-set-key (kbd "<f8> f") 'next-buffer)
  (global-set-key (kbd "<f8> h") 'bh/hide-other)
  (global-set-key (kbd "<f8> i") 'org-clock-in)
  (global-set-key (kbd "<f8> I") 'bh/punch-in)
  (global-set-key (kbd "<f8> n") 'bh/toggle-next-task-display)
  (global-set-key (kbd "<f8> w") 'widen)
  (global-set-key (kbd "<f8> u") 'bh/narrow-up-one-level)
  (global-set-key (kbd "<f8> g") 'org-clock-goto)
  (global-set-key (kbd "<f8> p") 'bh/save-then-publish)
  (global-set-key (kbd "<f8> o") 'bh/make-org-scratch)
  (global-set-key (kbd "<f8> O") 'bh/punch-out)
  (global-set-key (kbd "<f8> r") 'boxquote-region)
  (global-set-key (kbd "<f8> s") 'bh/switch-to-scratch)
  (global-set-key (kbd "<f8> t") 'bh/insert-inactive-timestamp)
  (global-set-key (kbd "<f8> T") 'bh/toggle-insert-inactive-timestamp)
  (global-set-key (kbd "<f8> v") 'visible-mode)
  (global-set-key (kbd "<f8> w") 'bh/widen)
  (global-set-key (kbd "<f8> SPC") 'bh/clock-in-last-task)
  (global-set-key (kbd "<f8> <f7>") 'org-agenda)
  (global-set-key (kbd "<f8> <f8>") 'org-capture)

  ;; (spacemacs/set-leader-keys "fn" 'find-file) ;

  ;; (spacemacs/set-leader-keys "oc" 'org-cycle-agenda-files)
  (spacemacs/set-leader-keys "oc" 'org-capture)
  (spacemacs/set-leader-keys "od" 'sydict-look-up-word)
  (spacemacs/set-leader-keys "of" 'boxquote-insert-file)
  (spacemacs/set-leader-keys "oi" 'org-toggle-inline-images)
  (spacemacs/set-leader-keys "on" 'narrow-to-region)
  (spacemacs/set-leader-keys "op" 'bh/phone-call)
  (spacemacs/set-leader-keys "os" 'bh/set-truncate-lines)
  (spacemacs/set-leader-keys "ot" 'bh/org-todo)

  (spacemacs/set-leader-keys "oa" 'org-agenda)
  (spacemacs/set-leader-keys "ob" 'previous-buffer)
  (spacemacs/set-leader-keys "oC" 'calendar)
  (spacemacs/set-leader-keys "od" 'bh/show-org-agenda)
  (spacemacs/set-leader-keys "of" 'org-publish-current-file)
  (spacemacs/set-leader-keys "op" 'org-publish-current-project)
  (spacemacs/set-leader-keys "oP" 'org-publish)
  (spacemacs/set-leader-keys "oh" 'bh/hide-other)
  (spacemacs/set-leader-keys "oi" 'org-clock-in)
  (spacemacs/set-leader-keys "oI" 'bh/punch-in)
  (spacemacs/set-leader-keys "on" 'bh/toggle-next-task-display)
  (spacemacs/set-leader-keys "ow" 'widen)
  (spacemacs/set-leader-keys "ou" 'bh/narrow-up-one-level)
  (spacemacs/set-leader-keys "og" 'org-clock-goto)
  (spacemacs/set-leader-keys "oo" 'bh/make-org-scratch)
  (spacemacs/set-leader-keys "oO" 'bh/punch-out)
  (spacemacs/set-leader-keys "or" 'boxquote-region)
  (spacemacs/set-leader-keys "os" 'bh/switch-to-scratch)
  (spacemacs/set-leader-keys "os" 'org-edit-special)
  (spacemacs/set-leader-keys "ot" 'bh/insert-inactive-timestamp)
  (spacemacs/set-leader-keys "oT" 'bh/toggle-insert-inactive-timestamp)
  (spacemacs/set-leader-keys "ot" 'bh/org-todo)
  (spacemacs/set-leader-keys "ov" 'visible-mode)
  (spacemacs/set-leader-keys "ow" 'bh/widen)
  ;;(spacemacs/set-leader-keys "oSPC" 'bh/clock-in-last-task)
  )
(with-eval-after-load 'org
  (defun bh/hide-other ()
    (interactive)
    (save-excursion
      (org-back-to-heading 'invisible-ok)
      (hide-other)
      (org-cycle)
      (org-cycle)
      (org-cycle)))

  (defun bh/set-truncate-lines ()
    "Toggle value of truncate-lines and refresh window display."
    (interactive)
    (setq truncate-lines (not truncate-lines))
    ;; now refresh window display (an idiom from simple.el):
    (save-excursion
      (set-window-start (selected-window)
                        (window-start (selected-window)))))

  ;; (defun bh/make-org-scratch ()
  ;;   (interactive)
  ;;   (find-file "/tmp/publish/scratch.org")
  ;;   (gnus-make-directory "/tmp/publish"))

  (defun bh/switch-to-scratch ()
    (interactive)
    (switch-to-buffer "*scratch*"))

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
          ("t" "todo" entry (file "~/zorg/base/zrefile.org")"* TODO %? :TODO:\n   Added:%U\n")
          ("w" "wordpress" entry (file+headline "~/zorg/base/zwork.org" "wordpress")"** TODO %? \n Added:%T\n" )
          ("n" "notes" entry (file "~/zorg/output/znotes/znotes-index.org")"* %?   :note:\n" :clock-in t :clock-resume t)
          ("c" "communication" entry (file "~/zorg/output/communication/communication-index.org")"* %?   :communication:\n" :clock-in t :clock-resume t)
          ("m" "math" entry (file "~/zorg/output/math/math-index.org")"* %?   :math:\n" :clock-in t :clock-resume t)
          ("a" "computer" entry (file "~/zorg/output/computer/computer-index.org")"* %?   :computer:\n" :clock-in t :clock-resume t)
          ("u" "linux" entry (file "~/zorg/output/computer/computer-index.org")"* %?   :computer:\n" :clock-in t :clock-resume t)
          ("l" "my Log Time" entry (file+datetree "~/zorg/base/ztimelog.org" ) "** %T - %?  :timelog:" :clock-in t :clock-resume t)
          ("j" "haha joke" entry (file "~/zorg/base/zjoke.org")"* %?   :joke:\n" :clock-in t :clock-resume t)
          ("x" "org-protocol" entry (file "~/zorg/base/zrefile.org") "* TODO Review %c %U \n Added:%T\n")
                                        ;	("m" "Meeting" entry (file+datetree "~/zorg/base/timelog.org") "** %T MEETING with %? :MEETING:"
                                        ;          :clock-in t :clock-resume t )
                                        ;	("p" "Phone call" entry (file+datetree "~/zorg/base/timelog.org") "** %T PHONE %? :PHONE:"
                                        ;          :clock-in t :clock-resume t)
          ))

  ;; Remove empty LOGBOOK drawers on clock out
  (defun bh/remove-empty-drawer-on-clock-out ()
    (interactive)
    (save-excursion
      (beginning-of-line 0)
      (org-remove-empty-drawer-at (point))))
  ;;    (org-remove-empty-drawer-at "LOGBOOK" (point))))

  (add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)
                                        ; Targets include this file and any file contributing to the agenda - up to 9 levels deep

                                        ; Use full outline paths for refile targets - we file directly with IDO
  (setq org-refile-use-outline-path t)

                                        ; Targets complete directly with IDO
  (setq org-outline-path-complete-in-steps nil)

                                        ; Allow refile to create parent tasks with confirmation
  (setq org-refile-allow-creating-parent-nodes (quote confirm))

                                        ; Use IDO for both buffer and file completion and ido-everywhere to t
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
                                        ; Exclude DONE state tasks from refile targets
  (defun bh/verify-refile-target ()
    "Exclude todo keywords with a done state from refile targets"
    (not (member (nth 2 (org-heading-components)) org-done-keywords)))

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

  (defun bh/org-auto-exclude-function (tag)
    "Automatic task exclusion in the agenda with / RET"
    (and (cond
          ((string= tag "hold")
           t)
          ((string= tag "farm")
           t))
         (concat "-" tag)))

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

  (defun bh/clock-in-to-next (kw)
    "Switch a task from TODO to NEXT when clocking in.
Skips capture tasks, projects, and subprojects.
Switch projects and subprojects from NEXT back to TODO"
    (when (not (and (boundp 'org-capture-mode) org-capture-mode))
      (cond
       ((and (member (org-get-todo-state) (list "TODO"))
             (bh/is-task-p))
        "NEXT")
       ((and (member (org-get-todo-state) (list "NEXT"))
             (bh/is-project-p))
        "TODO"))))

  (defun bh/find-project-task ()
    "Move point to the parent (project) task if any"
    (save-restriction
      (widen)
      (let ((parent-task (save-excursion (org-back-to-heading 'invisible-ok) (point))))
        (while (org-up-heading-safe)
          (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
            (setq parent-task (point))))
        (goto-char parent-task)
        parent-task)))

  (defun bh/punch-in (arg)
    "Start continuous clocking and set the default task to the
selected task.  If no task is selected set the Organization task
as the default task."
    (interactive "p")
    (setq bh/keep-clock-running t)
    (if (equal major-mode 'org-agenda-mode)
        ;;
        ;; We're in the agenda
        ;;
        (let* ((marker (org-get-at-bol 'org-hd-marker))
               (tags (org-with-point-at marker (org-get-tags-at))))
          (if (and (eq arg 4) tags)
              (org-agenda-clock-in '(16))
            (bh/clock-in-organization-task-as-default)))
      ;;
      ;; We are not in the agenda
      ;;
      (save-restriction
        (widen)
                                        ; Find the tags on the current task
        (if (and (equal major-mode 'org-mode) (not (org-before-first-heading-p)) (eq arg 4))
            (org-clock-in '(16))
          (bh/clock-in-organization-task-as-default)))))

  (defun bh/punch-out ()
    (interactive)
    (setq bh/keep-clock-running nil)
    (when (org-clock-is-active)
      (org-clock-out))
    (org-agenda-remove-restriction-lock))

  (defun bh/clock-in-default-task ()
    (save-excursion
      (org-with-point-at org-clock-default-task
        (org-clock-in))))

  (defun bh/clock-in-parent-task ()
    "Move point to the parent (project) task if any and clock in"
    (let ((parent-task))
      (save-excursion
        (save-restriction
          (widen)
          (while (and (not parent-task) (org-up-heading-safe))
            (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
              (setq parent-task (point))))
          (if parent-task
              (org-with-point-at parent-task
                (org-clock-in))
            (when bh/keep-clock-running
              (bh/clock-in-default-task)))))))

  (defvar bh/organization-task-id "eb155a82-92b2-4f25-a3c6-0304591af2f9")

  (defun bh/clock-in-organization-task-as-default ()
    (interactive)
    (org-with-point-at (org-id-find bh/organization-task-id 'marker)
      (org-clock-in '(16))))

  (defun bh/clock-out-maybe ()
    (when (and bh/keep-clock-running
               (not org-clock-clocking-in)
               (marker-buffer org-clock-default-task)
               (not org-clock-resolving-clocks-due-to-idleness))
      (bh/clock-in-parent-task)))

  (add-hook 'org-clock-out-hook 'bh/clock-out-maybe 'append)

  (require 'org-id)
  (defun bh/clock-in-task-by-id (id)
    "Clock in a task by id"
    (org-with-point-at (org-id-find id 'marker)
      (org-clock-in nil)))

  (defun bh/clock-in-last-task (arg)
    "Clock in the interrupted task if there is one
Skip the default task and get the next one.
A prefix arg forces clock in of the default task."
    (interactive "p")
    (let ((clock-in-to-task
           (cond
            ((eq arg 4) org-clock-default-task)
            ((and (org-clock-is-active)
                  (equal org-clock-default-task (cadr org-clock-history)))
             (caddr org-clock-history))
            ((org-clock-is-active) (cadr org-clock-history))
            ((equal org-clock-default-task (car org-clock-history)) (cadr org-clock-history))
            (t (car org-clock-history)))))
      (widen)
      (org-with-point-at clock-in-to-task
        (org-clock-in nil))))

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

  (defun bh/is-project-p ()
    "Any task with a todo keyword subtask"
    (save-restriction
      (widen)
      (let ((has-subtask)
            (subtree-end (save-excursion (org-end-of-subtree t)))
            (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
        (save-excursion
          (forward-line 1)
          (while (and (not has-subtask)
                      (< (point) subtree-end)
                      (re-search-forward "^\*+ " subtree-end t))
            (when (member (org-get-todo-state) org-todo-keywords-1)
              (setq has-subtask t))))
        (and is-a-task has-subtask))))

  (defun bh/is-project-subtree-p ()
    "Any task with a todo keyword that is in a project subtree.
Callers of this function already widen the buffer view."
    (let ((task (save-excursion (org-back-to-heading 'invisible-ok)
                                (point))))
      (save-excursion
        (bh/find-project-task)
        (if (equal (point) task)
            nil
          t))))

  (defun bh/is-task-p ()
    "Any task with a todo keyword and no subtask"
    (save-restriction
      (widen)
      (let ((has-subtask)
            (subtree-end (save-excursion (org-end-of-subtree t)))
            (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
        (save-excursion
          (forward-line 1)
          (while (and (not has-subtask)
                      (< (point) subtree-end)
                      (re-search-forward "^\*+ " subtree-end t))
            (when (member (org-get-todo-state) org-todo-keywords-1)
              (setq has-subtask t))))
        (and is-a-task (not has-subtask)))))

  (defun bh/is-subproject-p ()
    "Any task which is a subtask of another project"
    (let ((is-subproject)
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (while (and (not is-subproject) (org-up-heading-safe))
          (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
            (setq is-subproject t))))
      (and is-a-task is-subproject)))

  (defun bh/list-sublevels-for-projects-indented ()
    "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
  This is normally used by skipping functions where this variable is already local to the agenda."
    (if (marker-buffer org-agenda-restrict-begin)
        (setq org-tags-match-list-sublevels 'indented)
      (setq org-tags-match-list-sublevels nil))
    nil)

  (defun bh/list-sublevels-for-projects ()
    "Set org-tags-match-list-sublevels so when restricted to a subtree we list all subtasks.
  This is normally used by skipping functions where this variable is already local to the agenda."
    (if (marker-buffer org-agenda-restrict-begin)
        (setq org-tags-match-list-sublevels t)
      (setq org-tags-match-list-sublevels nil))
    nil)

  (defvar bh/hide-scheduled-and-waiting-next-tasks t)

  (defun bh/toggle-next-task-display ()
    (interactive)
    (setq bh/hide-scheduled-and-waiting-next-tasks (not bh/hide-scheduled-and-waiting-next-tasks))
    (when  (equal major-mode 'org-agenda-mode)
      (org-agenda-redo))
    (message "%s WAITING and SCHEDULED NEXT Tasks" (if bh/hide-scheduled-and-waiting-next-tasks "Hide" "Show")))

  (defun bh/skip-stuck-projects ()
    "Skip trees that are not stuck projects"
    (save-restriction
      (widen)
      (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
        (if (bh/is-project-p)
            (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                   (has-next ))
              (save-excursion
                (forward-line 1)
                (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
                  (unless (member "WAITING" (org-get-tags-at))
                    (setq has-next t))))
              (if has-next
                  nil
                next-headline)) ; a stuck project, has subtasks but no next task
          nil))))

  (defun bh/skip-non-stuck-projects ()
    "Skip trees that are not stuck projects"
    (bh/list-sublevels-for-projects-indented)
    (save-restriction
      (widen)
      (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
        (if (bh/is-project-p)
            (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                   (has-next ))
              (save-excursion
                (forward-line 1)
                (while (and (not has-next) (< (point) subtree-end) (re-search-forward "^\\*+ NEXT " subtree-end t))
                  (unless (member "WAITING" (org-get-tags-at))
                    (setq has-next t))))
              (if has-next
                  next-headline
                nil)) ; a stuck project, has subtasks but no next task
          next-headline))))

  (defun bh/skip-non-projects ()
    "Skip trees that are not projects"
    (bh/list-sublevels-for-projects-indented)
    (if (save-excursion (bh/skip-non-stuck-projects))
        (save-restriction
          (widen)
          (let ((subtree-end (save-excursion (org-end-of-subtree t))))
            (cond
             ((and (bh/is-project-p)
                   (marker-buffer org-agenda-restrict-begin))
              nil)
             ((and (bh/is-project-p)
                   (not (marker-buffer org-agenda-restrict-begin))
                   (not (bh/is-project-subtree-p)))
              nil)
             (t
              subtree-end))))
      (save-excursion (org-end-of-subtree t))))

  (defun bh/skip-project-trees-and-habits ()
    "Skip trees that are projects"
    (save-restriction
      (widen)
      (let ((subtree-end (save-excursion (org-end-of-subtree t))))
        (cond
         ((bh/is-project-p)
          subtree-end)
         ((org-is-habit-p)
          subtree-end)
         (t
          nil)))))

  (defun bh/skip-projects-and-habits-and-single-tasks ()
    "Skip trees that are projects, tasks that are habits, single non-project tasks"
    (save-restriction
      (widen)
      (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
        (cond
         ((org-is-habit-p)
          next-headline)
         ((and bh/hide-scheduled-and-waiting-next-tasks
               (member "WAITING" (org-get-tags-at)))
          next-headline)
         ((bh/is-project-p)
          next-headline)
         ((and (bh/is-task-p) (not (bh/is-project-subtree-p)))
          next-headline)
         (t
          nil)))))

  (defun bh/skip-project-tasks-maybe ()
    "Show tasks related to the current restriction.
When restricted to a project, skip project and sub project tasks, habits, NEXT tasks, and loose tasks.
When not restricted, skip project and sub-project tasks, habits, and project related tasks."
    (save-restriction
      (widen)
      (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
             (next-headline (save-excursion (or (outline-next-heading) (point-max))))
             (limit-to-project (marker-buffer org-agenda-restrict-begin)))
        (cond
         ((bh/is-project-p)
          next-headline)
         ((org-is-habit-p)
          subtree-end)
         ((and (not limit-to-project)
               (bh/is-project-subtree-p))
          subtree-end)
         ((and limit-to-project
               (bh/is-project-subtree-p)
               (member (org-get-todo-state) (list "NEXT")))
          subtree-end)
         (t
          nil)))))

  (defun bh/skip-projects-and-habits ()
    "Skip trees that are projects and tasks that are habits"
    (save-restriction
      (widen)
      (let ((subtree-end (save-excursion (org-end-of-subtree t))))
        (cond
         ((bh/is-project-p)
          subtree-end)
         ((org-is-habit-p)
          subtree-end)
         (t
          nil)))))

  (defun bh/skip-non-subprojects ()
    "Skip trees that are not projects"
    (let ((next-headline (save-excursion (outline-next-heading))))
      (if (bh/is-subproject-p)
          nil
        next-headline)))

  (setq org-archive-mark-done nil)
  (setq org-archive-location "%s_archive::* Archived Tasks")

  (defun bh/skip-non-archivable-tasks ()
    "Skip trees that are not available for archiving"
    (save-restriction
      (widen)
      ;; Consider only tasks with done todo headings as archivable candidates
      (let ((next-headline (save-excursion (or (outline-next-heading) (point-max))))
            (subtree-end (save-excursion (org-end-of-subtree t))))
        (if (member (org-get-todo-state) org-todo-keywords-1)
            (if (member (org-get-todo-state) org-done-keywords)
                (let* ((daynr (string-to-int (format-time-string "%d" (current-time))))
                       (a-month-ago (* 60 60 24 (+ daynr 1)))
                       (last-month (format-time-string "%Y-%m-" (time-subtract (current-time) (seconds-to-time a-month-ago))))
                       (this-month (format-time-string "%Y-%m-" (current-time)))
                       (subtree-is-current (save-excursion
                                             (forward-line 1)
                                             (and (< (point) subtree-end)
                                                  (re-search-forward (concat last-month "\\|" this-month) subtree-end t)))))
                  (if subtree-is-current
                      subtree-end ; Has a date in this month or last month, skip it
                    nil))  ; available to archive
              (or subtree-end (point-max)))
          next-headline))))

  (setq org-export-allow-BIND t)

                                        ; Erase all reminders and rebuilt reminders for today from the agenda
  (defun bh/org-agenda-to-appt ()
    (interactive)
    (setq appt-time-msg-list nil)
    (org-agenda-to-appt))

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

  ;; Skeletons
  ;;
  ;; sblk - Generic block #+begin_FOO .. #+end_FOO
  (define-skeleton skel-org-block
    "Insert an org block, querying for type."
    "Type: "
    "#+begin_" str "\n"
    _ - \n
    "#+end_" str "\n")

  (define-abbrev org-mode-abbrev-table "sblk" "" 'skel-org-block)

  ;; splantuml - PlantUML Source block
  (define-skeleton skel-org-block-plantuml
    "Insert a org plantuml block, querying for filename."
    "File (no extension): "
    "#+begin_src plantuml :file " str ".png :cache yes\n"
    _ - \n
    "#+end_src\n")

  (define-abbrev org-mode-abbrev-table "splantuml" "" 'skel-org-block-plantuml)

  (define-skeleton skel-org-block-plantuml-activity
    "Insert a org plantuml block, querying for filename."
    "File (no extension): "
    "#+begin_src plantuml :file " str "-act.png :cache yes :tangle " str "-act.txt\n"
    (bh/plantuml-reset-counters)
    "@startuml\n"
    "skinparam activity {\n"
    "BackgroundColor<<New>> Cyan\n"
    "}\n\n"
    "title " str " - \n"
    "note left: " str "\\nLines X-Y\n"
    "(*) --> \"" str "\"\n"
    "--> (*)\n"
    _ - \n
    "@enduml\n"
    "#+end_src\n")

  (defvar bh/plantuml-if-count 0)

  (defun bh/plantuml-if ()
    (incf bh/plantuml-if-count)
    (number-to-string bh/plantuml-if-count))

  (defvar bh/plantuml-loop-count 0)

  (defun bh/plantuml-loop ()
    (incf bh/plantuml-loop-count)
    (number-to-string bh/plantuml-loop-count))

  (defun bh/plantuml-reset-counters ()
    (setq bh/plantuml-if-count 0
          bh/plantuml-loop-count 0)
    "")

  (define-abbrev org-mode-abbrev-table "sact" "" 'skel-org-block-plantuml-activity)

  (define-skeleton skel-org-block-plantuml-activity-if
    "Insert a org plantuml block activity if statement"
    ""
    "if \"\" then\n"
    "  -> [condition] ==IF" (setq ifn (bh/plantuml-if)) "==\n"
    "  --> ==IF" ifn "M1==\n"
    "  -left-> ==IF" ifn "M2==\n"
    "else\n"
    "end if\n"
    "--> ==IF" ifn "M2==")

  (define-abbrev org-mode-abbrev-table "sif" "" 'skel-org-block-plantuml-activity-if)

  (define-skeleton skel-org-block-plantuml-activity-for
    "Insert a org plantuml block activity for statement"
    "Loop for each: "
    "--> ==LOOP" (setq loopn (bh/plantuml-loop)) "==\n"
    "note left: Loop" loopn ": For each " str "\n"
    "--> ==ENDLOOP" loopn "==\n"
    "note left: Loop" loopn ": End for each " str "\n" )

  (define-abbrev org-mode-abbrev-table "sfor" "" 'skel-org-block-plantuml-activity-for)

  (define-skeleton skel-org-block-plantuml-sequence
    "Insert a org plantuml activity diagram block, querying for filename."
    "File appends (no extension): "
    "#+begin_src plantuml :file " str "-seq.png :cache yes :tangle " str "-seq.txt\n"
    "@startuml\n"
    "title " str " - \n"
    "actor CSR as \"Customer Service Representative\"\n"
    "participant CSMO as \"CSM Online\"\n"
    "participant CSMU as \"CSM Unix\"\n"
    "participant NRIS\n"
    "actor Customer"
    _ - \n
    "@enduml\n"
    "#+end_src\n")

  (define-abbrev org-mode-abbrev-table "sseq" "" 'skel-org-block-plantuml-sequence)

  ;; sdot - Graphviz DOT block
  (define-skeleton skel-org-block-dot
    "Insert a org graphviz dot block, querying for filename."
    "File (no extension): "
    "#+begin_src dot :file " str ".png :cache yes :cmdline -Kdot -Tpng\n"
    "graph G {\n"
    _ - \n
    "}\n"
    "#+end_src\n")

  (define-abbrev org-mode-abbrev-table "sdot" "" 'skel-org-block-dot)

  ;; sditaa - Ditaa source block
  (define-skeleton skel-org-block-ditaa
    "Insert a org ditaa block, querying for filename."
    "File (no extension): "
    "#+begin_src ditaa :file " str ".png :cache yes\n"
    _ - \n
    "#+end_src\n")

  (define-abbrev org-mode-abbrev-table "sditaa" "" 'skel-org-block-ditaa)

  ;; selisp - Emacs Lisp source block
  (define-skeleton skel-org-block-elisp
    "Insert a org emacs-lisp block"
    ""
    "#+begin_src emacs-lisp\n"
    _ - \n
    "#+end_src\n")

  (define-abbrev org-mode-abbrev-table "selisp" "" 'skel-org-block-elisp)

  ;;(global-set-key (kbd "<f5>") 'bh/org-todo)

  (defun bh/org-todo (arg)
    (interactive "p")
    (if (equal arg 4)
        (save-restriction
          (bh/narrow-to-org-subtree)
          (org-show-todo-tree nil))
      (bh/narrow-to-org-subtree)
      (org-show-todo-tree nil)))

  ;;(global-set-key (kbd "<S-f5>") 'bh/widen)

  (defun bh/widen ()
    (interactive)
    (if (equal major-mode 'org-agenda-mode)
        (progn
          (org-agenda-remove-restriction-lock)
          (when org-agenda-sticky
            (org-agenda-redo)))
      (widen)))

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
                ("x" "#+begin_instance\n?\n#+end_instance" "<instance>\n?\n</instance>")
                ("p" "#+begin_proof\n?\n#+end_proof" "<proof>\n?\n</proof>")
                ("t" "#+begin_theorem\n?\n#+end_theorem" "<theorem>\n?\n</theorem>")
                ("o" "#+begin_output\n?\n#+end_output" "<output>\n?\n</output>")
                ("p" "#+begin_problem\n?\n#+end_problem" "<problem>\n?\n</problem>")
                ("a" "#+begin_answer\n?\n#+end_answer" "<answer>\n?\n</answer>")
                ("q" "#+begin_quote\n?\n#+end_quote" "<quote>\n?\n</quote>")
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
(with-eval-after-load 'org
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;wo de;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq org-agenda-use-tag-inheritance nil)
;;;;;设置org时间戳为英文；；；；；；；；；
  (setq system-time-locale "C")
;;;;orgexport;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;export html;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq org-src-fontify-natively t) ;设置代码高亮
  ;;为输出的html中的代码着色。
  ;;(add-to-list 'load-path "~/site-lisp/htmlize/")
                                        ;pp(require 'htmlize)
  (setq org-html-head "<style type=\"text/css\">
  pre {
    background-color: #2f4f4f;line-height: 1.6;
    FONT: 10.5pt Consola,Yahei Monaco, Courier New, helvetica;
    color:white;
  }
</style>")

;;;;;;;;;;;;;;;;;;;;;;;;org export latex;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;need to add #+LaTeX_CLASS at the beginning
  (setq org-list-allow-alphabetical t)

  ;; Explicitly load required exporters
  (require 'ox-html)
  (require 'ox-latex)
  (require 'ox-ascii)
  (setq org-html-table-use-header-tags-for-first-column t);
  (add-hook 'org-mode-hook
            (lambda () (setq truncate-lines nil)))
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex);
  ;; 使用pdflatex一步生成PDF
  (setq org-latex-to-pdf-process
        '("pdflatex -interaction nonstopmode %f"
          "pdflatex -interaction nonstopmode %f"))
  ;; code执行免应答（Eval code without confirm）
  (setq org-confirm-babel-evaluate nil)
  ;; Auctex
  (defun org-mode-article-modes ()
    (reftex-mode t)
    (and (buffer-file-name)
         (file-exists-p (buffer-file-name))
         (reftex-parse-all)))
  (add-hook 'org-mode-hook
            (lambda ()
              (if (member "REFTEX" org-todo-keywords-1)
                  (org-mode-article-modes))))
  (unless (boundp 'org-latex-classes)
    (setq org-latex-classes nil))

  ;; (setq reftex-default-bibliography
  ;;       (quote
  ;;        ( "~/zorg/base/temp/201310diary.bib")))
  ;; 在org中插入参考文献
  (defun org-mode-reftex-setup ()
    (load-library "reftex")
    (and (buffer-file-name)
         (file-exists-p (buffer-file-name))
         (reftex-parse-all)))
  (add-hook 'org-mode-hook 'org-mode-reftex-setup)

  (add-to-list 'org-latex-classes
               '("cn-article"
                 "\\documentclass[10pt,a4paper,UTF8]{article}
\\usepackage{zclorg}
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;; 使用Listings宏包格式化源代码(只是把代码框用listing环境框起来，还需要额外的设置)
(setq org-latex-listings t)
;; 导出Beamer的设置
;; place #+LaTeX_CLASS: beamer in org files
;;-----------------------------------------------------------------------------
(add-to-list 'org-latex-classes
             ;; beamer class, for presentations
             '("beamer"
               "\\documentclass[11pt,professionalfonts,UTF8]{beamer}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}"
                "\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}")))
(setq ps-paper-type 'a4
      ps-font-size 18.0
      ps-print-header nil
      ps-landscape-mode nil)

(setq reftex-default-bibliography
      (quote
       ("default.bib" "~/zorg/research_diary/bib/201310diary.bib")))
(define-key org-mode-map (kbd "C-c )") 'reftex-citation)
;;;;orgpublish;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                                        ; List of projects
                                        ; norang       - http://www.norang.ca/
                                        ; doc          - http://doc.norang.ca/
                                        ; org-mode-doc - http://doc.norang.ca/org-mode.html and associated files
                                        ; org          - miscellaneous todo lists for publishing

(setq org-list-allow-alphabetical t)
)
(with-eval-after-load 'org
;; Explicitly load required exporters
(require 'ox-html)
(require 'ox-latex)
(require 'ox-ascii)
(require 'ox-publish)
(setq org-ditaa-jar-path "~/java/ditaa0_6b.jar")
(setq org-plantuml-jar-path "~/java/plantuml.jar")

;;(add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)
                                        ; Make babel results blocks lowercase
;;(setq org-babel-results-keyword "results")

(defun bh/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

;; (org-babel-do-load-languages
;;  (quote org-babel-load-languages)
;;  (quote ((emacs-lisp . t)
;;          (dot . t)
;;          (ditaa . t)
;;          (R . t)
;;          (python . t)
;;          (ruby . t)
;;          (gnuplot . t)
;;          (clojure . t)
;;          (sh . t)
;;          (ledger . t)
;;          (org . t)
;;          (plantuml . t)
;;          (latex . t))))

;; Do not prompt to confirm evaluation
;; This may be dangerous - make sure you understand the consequences
;; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)

;; Use fundamental mode when editing plantuml blocks with C-c '
(add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))

;; Don't enable this because it breaks access to emacs from my Android phone
(setq org-startup-with-inline-images nil)

(setq org-html-inline-images t)
(setq org-export-with-sub-superscripts nil)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-html-head-include-default-style nil)
;; Do not generate internal css formatting for HTML exports
(setq org-export-htmlize-output-type (quote css))
(setq org-export-with-LaTeX-fragments t)
(setq org-export-headline-levels 6)
(setq org-publish-project-alist
      (quote (("zcl-org"
               :base-directory "~/zorg/output/"
               :publishing-directory "~/zorg/output_html/"
               :recursive t
               :section-number nil
               :table-of-contents nil
               :base-extension "org"
               :publishing-function org-html-publish-to-html
               :auto-sitemap t                ; Generate sitemap.org automagically...
               :sitemap-filename "sitemap.org"  ;  call it sitemap.org
               :sitemap-title "站点地图"         ;
               :sitemap-sort-folders last
               ;;:sitemap-file-entry-format "%t%d"
               :style-include-default nil
               :section-numbers nil
               :table-of-contents nil
               :author-info nil
               :creator-info nil)
              ("zcl-extra"
               :base-directory "~/zorg/output/"
               :publishing-directory "~/zorg/output_html/"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("zcl"
               :components ("zcl-org" "zcl-extra"))
              ("znotes-inherit"
               :base-directory "~/zorg/output/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/output_html/znotes/"
               :publishing-function org-publish-attachment
               )
              ("znotes-org"
               :base-directory "~/zorg/output/znotes"
               :publishing-directory "~/zorg/output_html/znotes/"
               :recursive t
               :section-number nil
               :table-of-contents nil
               :base-extension "org"
               :publishing-function org-html-publish-to-html
               :auto-sitemap t                ; Generate sitemap.org automagically...
               :sitemap-filename "znotes-map.org"  ;  call it sitemap.org
               :sitemap-title "znotes地图"         ;
               :sitemap-sort-folders last
               ;;:sitemap-file-entry-format "%t%d"
               :style-include-default nil
               :section-numbers nil
               :table-of-contents nil
               :author-info nil
               :creator-info nil
               )
              ("znotes-extra"
               :base-directory "~/zorg/output/znotes"
               :publishing-directory "~/zorg/output_html/znotes"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("znotes"
               :components ("znotes-org" "znotes-extra"))
              ("lte-inherit"
               :base-directory "~/zorg/output/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/output_html/lte/"
               :publishing-function org-publish-attachment
               )
              ("lte-org"
               :base-directory "~/zorg/output/lte"
               :publishing-directory "~/zorg/output_html/lte/"
               :recursive t
               :section-number nil
               :table-of-contents nil
               :base-extension "org"
               :publishing-function org-html-publish-to-html
               :auto-sitemap t                ; Generate sitemap.org automagically...
               :sitemap-filename "lte-map.org"  ;  call it sitemap.org
               :sitemap-title "lte地图"         ;
               :sitemap-sort-folders last
               ;;:sitemap-file-entry-format "%t%d"
               :style-include-default nil
               :section-numbers t
               :table-of-contents nil
               :author-info nil
               :creator-info nil
               )
              ("lte-extra"
               :base-directory "~/zorg/output/lte"
               :publishing-directory "~/zorg/output_html/lte"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("lte"
               :components ("lte-org" "lte-extra"))
              ("communication-inherit"
               :base-directory "~/zorg/output/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/output_html/communication/"
               :publishing-function org-publish-attachment
               )
              ("communication-org"
               :base-directory "~/zorg/output/communication"
               :publishing-directory "~/zorg/output_html/communication/"
               :recursive t
               :section-number nil
               :table-of-contents nil
               :base-extension "org"
               :publishing-function org-html-publish-to-html
               :auto-sitemap t                ; Generate sitemap.org automagically...
               :sitemap-filename "communication-map.org"  ;  call it sitemap.org
               :sitemap-title "communication地图"         ;
               :sitemap-sort-folders last
               ;;:sitemap-file-entry-format "%t%d"
               :style-include-default nil
               :section-numbers nil
               :table-of-contents nil
               :author-info nil
               :creator-info nil
               )
              ("communication-extra"
               :base-directory "~/zorg/output/communication"
               :publishing-directory "~/zorg/output_html/communication"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("communication"
               :components ("communication-org" "communication-extra"))
              ("math-inherit"
               :base-directory "~/zorg/output/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/output_html/math/"
               :publishing-function org-publish-attachment
               )
              ("math-org"
               :base-directory "~/zorg/output/math"
               :publishing-directory "~/zorg/output_html/math/"
               :recursive t
               :section-number nil
               :table-of-contents nil
               :base-extension "org"
               :publishing-function org-html-publish-to-html
               :auto-sitemap t                ; Generate sitemap.org automagically...
               :sitemap-filename "math-map.org"  ;  call it sitemap.org
               :sitemap-title "math地图"         ;
               :sitemap-sort-folders last
               ;;:sitemap-file-entry-format "%t%d"
               :style-include-default nil
               :section-numbers nil
               :table-of-contents nil
               :author-info nil
               :creator-info nil
               )
              ("math-extra"
               :base-directory "~/zorg/output/math"
               :publishing-directory "~/zorg/output_html/math"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("math"
               :components ("math-org" "math-extra"))
              ("computer-inherit"
               :base-directory "~/zorg/output/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/output_html/computer/"
               :publishing-function org-publish-attachment
               )
              ("computer-org"
               :base-directory "~/zorg/output/computer"
               :publishing-directory "~/zorg/output_html/computer/"
               :recursive t
               :section-number nil
               :table-of-contents nil
               :base-extension "org"
               :publishing-function org-html-publish-to-html
               :auto-sitemap t                ; Generate sitemap.org automagically...
               :sitemap-filename "computer-map.org"  ;  call it sitemap.org
               :sitemap-title "computer地图"         ;
               :sitemap-sort-folders last
               ;;:sitemap-file-entry-format "%t%d"
               :style-include-default nil
               :section-numbers nil
               :table-of-contents nil
               :author-info nil
               :creator-info nil
               )
              ("computer-extra"
               :base-directory "~/zorg/output/computer"
               :publishing-directory "~/zorg/output_html/computer"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("computer"
               :components ("computer-org" "computer-extra"))
              ("linux-inherit"
               :base-directory "~/zorg/output/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/output_html/linux/"
               :publishing-function org-publish-attachment
               )
              ("linux-org"
               :base-directory "~/zorg/output/linux"
               :publishing-directory "~/zorg/output_html/linux/"
               :recursive t
               :section-number nil
               :table-of-contents nil
               :base-extension "org"
               :publishing-function org-html-publish-to-html
               :auto-sitemap t                ; Generate sitemap.org automagically...
               :sitemap-filename "linux-map.org"  ;  call it sitemap.org
               :sitemap-title "linux地图"         ;
               :sitemap-sort-folders last
               ;;:sitemap-file-entry-format "%t%d"
               :style-include-default nil
               :section-numbers nil
               :table-of-contents nil
               :author-info nil
               :creator-info nil
               )
              ("linux-extra"
               :base-directory "~/zorg/output/linux"
               :publishing-directory "~/zorg/output_html/linux"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("linux"
               :components ("linux-org" "linux-extra"))
              ("tools-inherit"
               :base-directory "~/zorg/output/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/output_html/tools/"
               :publishing-function org-publish-attachment
               )
              ("tools-org"
               :base-directory "~/zorg/output/tools"
               :publishing-directory "~/zorg/output_html/tools/"
               :recursive t
               :section-number nil
               :table-of-contents nil
               :base-extension "org"
               :publishing-function org-html-publish-to-html
               :auto-sitemap t                ; Generate sitemap.org automagically...
               :sitemap-filename "tools-map.org"  ;  call it sitemap.org
               :sitemap-title "tools地图"         ;
               :sitemap-sort-folders last
               ;;:sitemap-file-entry-format "%t%d"
               :style-include-default nil
               :section-numbers nil
               :table-of-contents nil
               :author-info nil
               :creator-info nil
               )
              ("tools-extra"
               :base-directory "~/zorg/output/tools"
               :publishing-directory "~/zorg/output_html/tools"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("tools"
               :components ("tools-org" "tools-extra"))
              ("read-inherit"
               :base-directory "~/zorg/output/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/output_html/read/"
               :publishing-function org-publish-attachment
               )
              ("read-org"
               :base-directory "~/zorg/output/read"
               :publishing-directory "~/zorg/output_html/read/"
               :recursive t
               :section-number nil
               :table-of-contents nil
               :base-extension "org"
               :publishing-function org-html-publish-to-html
               :auto-sitemap t                ; Generate sitemap.org automagically...
               :sitemap-filename "read-map.org"  ;  call it sitemap.org
               :sitemap-title "read地图"         ;
               :sitemap-sort-folders last
               ;;:sitemap-file-entry-format "%t%d"
               :style-include-default nil
               :section-numbers nil
               :table-of-contents nil
               :author-info nil
               :creator-info nil
               )
              ("read-extra"
               :base-directory "~/zorg/output/read"
               :publishing-directory "~/zorg/output_html/read"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("read"
               :components ("read-org" "read-extra"))
              ("math-inherit"
               :base-directory "~/zorg/output/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/output_html/math/"
               :publishing-function org-publish-attachment
               )
              ("文瑞-org"
               :base-directory "~/zorg/output/文瑞"
               :publishing-directory "~/zorg/output_html/文瑞/"
               :recursive t
               :section-number nil
               :table-of-contents nil
               :base-extension "org"
               :publishing-function org-html-publish-to-html
               :auto-sitemap t                ; Generate sitemap.org automagically...
               :sitemap-filename "文瑞-map.org"  ;  call it sitemap.org
               :sitemap-title "文瑞地图"         ;
               :sitemap-sort-folders first
               ;;:sitemap-file-entry-format "%t%d"
               :style-include-default nil
               :section-numbers nil
               :table-of-contents nil
               :html-postamble nil
               :creator-info nil
               :author-info t
               )
              ("文瑞-extra"
               :base-directory "~/zorg/output/文瑞"
               :publishing-directory "~/zorg/output_html/文瑞"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("文瑞"
               :components ("文瑞-org" "文瑞-extra"))
              )))

;; I'm lazy and don't want to remember the name of the project to publish when I modify
;; a file that is part of a project.  So this function saves the file, and publishes
;; the project that includes this file

;; It's bound to C-S-F12 so I just edit and hit C-S-F12 when I'm done and move on to the next thing

(defun bh/save-then-publish (&optional force)
  (interactive "P")
  (save-buffer)
  (org-save-all-org-buffers)
  (org-publish-current-project force))

(setq org-html-postamble t)
;;(setq org-html-postamble-format )

(global-set-key (kbd "C-<f12>") 'bh/save-then-publish)

(setq org-latex-listings t)

(setq org-html-xml-declaration (quote (("html" . "")
                                       ("was-html" . "<?xml version=\"1.0\" encoding=\"%s\"?>")
                                       ("php" . "<?php echo \"<?xml version=\\\"1.0\\\" encoding=\\\"%s\\\" ?>\"; ?>"))))
(setq org-html-doctype "xhtml-strict")
(setq org-html-postamble-format
      (quote
       (("en" "<div id=\"disqus_thread\"></div>
<script type=\"text/javascript\">
    /* * * CONFIGURATION VARIABLES * * */
    var disqus_shortname = 'zclspace';

    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href=\"https://disqus.com/?ref_noscript\" rel=\"nofollow\">comments powered by Disqus.</a></noscript>"))))

;;     (("en" "<!-- 多说评论框 start -->
;;  <div class=\"ds-thread\"></div>
;; <!-- 多说评论框 end -->
;; <!-- 多说公共JS代码 start (一个网页只需插入一次) -->
;; <script type=\"text/javascript\">
;; var duoshuoQuery = {short_name:\"emacsun\"};
;;  (function() {
;;    var ds = document.createElement('script');
;;    ds.type = 'text/javascript';ds.async = true;
;;    ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
;;    ds.charset = 'UTF-8';
;;    (document.getElementsByTagName('head')[0]
;;     || document.getElementsByTagName('body')[0]).appendChild(ds);
;;  })();
;;  </script>
;; <!-- 多说公共JS代码 end -->"))))

(defun org-html-toc (depth info)
  "Build a table of contents.
DEPTH is an integer specifying the depth of the table.  INFO is a
plist used as a communication channel.  Return the table of
contents as a string, or nil if it is empty."
  (let ((toc-entries
         (mapcar (lambda (headline)
                   (cons (org-html--format-toc-headline headline info)
                         (org-export-get-relative-level headline info)))
                 (org-export-collect-headlines info depth)))
        (outer-tag (if (and (org-html-html5-p info)
                            (plist-get info :html-html5-fancy))
                       "nav"
                     "div")))
    (when toc-entries
      (concat (format "<%s id=\"table-of-contents\">\n" outer-tag)
              (format "<h%d>%s</h%d>\n"
                      org-html-toplevel-hlevel
                      (org-html--translate "目录" info)
                      org-html-toplevel-hlevel)
              "<div id=\"text-table-of-contents\">"
              (org-html--toc-text toc-entries)
              "</div>\n"
              (format "</%s>\n" outer-tag)))))
(defun org-html-table (table contents info)
  "Transcode a TABLE element from Org to HTML.
CONTENTS is the contents of the table.  INFO is a plist holding
contextual information."
  (case (org-element-property :type table)
    ;; Case 1: table.el table.  Convert it using appropriate tools.
    (table.el (org-html-table--table.el-table table info))
    ;; Case 2: Standard table.
    (t
     (let* ((caption (org-export-get-caption table))
            (number (org-export-get-ordinal
                     table info nil #'org-html--has-caption-p))
            (attributes
             (org-html--make-attribute-string
              (org-combine-plists
               (and (org-element-property :name table)
                    (list :id (org-export-get-reference table info)))
               (and (not (org-html-html5-p info))
                    (plist-get info :html-table-attributes))
               (org-export-read-attribute :attr_html table))))
            (alignspec
             (if (and (boundp 'org-html-format-table-no-css)
                      org-html-format-table-no-css)
                 "align=\"%s\"" "class=\"org-%s\""))
            (table-column-specs
             (function
              (lambda (table info)
                (mapconcat
                 (lambda (table-cell)
                   (let ((alignment (org-export-table-cell-alignment
                                     table-cell info)))
                     (concat
                      ;; Begin a colgroup?
                      (when (org-export-table-cell-starts-colgroup-p
                             table-cell info)
                        "\n<colgroup>")
                      ;; Add a column.  Also specify it's alignment.
                      (format "\n%s"
                              (org-html-close-tag
                               "col" (concat " " (format alignspec alignment)) info))
                      ;; End a colgroup?
                      (when (org-export-table-cell-ends-colgroup-p
                             table-cell info)
                        "\n</colgroup>"))))
                 (org-html-table-first-row-data-cells table info) "\n")))))
       (format "<table%s>\n%s\n%s\n%s</table>"
               (if (equal attributes "") "" (concat " " attributes))
               (if (not caption) ""
                 (format (if (plist-get info :html-table-caption-above)
                             "<caption class=\"t-above\">%s</caption>"
                           "<caption class=\"t-bottom\">%s</caption>")
                         (concat
                          "<span class=\"table-number\">"
                          (format (org-html--translate "表 %d:" info) number)
                          "</span> " (org-export-data caption info))))
               (funcall table-column-specs table info)
               contents)))))
(defun org-html-paragraph (paragraph contents info)
  "Transcode a PARAGRAPH element from Org to HTML.
CONTENTS is the contents of the paragraph, as a string.  INFO is
the plist used as a communication channel."
  (let* ((parent (org-export-get-parent paragraph))
         (parent-type (org-element-type parent))
         (style '((footnote-definition " class=\"footpara\"")
                  (org-data " class=\"footpara\"")))
         (attributes (org-html--make-attribute-string
                      (org-export-read-attribute :attr_html paragraph)))
         (extra (or (cadr (assq parent-type style)) "")))
    (cond
     ((and (eq parent-type 'item)
           (not (org-export-get-previous-element paragraph info))
           (let ((followers (org-export-get-next-element paragraph info 2)))
             (and (not (cdr followers))
                  (memq (org-element-type (car followers)) '(nil plain-list)))))
      ;; First paragraph in an item has no tag if it is alone or
      ;; followed, at most, by a sub-list.
      contents)
     ((org-html-standalone-image-p paragraph info)
      ;; Standalone image.
      (let ((caption
             (let ((raw (org-export-data
                         (org-export-get-caption paragraph) info))
                   (org-html-standalone-image-predicate
                    'org-html--has-caption-p))
               (if (not (org-string-nw-p raw)) raw
                 (concat
                  "<span class=\"figure-number\">"
                  (format (org-html--translate "图 %d:" info)
                          (org-export-get-ordinal
                           (org-element-map paragraph 'link
                             'identity info t)
                           info nil 'org-html-standalone-image-p))
                  "</span> " raw))))
            (label (and (org-element-property :name paragraph)
                        (org-export-get-reference paragraph info))))
        (org-html--wrap-image contents info caption label)))
     ;; Regular paragraph.
     (t (format "<p%s%s>\n%s</p>"
                (if (org-string-nw-p attributes)
                    (concat " " attributes) "")
                extra contents)))))
(setq org-bullets-bullet-list '("✿" "❀" "☢" "★" ))
(require 'ob-python)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . nil)
   (python . t)))
(setq org-confirm-babel-evaluate nil
      org-src-fontify-natively t
      org-src-tab-acts-natively t)
;;(setq org-latex-toc-command "\\tableofcontents\n\\titlepic{\\includegraphics[scale=0.25]{../../img/sinc.PNG}}\n\\newpage\n\n")
(setq org-latex-toc-command "\\tableofcontents\n\\titlepic{\\includegraphics[scale=0.25]{../../img/sinc.PNG}}\n")

)
