(with-eval-after-load 'org
;; Explicitly load required exporters
(require 'ox-html)
(require 'ox-latex)
(require 'ox-ascii)
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
              ("zcl.space-learning-org"
               :base-directory "~/zorg/learning/"
               :publishing-directory "~/zorg/learning/"
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
              ("zcl.space-learning-extra"
               :base-directory "~/zorg/learning/"
               :publishing-directory "~/zorg/learning/"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("zcl.space-learning"
               :components ("zcl.space-learning-org" "zcl.space-learning-extra"))

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
              ("lte-inherit"
               :base-directory "~/zorg/zcl.space/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/zcl.space/lte/"
               :publishing-function org-publish-attachment
               )
              ("lte-org"
               :base-directory "~/zorg/zcl.space/lte"
               :publishing-directory "~/zorg/zcl.space/lte/"
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
               :base-directory "~/zorg/zcl.space/lte"
               :publishing-directory "~/zorg/zcl.space/lte"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("lte"
               :components ("lte-org" "lte-extra"))
              ("communication-inherit"
               :base-directory "~/zorg/zcl.space/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/zcl.space/communication/"
               :publishing-function org-publish-attachment
               )
              ("communication-org"
               :base-directory "~/zorg/zcl.space/communication"
               :publishing-directory "~/zorg/zcl.space/communication/"
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
               :base-directory "~/zorg/zcl.space/communication"
               :publishing-directory "~/zorg/zcl.space/communication"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("communication"
               :components ("communication-org" "communication-extra"))
              ("math-inherit"
               :base-directory "~/zorg/zcl.space/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/zcl.space/math/"
               :publishing-function org-publish-attachment
               )
              ("math-org"
               :base-directory "~/zorg/zcl.space/math"
               :publishing-directory "~/zorg/zcl.space/math/"
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
               :base-directory "~/zorg/zcl.space/math"
               :publishing-directory "~/zorg/zcl.space/math"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("math"
               :components ("math-org" "math-extra"))
              ("computer-inherit"
               :base-directory "~/zorg/zcl.space/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/zcl.space/computer/"
               :publishing-function org-publish-attachment
               )
              ("computer-org"
               :base-directory "~/zorg/zcl.space/computer"
               :publishing-directory "~/zorg/zcl.space/computer/"
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
               :base-directory "~/zorg/zcl.space/computer"
               :publishing-directory "~/zorg/zcl.space/computer"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("computer"
               :components ("computer-org" "computer-extra"))
              ("linux-inherit"
               :base-directory "~/zorg/zcl.space/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/zcl.space/linux/"
               :publishing-function org-publish-attachment
               )
              ("linux-org"
               :base-directory "~/zorg/zcl.space/linux"
               :publishing-directory "~/zorg/zcl.space/linux/"
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
               :base-directory "~/zorg/zcl.space/linux"
               :publishing-directory "~/zorg/zcl.space/linux"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("linux"
               :components ("linux-org" "linux-extra"))
              ("tools-inherit"
               :base-directory "~/zorg/zcl.space/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/zcl.space/tools/"
               :publishing-function org-publish-attachment
               )
              ("tools-org"
               :base-directory "~/zorg/zcl.space/tools"
               :publishing-directory "~/zorg/zcl.space/tools/"
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
               :base-directory "~/zorg/zcl.space/tools"
               :publishing-directory "~/zorg/zcl.space/tools"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("tools"
               :components ("tools-org" "tools-extra"))
              ("read-inherit"
               :base-directory "~/zorg/zcl.space/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/zcl.space/read/"
               :publishing-function org-publish-attachment
               )
              ("read-org"
               :base-directory "~/zorg/zcl.space/read"
               :publishing-directory "~/zorg/zcl.space/read/"
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
               :base-directory "~/zorg/zcl.space/read"
               :publishing-directory "~/zorg/zcl.space/read"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("read"
               :components ("read-org" "read-extra"))
              ("me-inherit"
               :base-directory "~/zorg/zcl.space/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/zcl.space/me/"
               :publishing-function org-publish-attachment
               )
              ("me-org"
               :base-directory "~/zorg/zcl.space/me"
               :publishing-directory "~/zorg/zcl.space/me/"
               :recursive t
               :section-number nil
               :table-of-contents nil
               :base-extension "org"
               :publishing-function org-html-publish-to-html
               :auto-sitemap t                ; Generate sitemap.org automagically...
               :sitemap-filename "me-map.org"  ;  call it sitemap.org
               :sitemap-title "read地图"         ;
               :sitemap-sort-folders last
               ;;:sitemap-file-entry-format "%t%d"
               :style-include-default nil
               :section-numbers nil
               :table-of-contents nil
               :author-info nil
               :creator-info nil
               )
              ("me-extra"
               :base-directory "~/zorg/zcl.space/me"
               :publishing-directory "~/zorg/zcl.space/me"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("me"
               :components ("me-org" "me-extra"))
              ("math-inherit"
               :base-directory "~/zorg/zcl.space/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/zcl.space/math/"
               :publishing-function org-publish-attachment
               )
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
