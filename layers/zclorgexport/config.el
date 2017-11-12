
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

;;;;;;;;;;;;;;;;;;;;;;;;org export latex;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;need to add #+LaTeX_CLASS at the beginning
  (setq org-list-allow-alphabetical t)
  (setq org-highlight-latex-and-related '(latex script entities))
  (add-hook 'org-mode-hook 'turn-on-reftex)
  ;; Explicitly load required exporters
;;;###autoload
  (require 'ox-html)
;;;###autoload
  (require 'ox-latex)
;;;###autoload
  (require 'ox-ascii)
  (setq org-html-table-use-header-tags-for-first-column t);
  (add-hook 'org-mode-hook
            (lambda () (setq truncate-lines nil)))
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex);
  (spacemacs|diminish org-cdlatex-mode "Ⓞ" "O")
(when (string-equal system-type "gnu/linux")
  (add-hook 'LaTeX-mode-hook
            (lambda()
              ;;(add-to-list 'TeX-command-list '("PdfLaTeX" "%`pdflatex%(mode)%' %t" TeX-run-TeX nil t))
              (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
              (setq TeX-command-default "XeLaTeX")))
  (setq org-file-apps
        (quote
         ((auto-mode . emacs)
          ("\\.mm\\'" . system)
          ("\\.x?html?\\'" . system)
          ("\\.pdf\\'" . "evince %s"))))
  )
(when (string-equal system-type "windows-nt")
  (add-hook 'LaTeX-mode-hook
            (lambda()
              (add-to-list 'TeX-command-list '("PdfLaTeX" "%`pdflatex%(mode)%' %t" TeX-run-TeX nil t))
              (setq TeX-command-default "pdflatex")))
  )

  ;; code执行免应答（Eval code without confirm）

  (setq org-confirm-babel-evaluate nil)
  (add-hook 'org-mode-hook 'org-mode-reftex-setup)
  (add-to-list 'org-latex-classes
               '("cn-article"
                 "\\documentclass[10pt,a4paper,UTF8]{article}
\\usepackage{zclorg}
\\usepackage{tikztheorem}
[NO-DEFAULT-PACKAGES]
[NO-PACKAGES]"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass[10pt,a4paper,UTF8]{article}"
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

(setq org-list-allow-alphabetical t)
)
