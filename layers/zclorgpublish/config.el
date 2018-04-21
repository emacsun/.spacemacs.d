(with-eval-after-load 'org
(setq org-ditaa-jar-path "~/java/ditaa0_6b.jar")
(setq org-plantuml-jar-path "~/java/plantuml.jar")

(setq org-html-head "<style type=\"text/css\">
  pre {
    background-color: #2f4f4f;line-height: 1.6;
    FONT: 10.5pt Consola,Yahei Monaco, Courier New, helvetica;
    color:white;
  }
</style>")
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
(defvar nico-website-html-postamble
  "<div class='footer'>
Copyright 2018 %a (%v HTML).<br>
Last updated %C. <br>
Built with %c.
</div>")

(setq org-publish-project-alist
      (quote (
              ("zcl-org"
               :base-directory "~/zorg/zcl.space-learning/"
               :publishing-directory "~/zorg/zcl.space-learning/"
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
               :html-postamble nil
               :section-numbers nil
               :table-of-contents nil
               :author-info nil
               :creator-info nil)
              ("zcl-extra"
               :base-directory "~/zorg/zcl.space-learning/"
               :publishing-directory "~/zorg/zcl.space-learning/"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("zcl"
               :components ("zcl-org" "zcl-extra"))

              ("hugo-org"
               :base-directory "~/zorg/zcl.space/content_org/"
               :publishing-directory "~/zorg/zcl.space/content_org/"
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
               :html-postamble nil
               :section-numbers nil
               :table-of-contents nil
               :author-info nil
               :creator-info nil)
              ("hugo-extra"
               :base-directory "~/zorg/zcl.space/content_org/"
               :publishing-directory "~/zorg/zcl.space/content_org/"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("hugo"
               :components ("hugo-org" "hugo-extra"))

              ("znotes-inherit"
               :base-directory "~/zorg/zcl.space-learning/"
               :recursive t
               :base-extension "css\\|js"
               :publishing-directory "~/zorg/zcl.space-learning/znotes/"
               :publishing-function org-publish-attachment
               )
              ("znotes-org"
               :base-directory "~/zorg/zcl.space-learning/znotes"
               :publishing-directory "~/zorg/zcl.space-learning/znotes/"
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
               :base-directory "~/zorg/zcl.space-learning/znotes"
               :publishing-directory "~/zorg/zcl.space-learning/znotes"
               :base-extension "css\\|pdf\\|jpg\\|gif\\|PNG\\|JPG\\|png"
               :publishing-function org-publish-attachment
               :recursive t
               :author nil)
              ("znotes"
               :components ("znotes-org" "znotes-extra"))
              )))

;;(setq org-latex-toc-command "\\tableofcontents\n\\titlepic{\\includegraphics[scale=0.25]{../../img/sinc.PNG}}\n\n\n")
(setq org-latex-toc-command "\\tableofcontents\n")
(setq org-html-postamble nil)
;;(setq org-html-postamble-format )

(global-set-key (kbd "C-<f12>") 'bh/save-then-publish)

(setq org-latex-listings t)

(setq org-html-xml-declaration (quote (("html" . "")
                                       ("was-html" . "<?xml version=\"1.0\" encoding=\"%s\"?>")
                                       ("php" . "<?php echo \"<?xml version=\\\"1.0\\\" encoding=\\\"%s\\\" ?>\"; ?>"))))
(setq org-html-doctype "xhtml-strict")
;; (setq org-html-postamble-format
;;       (quote
;;        (("en" "<div id=\"disqus_thread\"></div>
;; <script type=\"text/javascript\">
;;     /* * * CONFIGURATION VARIABLES * * */
;;     var disqus_shortname = 'zclspace';

;;     /* * * DON'T EDIT BELOW THIS LINE * * */
;;     (function() {
;;         var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
;;         dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
;;         (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
;;     })();
;; </script>
;; <noscript>Please enable JavaScript to view the <a href=\"https://disqus.com/?ref_noscript\" rel=\"nofollow\">comments powered by Disqus.</a></noscript>"))))
)
