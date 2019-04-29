(defconst rae-org-packages
  '(
    org-plus-contrib
    org-journal
    ))

(defun rae-org/post-init-org-plus-contrib ()
  (require 'org-checklist)
  )

(defun rae-org/init-org-journal ()
  (use-package org-journal)
  )
