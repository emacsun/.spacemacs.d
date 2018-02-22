(with-eval-after-load 'org
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;wo de;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq org-src-fontify-natively t)
  (setq org-hide-emphasis-markers t)
  ;;automatically delete this auxiliary files after export
  (setq org-export-coding-system 'utf-8)
    ;; set the exported latex file using the user defined labels
  (setq org-latex-prefer-user-labels t);
  (setq org-latex-logfiles-extensions (quote ("lof" "lot" "tex~" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl")))
  ;; open docx files in default application (ie msword)
  (setq org-file-apps
        '(("\\.docx\\'" . default)
          ("\\.mm\\'" . default)
          ("\\.x?html?\\'" . default)
          ("\\.pdf\\'" . default)
          (auto-mode . emacs)))
;;;;;;;;;;;;;;;;;;;;;;;;org export latex;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;need to add #+LaTeX_CLASS at the beginning
  (setq org-list-allow-alphabetical t)
  (setq org-highlight-latex-and-related '(latex script entities))
  ;; Explicitly load required exporters
;;;###autoload
;;  (require 'ox-html)
;;;###autoload
;;  (require 'ox-latex)
;;;###autoload
;;  (require 'ox-ascii)
  (setq org-html-table-use-header-tags-for-first-column t);
  (add-hook 'org-mode-hook
            (lambda () (setq truncate-lines nil)))
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex);
  (add-hook 'org-mode-hook 'turn-on-reftex)
  (spacemacs|diminish org-cdlatex-mode "Ⓞ" "O")
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
  (add-to-list 'org-latex-classes
               '("zclorgblueruin"
                 "\\documentclass[10pt,a4paper,UTF8]{article}
               \\usepackage{zclorgblueruin}
               [NO-DEFAULT-PACKAGES]
               [NO-PACKAGES]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

  (add-to-list 'org-latex-classes
               '("org-article"
                 "\\documentclass{org-article}
               [NO-DEFAULT-PACKAGES]
               [PACKAGES]
               [EXTRA]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(setq org-latex-listings t)
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
       ("default.bib" "~/zorg/research_library/zcl.bib")))
(define-key org-mode-map (kbd "C-c )") 'reftex-citation)
;;;;orgpublish;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq org-latex-to-pdf-process
;;       '("xelatex -interaction nonstopmode %f"
;;         "xelatex -interaction nonstopmode %f"))
;;(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))
(setq org-latex-pdf-process '("%latex -interaction nonstopmode -output-directory %o %f"
                              "bibtex %b"
                              "%latex -interaction nonstopmode -output-directory %o %f"
                              "%latex -interaction nonstopmode -output-directory %o %f"
                              "rm -rf %b.out %b.log %b.bbl %b.thm %b.aux auto "
                              ))
(when (string-equal system-type "windows-nt")
  (add-hook 'LaTeX-mode-hook
      (lambda()
      (add-to-list 'TeX-command-list '("PdfLaTeX" "%`pdflatex%(mode)%' %t" TeX-run-TeX nil t))
      (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
      (setq TeX-command-default "pdflatex"))))
(setq org-list-allow-alphabetical t)
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

)
