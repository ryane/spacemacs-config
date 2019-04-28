(spacemacs/set-leader-keys
  "oa" 'org-agenda
  "od" 'rae/org-agenda-day
  "oc" 'org-capture
  "ol" 'org-store-link
  "oj" 'org-clock-jump-to-current-clock
  "og" 'org-clock-goto
  "oJ" 'org-journal-new-entry
  )

(spacemacs/set-leader-keys-for-major-mode 'org-mode
  "z" 'org-add-note
  "g" 'org-mac-grab-link
  )

(evil-leader/set-key-for-mode 'org-journal-mode
  "mn" 'org-journal-open-next-entry
  "mp" 'org-journal-open-previous-entry)

;; pomodoros
(spacemacs/set-leader-keys-for-major-mode 'pomidor-mode
  "q" 'quit-window
  "Q" 'pomidor-quit
  "R" 'pomidor-reset
  "RET" 'pomidor-stop
  "SPC" 'pomidor-break
  )
;; (spacemacs/set-leader-keys "Bp" 'pomidor)
