;;; packages.el --- zcllatex layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author:  <cliyh@SP4-EASTERNZCL>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `zcllatex-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `zcllatex/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `zcllatex/pre-init-PACKAGE' and/or
;;   `zcllatex/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst zcllatex-packages
  '(auctex))

(defun zcllatex/post-init-auctex
    (use-package tex
      :defer t
      :init
      (progn
        (setq Tex-parse-self t)
        (setq TeX-show-compilation t);;显示编译信息便于纠错
        (setq LaTeX-math-menu-unicode t)
        (setq my-tex-commands-extra (list
            (list "XeLaTeX" "xelatex \"%s.tex\"  " 'TeX-run-command nil t)
            (list "dvipdfm" "dvipdfm \"%s.dvi\"  " 'TeX-run-command nil t)
            (list "dvips" "dvi2ps \"%s.dvi\"  " 'TeX-run-command nil t)
            (list "pdflatex" "pdflatex \"%s.tex\"  " 'TeX-run-command nil t)
            (list "view" "SumatraPDF.exe \"%s.pdf\"  " 'TeX-run-command nil t)
            (list "gbk2uni" "gbk2uni.exe \"%s.out\"  " 'TeX-run-command nil t)
            (list "sumatrapdf" "SumatraPDF.exe \"%s.pdf\"  " 'TeX-run-command nil t)
            (list "ps2pdf" "ps2pdf \"%s.ps\" " 'TeX-run-command nil t)))
        ;;(autoload 'tex "tex" "edit the tex file")
        (setq-default TeX-command-list (append TeX-command-list my-tex-commands-extra))
        ;;(setq TeX-engine 'pdflatex);;设置latex引擎
        (when (string-equal system-type "gnu/linux")
          (setq TeX-engine 'xetex);;设置latex引擎
          )
        (setq TeX-engine 'xetex);;设置latex引擎
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pdf view pragramm;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        (when (string-equal system-type "gnu/linux")
          (add-hook 'LaTeX-mode-hook
                    (lambda()
                      (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
                      (setq TeX-command-default "XeLaTeX"))))
        (when (string-equal system-type "windows-nt")
          (add-hook 'LaTeX-mode-hook
                    (lambda()
                      (add-to-list 'TeX-command-list '("PdfLaTeX" "%`pdflatex%(mode)%' %t" TeX-run-TeX nil t))
                      (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
                      (setq TeX-command-default "pdflatex"))))

        (setq reftex-plug-into-AUCTeX t)
        (setq reftex-enable-partial-scans t)
        (setq reftex-save-parse-info t)
        (setq reftex-use-multiple-selection-buffers t )
        (autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
        (spacemacs|diminish reftex-mode "Ⓡ" "R")
        (autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" t)
        (autoload 'reftex-citation "reftex-cite" "Make citation" t)
        (autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)
        (setq reftex-toc-split-windows-horizontally t);;*toc*buffer 在左侧。
        (setq reftex-toc-split-windows-fraction 0.4);;*toc*buffer 使用整个frame 的比例。
        ;;(add-hook 'bibtex-mode-hook 'turn-on-auto-revert-mode);;自动更新bibtex数据库
        (setq reftex-texpath-environment-variables;;set the direcotry to find the .tex files
              '("./tex//:../tex//:.//"))
        (setq reftex-bibpath-environment-variables;;set the directory to find the .bib files
              '("./bib//:../bib//:.//"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pdf view pragramm;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        (cond
         ((eq system-type 'windows-nt)
          (add-hook 'LaTeX-mode-hook
                    (lambda ()
                      (setq TeX-view-program-selection '((output-pdf "sumatrapdf"))))))
         ((eq system-type 'gnu/linux)
          (add-hook 'LaTeX-mode-hook
                    (lambda ()
                      (setq TeX-view-program-selection '((output-pdf "Evince")
                                                         (output-dvi "Okular")))))))
        (when (string-equal system-type "windows-nt")
          (setq TeX-view-program-list
                '(("sumatrapdf" "SumatraPDF.exe %o")
                  ("Firefox" "firefox %o")))))))


;;; packages.el ends here
