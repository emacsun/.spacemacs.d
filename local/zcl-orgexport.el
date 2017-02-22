;;;;;;;;;;;;export html;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-src-fontify-natively t) ;设置代码高亮
;;为输出的html中的代码着色。
;;(add-to-list 'load-path "~/site-lisp/htmlize/")
(require 'htmlize)
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


(provide 'zcl-orgexport)
