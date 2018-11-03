;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; typescript
     ;; lua
     python
     ;; rust
     ;; clojure
     ;; rust
     ;; ansible
     csv
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     ;; git
     ;; markdown
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     ;; syntax-checking
     ;; version-control
     ;;
     osx
     auto-completion
     better-defaults
     (ibuffer :variables ibuffer-group-buffers-by 'projects)
     deft
     (git :variables
          git-gutter-use-fringe t)
     github
     markdown
     syntax-checking
     (org :variables
          org-enable-github-support nil)
     ;;
     html
     ;; haskell
     ;; (elm :variables
     ;;      elm-sort-imports-on-save t
     ;;      elm-format-on-save t)
     ruby
     yaml
     javascript
     (go :variables
         gofmt-command "goimports"
         ;; gofmt-args '("-s")
         go-tab-width 2)
     terraform
     docker
     react
     vinegar
     jsonnet
     ;;
     rae-auto-save
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(
                                      fullframe
                                      org-journal
                                      ;; writeroom-mode
                                      wc-goal-mode
                                      protobuf-mode
                                      ;; beacon
                                      nginx-mode
                                      groovy-mode
                                      ;; jsonnet-mode
                                      ;; pomidor
                                      ;; keychain-environment
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         deeper-blue
                         material
                         zenburn
                         spacemacs-light
                         spacemacs-dark
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 95
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all
   ))

(defun save-buffer-if-visiting-file (&optional args)
  "Save the current buffer only if it is visiting a file"
  (interactive)
  (if (and dotspacemacs-autosave-file-directly
           (buffer-file-name)
           (buffer-modified-p))
      (save-buffer args)))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."

  (setq-default evil-escape-key-sequence "jk")
  (when (eq system-type 'darwin)
    ;; tweak for using brew emacs (not emacs-mac which doesn't support running
    ;; in a terminal)
    (setq ns-use-native-fullscreen nil)
    ;; (setq exec-path-from-shell-variables '("PATH" "MANPATH" "GPG_AGENT_INFO"))
    ;; (exec-path-from-shell-initialize)
    ;; (exec-path-from-shell-copy-env "GPG_AGENT_INFO")
    )

  (when (eq system-type 'gnu/linux)
    ;; tweak for using brew emacs (not emacs-mac which doesn't support running
    ;; in a terminal)
    (setq browse-url-browser-function 'browse-url-generic
          browse-url-generic-program "google-chrome")

    (global-set-key [key-4660] 'ignore)
    )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

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
                                 (sh . t)
                                 (shell . t)
                                 ))

  (rae/configure-pomidor)
  )
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


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(alert-default-style (quote notifier))
 '(ansi-color-names-vector
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#657b83"])
 '(compilation-message-face (quote default))
 '(css-indent-offset 2)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("bf390ecb203806cbe351b966a88fc3036f3ff68cd2547db6ee3676e87327b311" default)))
 '(evil-want-Y-yank-to-eol t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(js2-strict-missing-semi-warning nil)
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-habit-following-days 4)
 '(org-habit-graph-column 60)
 '(org-habit-preceding-days 7)
 '(org-modules
   (quote
    (org-docview org-habit org-info org-irc org-rmail org-w3m org-mac-link)))
 '(package-selected-packages
   (quote
    (zenburn-theme jsonnet-mode tide typescript-mode mustache-mode nord-theme sesman kubernetes org-clock-csv org-category-capture ghub let-alist org-mime auto-dim-other-buffers restclient-helm ob-restclient company-restclient ob-http restclient know-your-http-well go-playground protobuf-mode lua-mode yapfify yaml-mode ws-butler writeroom-mode visual-fill-column winum which-key web-mode web-beautify wc-goal-mode volatile-highlights vi-tilde-fringe uuidgen use-package unfill toml-mode toc-org terraform-mode hcl-mode tagedit spaceline powerline smeargle slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reveal-in-osx-finder restart-emacs rbenv rake rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort pug-mode popwin pomidor pip-requirements persp-mode pcre2el pbcopy paradox osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro alert log4e gntp org-journal org-download org-bullets open-junk-file nginx-mode neotree mwim move-text mmm-mode minitest markdown-toc markdown-mode magit-gitflow magit-gh-pulls macrostep lorem-ipsum livid-mode skewer-mode simple-httpd live-py-mode linum-relative link-hint less-css-mode launchctl js2-refactor js-doc jinja2-mode intero info+ indent-guide ibuffer-projectile hy-mode hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make projectile helm-hoogle helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets haml-mode groovy-mode google-translate golden-ratio go-guru go-eldoc gnuplot gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist gh marshal logito pcache ht gh-md fuzzy fullframe flyspell-correct-helm flyspell-correct flycheck-rust flycheck-pos-tip pos-tip flycheck-haskell flycheck-elm flycheck flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg emmet-mode elm-mode elisp-slime-nav dumb-jump dockerfile-mode docker tablist magit-popup docker-tramp json-snatcher json-reformat diminish deft cython-mode company-web web-completion-data company-tern dash-functional tern company-go go-mode company-ghci company-ghc ghc haskell-mode company-cabal company-ansible company-anaconda column-enforce-mode cmm-mode clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg clean-aindent-mode cider-eval-sexp-fu eval-sexp-fu highlight cider spinner queue pkg-info clojure-mode epl chruby cargo rust-mode bundler inf-ruby bind-map bind-key auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile packed ansible-doc ansible anaconda-mode pythonic ace-link ace-jump-helm-line helm helm-core ac-ispell auto-complete popup yasnippet undo-tree org-plus-contrib json-mode js2-mode hydra evil-unimpaired f s dash csv-mode company-statistics company coffee-mode beacon seq async aggressive-indent adaptive-wrap ace-window avy material-theme)))
 '(paradox-github-token t)
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-sql-indent-offset 2)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:foreground "#ffffff" :background "#263238" :family "Source Code Pro" :foundry "ADBO" :slant normal :weight normal :height 100 :width normal))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))

(defun org-export-json ()
  (interactive)
  (let* ((tree (org-element-parse-buffer 'object nil)))
    (org-element-map tree (append org-element-all-elements
                                  org-element-all-objects '(plain-text))
      (lambda (x)
        (if (org-element-property :parent x)
            (org-element-put-property x :parent "none"))
        (if (org-element-property :structure x)
            (org-element-put-property x :structure "none"))
        ))
    (write-region
     (json-encode tree)
     nil (concat (buffer-file-name) ".json"))))
