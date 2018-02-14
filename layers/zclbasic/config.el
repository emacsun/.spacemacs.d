(show-paren-mode 1)
;;(setq show-paren-style 'expression)
(setq show-paren-style 'parenthesis)
;; show the time
(setq system-time-locale "C")
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-default-load-average nil)
(setq display-time-load-average-threshold 10000)
(setq display-time-format "%m-%d W%W-%a %H:%M")
(when (string-equal system-type "windows-nt")
  (let (
        (mypaths
         '(
           "."
           "C:/texlive/2015/bin/win32"
           ;;"C:/Emacs/bin"
           "C:/Emacs64/bin"
           "~/.spacemacs.d/zclbin"
           "~/.spacemacs.d/zclbin/glo65wb/bin"
           ;;"C:/cygwin64/bin"
           "C:/Git/cmd"
           "C:/Git/usr/bin"
           "C:/Git/migw64/bin"
           "C:/LLVM/bin"
           "C:/Users/cliyh/Anaconda3"
           "C:/Users/cliyh/Anaconda3/Scripts"
           "C:/TDM-GCC-64/bin"
           "C:/tools/LLVM/bin"
           "C:/tools/CMake/bin"
           "C:/tools/octave-4.2.1/bin"
           "C:/Java/jdk1.8.0_121/bin"
           "C:/Java/apache-maven-3.3.9-bin"
           "C:/Users/cliyh/AppData/Local/GitHub/PortableGit_f02737a78695063deace08e96d5042710d3e32db/cmd"
           )))
    (setenv "PATH" (mapconcat 'identity mypaths ";") )
    (setq exec-path (append mypaths (list "." exec-directory)))))

;; ido
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
(add-hook 'ido-setup-hook
          (lambda ()
            (define-key ido-completion-map [tab] 'ido-complete)))

(spacemacs|diminish reftex-mode "Ⓡ" "R")
(spacemacs|diminish ggtags-mode "Ⓖ" "G")
;;set i the shortcut of going to parent directory
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "i")
              (lambda () (interactive) (find-alternate-file "..")))))
