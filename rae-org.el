(defun dotspacemacs/user-config ()
  (setq dotspacemacs-autosave-file-directly t)
  (add-hook 'auto-save-hook 'save-buffer-if-visiting-file)


  (setq helm-echo-input-in-header-line nil)
  (setq powerline-default-separator nil)
  (setq sentence-end-double-space nil)
  (setq vc-follow-symlinks t)
  (setq open-junk-file-format "~/Dropbox/Documents/Organizer/Scratch/%Y/%m/%d-%H%M%S.")
  (setq deft-directory "~/Dropbox/Documents/Organizer/Notes"
        deft-use-filter-string-for-filename t
        deft-use-filename-as-title t
        deft-extensions '("txt" "md" "org")
        deft-text-mode 'org-mode)
  ;; (fullframe magit-status magit-mode-quit-window)


  (setq rae/font-size "10")
  (defun rae/font-size-toggle ()
    (interactive)
    (if (string= rae/font-size "14")
        (setq rae/font-size "10")
      (setq rae/font-size "14"))
    (set-frame-font (concat "Source Code Pro-" rae/font-size) nil t)
    )
  (spacemacs/set-leader-keys "zt" 'rae/font-size-toggle)

  (rae/configure-org-mode)

  (defun rae/org-agenda-day ()
    (interactive)
    (org-agenda-list nil nil 'day nil)
    )

  ;; global keybindings
  (evil-leader/set-key
    "oa" 'org-agenda
    "od" 'rae/org-agenda-day
    "oc" 'org-capture
    "ol" 'org-store-link
    "oj" 'org-clock-jump-to-current-clock
    "og" 'org-clock-goto
    )
  (evil-leader/set-key
    "fx" '(lambda() (interactive)(switch-to-buffer "*scratch*"))
    )

  ;; deft
  (evil-leader/set-key-for-mode 'deft-mode
    "ml" 'deft-filter
    "mc" 'deft-filter-clear
    )

  ;; org-journal
  (setq org-journal-dir "~/Dropbox/Documents/Organizer/Journal"
        org-journal-file-format "%Y%m%d.txt")
  (evil-leader/set-key
    "jj" 'org-journal-new-entry)

  (evil-leader/set-key-for-mode 'org-journal-mode
    "mn" 'org-journal-open-next-entry
    "mp" 'org-journal-open-previous-entry)

  (add-hook 'org-journal-mode-hook 'turn-on-auto-fill)
  (add-hook 'org-journal-mode-hook 'flyspell-mode)

  ;; markdown-mode
  (add-hook 'markdown-mode-hook 'turn-on-auto-fill)
  (add-hook 'markdown-mode-hook 'flyspell-mode)

  ;; (beacon-mode 1)

  ;; babel
  (org-babel-do-load-languages 'org-babel-load-languages
                               '(
                                 (emacs-lisp . t)
                                 (ruby . t)
                                 (shell . t)
                                 ))

  (rae/configure-pomidor)
  (setq winum-scope 'frame-local)
  )
(defun rae/configure-pomidor ()
  (spacemacs/set-leader-keys-for-major-mode 'pomidor-mode "q" 'quit-window)
  (spacemacs/set-leader-keys-for-major-mode 'pomidor-mode "Q" 'pomidor-quit)
  (spacemacs/set-leader-keys-for-major-mode 'pomidor-mode "R" 'pomidor-reset)
  (spacemacs/set-leader-keys-for-major-mode 'pomidor-mode "RET" 'pomidor-stop)
  (spacemacs/set-leader-keys-for-major-mode 'pomidor-mode "SPC" 'pomidor-break)
  (spacemacs/set-leader-keys "Bp" 'pomidor)
  (setq pomidor-update-interval 1500)

  (add-hook 'pomidor-update-hook (lambda()
                                   (org-journal-new-entry nil)
                                   ))

  )

(defun rae/save-pomidor ()
  (interactive)
  (write-region (point-min) (point-max) "/Users/ryan/Downloads/pomidoro.txt"))

(defun rae/configure-org-mode ()
  (require 'org-checklist)

  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  (add-hook 'org-mode-hook 'flyspell-mode)

  ;; settings
  (add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|org\\.txt\\)$" . org-mode))
  (setq org-startup-indented t)
  (setq org-cycle-separator-lines 1)
  (setq org-blank-before-new-entry '((heading . t) (plain-list-item . nil)))
  (setq org-agenda-file-regexp "\\`[^.].*\\.\\(org\\.txt\\|org\\)\\'")
  (setq org-clock-idle-time 15)
  (setq org-ellipsis " ▼") ;; http://endlessparentheses.com/changing-the-org-mode-ellipsis.html

  ;; keybindings
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "z" 'org-add-note)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "F" 'org-attach)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "g" 'org-mac-grab-link)

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
  (setq org-directory (concat rae/home-dir "/Dropbox/Documents/Organizer/"))
  (setq org-default-notes-file (concat org-directory "inbox.org.txt"))
  (setq rae/org-default-habits-file (concat org-directory "habits.org.txt"))

  ;; agenda
  (setq org-agenda-files (list org-directory))
  (setq org-agenda-skip-scheduled-if-done t)
  (setq org-agenda-skip-deadline-if-done t)

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

  ;; pomodoro
  (add-hook 'org-pomodoro-finished-hook (lambda()
                                          (org-journal-new-entry nil)
                                          ))
  )
