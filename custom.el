;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (bracketed-paste yapfify xterm-color ws-butler winum which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package toml-mode toc-org tagedit ssh-agency spaceline solarized-theme smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs rainbow-mode rainbow-identifiers rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort pug-mode popwin pip-requirements persp-mode pcre2el paradox ox-hugo org-present org-pomodoro org-mobile-sync org-mime org-download org-bullets open-junk-file neotree multi-term move-text monokai-theme mmm-mode matlab-mode markdown-toc magit-gitflow macrostep lorem-ipsum live-py-mode linum-relative link-hint less-css-mode jdee indent-guide ibuffer-projectile hy-mode hungry-delete htmlize hl-todo highlight-symbol highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-cscope helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md ggtags fuzzy flyspell-correct-helm flycheck-rust flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump disaster diminish diff-hl define-word cython-mode company-web company-statistics company-quickhelp company-c-headers company-auctex company-anaconda column-enforce-mode color-identifiers-mode cmake-mode clean-aindent-mode clang-format cdlatex cargo auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(safe-local-variable-values
   (quote
    ((eval add-hook
           (quote after-save-hook)
           (function org-hugo-export-wim-to-md-after-save)
           :append :local)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C"))))
 '(markdown-pre-face ((t (:foreground "blue violet"))))
 '(org-archived ((t (:foreground "#75715E" :weight normal :height 0.9 :width normal))))
 '(region ((t (:inherit highlight :background "aquamarine" :foreground "black")))))
