(defcustom rae-auto-save t
  "Non-nil values enable auto save."
  :type 'boolean
  :group 'rae)

;; automatically save buffers associated with files on buffer switch
;; and on windows switch
(defun rae-auto-save-command ()
  "Save the current buffer if `rae-auto-save' is not nil."
  (when (and rae-auto-save
             buffer-file-name
             (not (string= "go-mode" major-mode)) ;; TODO: configurable modes to exclude
             (buffer-modified-p (current-buffer))
             (file-writable-p buffer-file-name))
    (save-buffer)))

(defmacro advise-commands (advice-name commands &rest body)
  "Apply advice named ADVICE-NAME to multiple COMMANDS.
   The body of the advice is in BODY."
  `(progn
     ,@(mapcar (lambda (command)
                 `(defadvice ,command (before ,(intern (concat (symbol-name command) "-" advice-name)) activate)
                    ,@body))
               commands)))

;; advise all window switching functions
(advise-commands "auto-save"
                 (switch-to-buffer
                  other-window
                  windmove-up
                  windmove-down
                  windmove-left
                  windmove-right
                  evil-window-left
                  evil-window-right
                  evil-window-up
                  evil-window-down
                  buf-move-left
                  buf-move-right
                  buf-move-up
                  buf-move-down
                  select-window
                  select-window-1
                  select-window-2
                  select-window-3
                  select-window-4
                  select-window-5
                  select-window-6
                  select-window-7
                  select-window-8
                  select-window-9)
                 (rae-auto-save-command))
(add-hook 'mouse-leave-buffer-hook 'rae-auto-save-command)
