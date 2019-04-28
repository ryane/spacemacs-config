;; custom org mode settings
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|org\\.txt\\)$" . org-mode))
(setq
 org-startup-indented t
 org-cycle-separator-lines 1
 org-blank-before-new-entry '((heading . t) (plain-list-item . nil))
 org-agenda-file-regexp "\\`[^.].*\\.\\(org\\.txt\\|org\\)\\'"
 org-clock-idle-time 15
 ;; http://endlessparentheses.com/changing-the-org-mode-ellipsis.html
 org-ellipsis " ▼"
 )

;; todos
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "MIGRATED(m@/!)" "PHONE" "MEETING"))))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("MIGRATED" ("MIGRATED" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

;; organizer directory
(if (memq window-system '(w32))
    (setq rae/home-dir "C:/Users/ryan")
  (setq rae/home-dir (expand-file-name "~")))
(setq
 org-directory (concat rae/home-dir "/Dropbox/Documents/Organizer/")
 org-default-notes-file (concat org-directory "inbox.org.txt")
 rae/org-default-habits-file (concat org-directory "habits.org.txt")
 )

;; agenda
(setq
 org-agenda-files (list org-directory)
 org-agenda-skip-scheduled-if-done t
 org-agenda-skip-deadline-if-done t
 )

;; tags
;; Tags with fast selection keys
(setq org-tag-alist (quote ((:startgroup)
                            ("@errand" . ?e)
                            ("@office" . ?o)
                            ("@home" . ?H)
                            (:endgroup)
                            ("WAITING" . ?w)
                            ("MIGRATED" . ?M)
                            ("HOLD" . ?h)
                            ("IDEA" . ?i)
                            ("PERSONAL" . ?P)
                            ("DRAFT" . ?D)
                            ("WORK" . ?W)
                            ("NOTE" . ?n)
                            ("CANCELLED" . ?c)
                            ("FLAGGED" . ??))))

;; capture
(setq org-capture-templates
      (quote (("t" "todo" entry (file org-default-notes-file)
               "* TODO %?\n%U\n%a\n")
              ("m" "meeting" entry (file org-default-notes-file)
               "* MEETING with %? :MEETING:\n%U")
              ("i" "idea" entry (file org-default-notes-file)
               "* %? :IDEA:\n%U\n%a\n")
              ("n" "note" entry (file org-default-notes-file)
               "* %? :NOTE:\n%U\n%a\n")
              ("h" "habit" entry (file rae/org-default-notes-file)
               "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

;; refiling
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

(add-hook 'org-mode-hook (lambda()
                           (turn-on-auto-fill)
                           ))

;; babel
(org-babel-do-load-languages 'org-babel-load-languages
                             '(
                               (emacs-lisp . t)
                               (ruby . t)
                               (shell . t)
                               ))

;; org-journal
(setq org-journal-dir "~/Dropbox/Documents/Organizer/Journal"
      org-journal-file-format "%Y%m%d.txt")

;; are these needed?
;; (add-hook 'org-journal-mode-hook 'turn-on-auto-fill)
;; (add-hook 'org-journal-mode-hook 'flyspell-mode)

;; pomodoros (not being used currently)
;; (setq pomidor-update-interval 1500)
;; (add-hook 'pomidor-update-hook (lambda()
;;                                  (org-journal-new-entry nil)
;;                                  ))

;; (add-hook 'org-pomodoro-finished-hook (lambda()
;;                                         (org-journal-new-entry nil)
;;                                         ))
;; )
