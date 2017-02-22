;;;;;;;;;;;;;;basic;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'org-mode "org-mode" "" t)
(require 'org)
(require 'org-habit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-directory "~/zorg/")
;;The following lines are always needed. Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(add-hook 'org-mode-hook 'auto-complete-mode); 
(provide 'zcl-orgbasic)
