
(message "%d: >>>>> Loading [ Key Bindings ] ...." step_no)
(setq step_no (1+ step_no))

;;; === define prefix binding key ===
(define-prefix-command 'ctrl-cc-map)
;; (global-set-key (kbd "C-c c") 'ctrl-cc-map)

(define-prefix-command 'ctrl-z-map)
(global-set-key (kbd "C-z") 'ctrl-z-map)

;; Moving around more easily (default setting)
;;  (global-set-key [C-right] 'forward-word)
;;  (global-set-key [C-left]  'backward-word)

;; Make control+pageup/down scroll the other buffer
(global-set-key [C-next]            'scroll-other-window)
(global-set-key [C-prior]           'scroll-other-window-down)

(global-set-key [C-backspace]       'my-delete-line)
(global-set-key [C-delete]          'my-delete-line)
;; switch in windows with arrow key
; (global-set-key (kbd "C-c <up>")    'windmove-up)
; (global-set-key (kbd "C-c <down>")  'windmove-down)
; (global-set-key (kbd "C-c <left>")  'windmove-left)
; (global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c SPC")     'my-goto-last-edit-pos)
;; This binds word completions to Shift-Tab, and Ctrl+Space
;;  (global-set-key [S-iso-lefttab]     'dabbrev-completion)
;;  (global-unset-key [?\C-\040])
;;  (global-set-key [?\C-\040]          'dabbrev-completion)
;; (global-set-key "\C-\\"             'compare-windows)
(global-set-key (kbd "M-;")         'hippie-expand)
;; (global-set-key (kbd "M-/") 		'hippie-expand)
;(global-set-key (kbd "M-/")     'dabbrev-expand) ;;(default)
(global-set-key (kbd "C-<tab>")     'dabbrev-expand)
(define-key minibuffer-local-map (kbd "C-<tab>") 'dabbrev-expand)

;; Copy sexp under cursor into register. Somewhat of a hack since
;; marked region remains active following copy. Macro will call
;; unmark-region. If there's a better way, show me!
(fset 'copy-word-under-cursor
   [?\C-\M-b ?\C-  ?\C-\M-f ?\C-x ?r ?s ?l ?\M-x ?t ?i ?: ?: ?t ?- ?u ?n ?m ?a ?r ?k ?- ?r ?e ?g ?i ?o ?n return])
(global-set-key (kbd "C-' a")       'my-revert-buffer)

(global-set-key (kbd "C-c C-e b")       'my-copy-paragraph)
(global-set-key (kbd "C-c C-e c")       'copy-word-under-cursor)
;;Open the currently selected file / directory in the same buffer as this one.
(global-set-key (kbd "C-c C-e d")       'my-dired-open-in-current-buffer) ;; not working
(global-set-key (kbd "C-c C-e i")       'indent-region)
(global-set-key (kbd "C-c C-e u")       'uncomment-region)
(global-set-key (kbd "C-c C-e v")       'view-file-other-window)
(global-set-key (kbd "C-c C-e w")       'my-copy-word)
(global-set-key (kbd "C-c e")       'eval-buffer)
;; find file at point
(global-set-key (kbd "C-c F")       'ffap)
;; find file in project
(global-set-key (kbd "C-c f")       'ffip)
;; go to specific line in current buffer
(global-set-key (kbd "C-c g")       'goto-line)
;(global-set-key (kbd "C-c h")       ')
;; (global-set-key (kbd "C-c i")       'his-imenu)

;; jump to char,similar to "f" in vim
;; (global-set-key (kbd "C-c j")       'my-go-to-char)
(global-set-key (kbd "C-c j")       'join-next-line)
(global-set-key (kbd "C-c J")       'join-previous-line)
;(global-set-key (kbd "C-c k")      'browse-kill-ring) ;; (default)
;; load .emacs
(global-set-key (kbd "C-c l")       'my-copy-line)
;; switch mode
;; (global-set-key (kbd "C-c m")       'my-switch-major-mode)
(global-set-key (kbd "C-c n")       'mouse-tear-off-window)
;; smart-compile: according to the extension to compile/run program
;; when makefile existed, run "make" automaticlly
(global-set-key (kbd "C-c o")       'smart-run)
(global-set-key (kbd "C-c p")       'smart-compile)
(global-set-key (kbd "C-c q")       'comment-region)
;; switch in the windows
;; Replace sexp under cursor with sexp previously copied into register
;; with above function "copy-word-under-cursor". I needed this so I
;; could do same paste operation without having first kill replace
;; what I wanted to paste
;; (global-set-key (kbd "C-c r")       'replace-word-under-cursor)
;; (fset 'replace-word-under-cursor [?\C-\M-b ?\C-  ?\C-\M-f ?\C-w ?\C-x ?r ?i ?l])
(global-set-key (kbd "C-c r")       'replace-word-at-point)
(global-set-key (kbd "C-c R")       'replace-regexp)
;; (global-set-key (kbd "C-c s")       'eshell)
(global-set-key (kbd "C-c t")       'term)

;; When I yank a piece of code ( known as paste in Windows lingo )
;; into an existing function, I like to have it indent itself to the
;; proper level automatically. This simple macro runs yank ( C-y )
;; followed by an indent current function. ( C-c C-q )
(fset 'do-smart-yank "\C-y\C-c\C-q")
(global-set-key (kbd "C-c y")       'do-smart-yank)
;; resize window
(global-set-key (kbd "C-c =")       'enlarge-window) ;; C-x ^
(global-set-key (kbd "C-c -")       'shrink-window)
;;(global-set-key (kbd "C-x }")       'enlarge-window-horizontally)
;;(global-set-key (kbd "C-x {")       'shrink-window-horizontally)

;; comment
;; (global-set-key (kbd "C-c C-e c")       'comment-dwim)
(global-set-key (kbd "C-;")         'comment-or-uncomment-region)
; (global-set-key "\C-c:"             'uncomment-region)
; (global-set-key "\C-c;"             'comment-region)
; (global-set-key "\C-c\C-c"          'comment-region)


(global-set-key (kbd "C-z v")       'view-mode)

;; start a new line like vim o/O
(global-set-key (kbd "C-c C-e o")         'open-newline-below)
(global-set-key (kbd "C-c C-e O")         'open-newline-above)
;; switch window
;;  (global-set-key (kbd "C-o")         'other-window) ;; use "C-x o"
;; "C-x k" kill the buffer immediately
(global-set-key (kbd "C-x k")       'kill-this-buffer)

;; (global-set-key "\M-{"              'my-insert-braces)
(global-set-key [M-delete]          'kill-word)
(global-set-key (kbd "<C-M-up>")    'move-line-up)  ; FIXME M-Up multiply bound!
(global-set-key (kbd "<C-M-down>")  'move-line-down)

;;(global-set-key "\M-%"              'query-replace) ;; (default)
(global-set-key (kbd "M-1")         'delete-other-windows)
(global-set-key (kbd "M-4")         'yic-kill-current-buffer)

;; dired
;; (global-set-key "\M-d"              'dired)

;; join lines
(global-set-key (kbd "M-j") (lambda () (interactive) (join-line -1)))
(global-set-key (kbd "M-J") 'join-line-or-lines-in-region)

;;  (global-set-key "\M-r"              'my-copy-paragraph)

;; Alt-S Alt-N for tagged searches
(global-set-key "\M-s"              'tags-search)
(global-set-key "\M-n"              'tags-loop-continue)

;; similar to C-o/C-i in vim
(require 'recent-jump nil t)
(when (featurep 'recent-jump)
  (global-set-key (kbd "M-o")       'recent-jump-jump-backward)
  (global-set-key (kbd "M-i")       'recent-jump-jump-forward)
)

;;; === Function Key ===
;; map Home and End keys to move within current line
;; (global-set-key [home]    'beginning-of-line)
(global-set-key (kbd "<home>") 'my-smart-beginning-of-line)
(global-set-key [end]     'end-of-line)
;; C-Home and C-End keys to move to beginning/end of buffer
(global-set-key [\C-home]           'beginning-of-buffer)
(global-set-key [\C-end]            'end-of-buffer)
(global-set-key [delete]  'delete-char)

(global-set-key [f1]      'help)
(global-set-key [S-f1]    'man)
(global-set-key [f2]      'undo)
(global-set-key [S-f2]    'save-buffer)
(global-set-key [f3]      'redo)
(global-set-key [S-f3]    'find-file)
(global-set-key [f4]      'browse-kill-ring)
(global-set-key [S-f4]    'lpr-buffer)

(global-set-key [f5]      'revert-buffer)
(global-set-key [S-f5]    'revert-all-buffers)
(global-set-key [f6]      'first-error)
(global-set-key [S-f6]    'previous-error)
(global-set-key [C-f6]    'next-error)
;; make all visible windows the same height (approximately)
(global-set-key [f7]      'balance-windows)
;;  (global-set-key [f8]      'next-error)

(global-set-key [f9]      'eval-region)
(global-set-key [S-f9]    'delete-frame)
(global-set-key [f10]     'split-window-vertically)
(global-set-key [S-f10]   'delete-other-windows)
(global-set-key [f11]     'kill-this-buffer)
(global-set-key [S-f11]   'kill-buffer)
(global-set-key [f12]     'delete-window)
(global-set-key [S-f12]   'kill-buffer-and-window)

;;; === misc ===
(global-set-key "%"       'goto-match-paren)
(global-set-key (kbd "C-*")     'isearch-forward-at-point)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; go to the right indentation on the next line
(global-set-key (kbd "RET") 'newline-and-indent)


;; Move more quickly
(global-set-key (kbd "C-S-n")
                (lambda ()
                  (interactive)
                  (ignore-errors (next-line 5))))

(global-set-key (kbd "C-S-p")
                (lambda ()
                  (interactive)
                  (ignore-errors (previous-line 5))))

(global-set-key (kbd "C-S-f")
                (lambda ()
                  (interactive)
                  (ignore-errors (forward-char 5))))

(global-set-key (kbd "C-S-b")
                (lambda ()
                  (interactive)
                  (ignore-errors (backward-char 5))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom key map: modi-map
;; Source: http://stackoverflow.com/questions/1024374/how-can-i-make-c-p-an-emacs-prefix-key-for-develperlysense
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-prefix-command 'modi-map)
(global-set-key (kbd "C-x m") 'modi-map) ;; overriding the default binding to `compose-mail'


;; highlight-global
; (global-set-key (kbd "M-H") 'highlight-frame-toggle)
; (global-set-key (kbd "M-+") 'clear-highlight-frame)
(define-key modi-map (kbd "h")  'highlight-frame-toggle) ;; C-x m h
(define-key modi-map (kbd "H")  'clear-highlight-frame) ;; C-x m H

;; 