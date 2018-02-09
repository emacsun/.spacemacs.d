
(defun bh/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))

;; I'm lazy and don't want to remember the name of the project to publish when I modify
;; a file that is part of a project.  So this function saves the file, and publishes
;; the project that includes this file

;; It's bound to C-S-F12 so I just edit and hit C-S-F12 when I'm done and move on to the next thing

(defun bh/save-then-publish (&optional force)
  (interactive "P")
  (save-buffer)
  (org-save-all-org-buffers)
  (org-publish-current-project force))

;;redefine several functions
;;;###autoload
;; (defun org-html-toc (depth info)
;;   "Build a table of contents.
;; DEPTH is an integer specifying the depth of the table.  INFO is a
;; plist used as a communication channel.  Return the table of
;; contents as a string, or nil if it is empty."
;;   (let ((toc-entries
;;          (mapcar (lambda (headline)
;;                    (cons (org-html--format-toc-headline headline info)
;;                          (org-export-get-relative-level headline info)))
;;                  (org-export-collect-headlines info depth)))
;;         (outer-tag (if (and (org-html-html5-p info)
;;                             (plist-get info :html-html5-fancy))
;;                        "nav"
;;                      "div")))
;;     (when toc-entries
;;       (concat (format "<%s id=\"table-of-contents\">\n" outer-tag)
;;               (format "<h%d>%s</h%d>\n"
;;                       org-html-toplevel-hlevel
;;                       (org-html--translate "目录" info)
;;                       org-html-toplevel-hlevel)
;;               "<div id=\"text-table-of-contents\">"
;;               (org-html--toc-text toc-entries)
;;               "</div>\n"
;;               (format "</%s>\n" outer-tag)))))
;; ;;;###autoload
;; (defun org-html-table (table contents info)
;;   "Transcode a TABLE element from Org to HTML.
;; CONTENTS is the contents of the table.  INFO is a plist holding
;; contextual information."
;;   (case (org-element-property :type table)
;;     ;; Case 1: table.el table.  Convert it using appropriate tools.
;;     (table.el (org-html-table--table.el-table table info))
;;     ;; Case 2: Standard table.
;;     (t
;;      (let* ((caption (org-export-get-caption table))
;;             (number (org-export-get-ordinal
;;                      table info nil #'org-html--has-caption-p))
;;             (attributes
;;              (org-html--make-attribute-string
;;               (org-combine-plists
;;                (and (org-element-property :name table)
;;                     (list :id (org-export-get-reference table info)))
;;                (and (not (org-html-html5-p info))
;;                     (plist-get info :html-table-attributes))
;;                (org-export-read-attribute :attr_html table))))
;;             (alignspec
;;              (if (and (boundp 'org-html-format-table-no-css)
;;                       org-html-format-table-no-css)
;;                  "align=\"%s\"" "class=\"org-%s\""))
;;             (table-column-specs
;;              (function
;;               (lambda (table info)
;;                 (mapconcat
;;                  (lambda (table-cell)
;;                    (let ((alignment (org-export-table-cell-alignment
;;                                      table-cell info)))
;;                      (concat
;;                       ;; Begin a colgroup?
;;                       (when (org-export-table-cell-starts-colgroup-p
;;                              table-cell info)
;;                         "\n<colgroup>")
;;                       ;; Add a column.  Also specify it's alignment.
;;                       (format "\n%s"
;;                               (org-html-close-tag
;;                                "col" (concat " " (format alignspec alignment)) info))
;;                       ;; End a colgroup?
;;                       (when (org-export-table-cell-ends-colgroup-p
;;                              table-cell info)
;;                         "\n</colgroup>"))))
;;                  (org-html-table-first-row-data-cells table info) "\n")))))
;;        (format "<table%s>\n%s\n%s\n%s</table>"
;;                (if (equal attributes "") "" (concat " " attributes))
;;                (if (not caption) ""
;;                  (format (if (plist-get info :html-table-caption-above)
;;                              "<caption class=\"t-above\">%s</caption>"
;;                            "<caption class=\"t-bottom\">%s</caption>")
;;                          (concat
;;                           "<span class=\"table-number\">"
;;                           (format (org-html--translate "表 %d:" info) number)
;;                           "</span> " (org-export-data caption info))))
;;                (funcall table-column-specs table info)
;;                contents)))))
;; ;;;###autoload
;; (defun org-html-paragraph (paragraph contents info)
;;   "Transcode a PARAGRAPH element from Org to HTML.
;; CONTENTS is the contents of the paragraph, as a string.  INFO is
;; the plist used as a communication channel."
;;   (let* ((parent (org-export-get-parent paragraph))
;;          (parent-type (org-element-type parent))
;;          (style '((footnote-definition " class=\"footpara\"")
;;                   (org-data " class=\"footpara\"")))
;;          (attributes (org-html--make-attribute-string
;;                       (org-export-read-attribute :attr_html paragraph)))
;;          (extra (or (cadr (assq parent-type style)) "")))
;;     (cond
;;      ((and (eq parent-type 'item)
;;            (not (org-export-get-previous-element paragraph info))
;;            (let ((followers (org-export-get-next-element paragraph info 2)))
;;              (and (not (cdr followers))
;;                   (memq (org-element-type (car followers)) '(nil plain-list)))))
;;       ;; First paragraph in an item has no tag if it is alone or
;;       ;; followed, at most, by a sub-list.
;;       contents)
;;      ((org-html-standalone-image-p paragraph info)
;;       ;; Standalone image.
;;       (let ((caption
;;              (let ((raw (org-export-data
;;                          (org-export-get-caption paragraph) info))
;;                    (org-html-standalone-image-predicate
;;                     'org-html--has-caption-p))
;;                (if (not (org-string-nw-p raw)) raw
;;                  (concat
;;                   "<span class=\"figure-number\">"
;;                   (format (org-html--translate "图 %d:" info)
;;                           (org-export-get-ordinal
;;                            (org-element-map paragraph 'link
;;                              'identity info t)
;;                            info nil 'org-html-standalone-image-p))
;;                   "</span> " raw))))
;;             (label (and (org-element-property :name paragraph)
;;                         (org-export-get-reference paragraph info))))
;;         (org-html--wrap-image contents info caption label)))
;;      ;; Regular paragraph.
;;      (t (format "<p%s%s>\n%s</p>"
;;                 (if (org-string-nw-p attributes)
;;                     (concat " " attributes) "")
;;                 extra contents)))))
;; ;;;###autoload
;; (defun org-html-footnote-section (info)
;;   "Format the footnote section.
;; INFO is a plist used as a communication channel."
;;   (let* ((fn-alist (org-export-collect-footnote-definitions info))
;;          (fn-alist
;;           (cl-loop for (n _type raw) in fn-alist collect
;;                    (cons n (if (eq (org-element-type raw) 'org-data)
;;                                (org-trim (org-export-data raw info))
;;                              (format "<div class=\"footpara\">%s</div>"
;;                                      (org-trim (org-export-data raw info))))))))
;;     (when fn-alist
;;       (format
;;        (plist-get info :html-footnotes-section)
;;        (org-html--translate "Footnotes" info)
;;        (format
;;         "%s"
;;         (mapconcat
;;          (lambda (fn)
;;            (let ((n (car fn)) (def (cdr fn)))
;;              (format
;;               "<div class=\"footdef\">%s %s</div>"
;;               (format
;;                (plist-get info :html-footnote-format)
;;                (org-html--anchor
;;                 (format "fn.%d" n)
;;                 n
;;                 (format " class=\"footnum\" href=\"#fnr.%d\"" n)
;;                 info))
;;               def)))
;;          fn-alist
;;          "\n"))))))
