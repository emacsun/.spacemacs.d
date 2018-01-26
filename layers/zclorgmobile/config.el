(with-eval-after-load 'org
  ;; tell org-mobile where the sync happens, the files that need to be
  ;; synchroized will be placed at org-mobile-directory
  (setq org-mobile-directory "~/zorg/Dropbox/MobileOrg")
  ;; tell org the files that should be synchroized
  (setq org-mobile-files (list "~/zorg/Dropbox/base/zrefile.org"
                               "~/zorg/Dropbox/base/zwork.org"
                               "~/zorg/Dropbox/base/zlife.org"
                               ))
  ;; when the changeds from mobileorg has been downloaded to local
  ;; local org will save the changes into org-mobile-inbox-for-pull
  (setq org-mobile-inbox-for-pull "~/zorg/MobileOrg/inbox.org")

  )
