(defun rae/org-agenda-day ()
  (interactive)
  (org-agenda-list nil nil 'day nil)
  )

(defun rae/save-pomidor ()
  (interactive)
  (write-region (point-min) (point-max) "/Users/ryan/Downloads/pomidoro.txt"))
