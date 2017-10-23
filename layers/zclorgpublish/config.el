(with-eval-after-load 'org
;; Explicitly load required exporters
;;;###autoload
(require 'ox-html)
;;;###autoload
(require 'ox-latex)
;;;###autoload
(require 'ox-ascii)
;;;###autoload
(require 'ox-publish)
(setq org-ditaa-jar-path "~/java/ditaa0_6b.jar")
(setq org-plantuml-jar-path "~/java/plantuml.jar")

(setq org-html-head "<style type=\"text/css\">
  pre {
    background-color: #2f4f4f;line-height: 1.6;
    FONT: 10.5pt Consola,Yahei Monaco, Courier New, helvetica;
    color:white;
  }
</style>")
;;(add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)
                                        ; Make babel results blocks lowercase
;;(setq org-babel-results-keyword "results")


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
               :base-directory "~/zorg/zcl.space/"
               :publishing-directory "~/zorg/zcl.space/"
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
               :base-directory "~/zorg/zcl.space/"
               :publishing-directory "~/zorg/zcl.space/"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("zcl"
               :components ("zcl-org" "zcl-extra"))

              ("znotes-inherit"
               :base-directory "~/zorg/zcl.space/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/zcl.space/znotes/"
               :publishing-function org-publish-attachment
               )
              ("znotes-org"
               :base-directory "~/zorg/zcl.space/znotes"
               :publishing-directory "~/zorg/zcl.space/znotes/"
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
               :base-directory "~/zorg/zcl.space/znotes"
               :publishing-directory "~/zorg/zcl.space/znotes"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("znotes"
               :components ("znotes-org" "znotes-extra"))
              )))

(setq org-latex-toc-command "\\tableofcontents\n\\titlepic{\\includegraphics[scale=0.25]{../../img/sinc.PNG}}\n")
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
)
(with-eval-after-load 'org

;;redefine several functions
;;;###autoload
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
;;;###autoload
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
;;;###autoload
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
;;;###autoload
(defun org-html-footnote-section (info)
  "Format the footnote section.
INFO is a plist used as a communication channel."
  (let* ((fn-alist (org-export-collect-footnote-definitions info))
         (fn-alist
          (cl-loop for (n _type raw) in fn-alist collect
                   (cons n (if (eq (org-element-type raw) 'org-data)
                               (org-trim (org-export-data raw info))
                             (format "<div class=\"footpara\">%s</div>"
                                     (org-trim (org-export-data raw info))))))))
    (when fn-alist
      (format
       (plist-get info :html-footnotes-section)
       (org-html--translate "参考文献" info)
       (format
        "%s"
        (mapconcat
         (lambda (fn)
           (let ((n (car fn)) (def (cdr fn)))
             (format
              "<div class=\"footdef\">%s %s</div>"
              (format
               (plist-get info :html-footnote-format)
               (org-html--anchor
                (format "fn.%d" n)
                n
                (format " class=\"footnum\" href=\"#fnr.%d\"" n)
                info))
              def)))
         fn-alist
         "\n"))))))
)
