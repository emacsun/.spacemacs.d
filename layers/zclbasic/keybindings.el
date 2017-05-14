(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
(global-set-key (kbd "C-3") 'query-replace) ;询问替换

(global-set-key [f9] 'undo)

(global-set-key "\C-c\;" 'comment-or-uncomment-region)
(global-set-key "\C-c\C-k" 'kill-region)

(spacemacs/set-leader-keys "fn" 'find-file)
(spacemacs/set-leader-keys "fp" 'ffap)
(global-set-key (kbd "C-x b") 'eshell)
(global-set-key (kbd "M-SPC") 'set-mark-command)

(global-set-key [f4] 'helm-projectile-grep)

(set-register ?i (cons 'file "~/zorg/output/index.org"))
