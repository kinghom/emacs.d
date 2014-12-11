
(message "%d: >>>>> Loading [ Helm ] Customization ...." step_no)
(setq step_no (1+ step_no))

; (require 'helm)
; (require 'helm-config)
; (require 'helm-eshell)
; (require 'helm-files)
; (require 'helm-grep)

; (define-key global-map [remap occur] 'helm-occur)
;; (define-key global-map [remap list-buffers] 'helm-buffers-list)
; (define-key lisp-interaction-mode-map [remap indent-for-tab-command] 'helm-lisp-completion-at-point-or-indent)
; (define-key emacs-lisp-mode-map       [remap indent-for-tab-command] 'helm-lisp-completion-at-point-or-indent)

; (define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
; (define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
; (define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)

; (setq enable-recursive-minibuffers t
;       helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
;       helm-quick-update t ; do not display invisible candidates
;       helm-idle-delay 0.01 ; be idle for this many seconds, before updating in delayed sources.
;       helm-input-idle-delay 0.01 ; be idle for this many seconds, before updating candidate buffer
;       helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.
;       helm-split-window-default-side 'other ;; open helm buffer in another window
;       helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
;       helm-candidate-number-limit 200 ; limit the number of displayed canidates
;       helm-M-x-requires-pattern 0     ; show all candidates when set to 0
;       helm-boring-file-regexp-list
;         '("\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "\\.i$") ; do not show these files in helm buffer
;       helm-ff-file-name-history-use-recentf t
;       helm-ff-skip-boring-files t
;       helm-move-to-line-cycle-in-source t ; move to end or beginning of source
;                                         ; when reaching top or bottom of source.
;       ido-use-virtual-buffers t         ; Needed in helm-buffers-list
;       helm-buffers-fuzzy-matching t     ; fuzzy matching buffer names when non--nil
;                                         ; useful in helm-mini that lists buffers
; )

; (define-key helm-map (kbd "C-x 2") 'helm-select-2nd-action)
; (define-key helm-map (kbd "C-x 3") 'helm-select-3rd-action)
; (define-key helm-map (kbd "C-x 4") 'helm-select-4rd-action)

;; use helm to list eshell history
; (add-hook 'eshell-mode-hook
;           #'(lambda ()
;               (define-key eshell-mode-map (kbd "M-l")  'helm-eshell-history)))

;; Save current position to mark ring
; (add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

;; I don't like the way switch-to-buffer uses history, since
;; that confuses me when it comes to buffers I've already
;; killed. Let's use ido instead.
; (add-to-list 'helm-completing-read-handlers-alist '(switch-to-buffer . ido))

; (helm-mode 1)

(use-package helm
  :init
  (progn
    (require 'helm-config)
    (setq helm-candidate-number-limit 100)
    ;; From https://gist.github.com/antifuchs/9238468
    (setq enable-recursive-minibuffers t
          helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
          helm-quick-update t ; do not display invisible candidates
          helm-idle-delay 0.01 ; be idle for this many seconds, before updating in delayed sources.
          helm-input-idle-delay 0.01 ; be idle for this many seconds, before updating candidate buffer
          helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.
          helm-split-window-default-side 'other ;; open helm buffer in another window
          helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
          helm-candidate-number-limit 200 ; limit the number of displayed canidates
          helm-M-x-requires-pattern 0     ; show all candidates when set to 0
          helm-boring-file-regexp-list
            '("\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "\\.i$") ; do not show these files in helm buffer
          helm-ff-file-name-history-use-recentf t
          helm-ff-skip-boring-files t
          helm-move-to-line-cycle-in-source t ; move to end or beginning of source
                                            ; when reaching top or bottom of source.
          ido-use-virtual-buffers t         ; Needed in helm-buffers-list
          helm-buffers-fuzzy-matching t     ; fuzzy matching buffer names when non--nil
                                            ; useful in helm-mini that lists buffers
                                        )
    (helm-mode))
  :config
  (progn
    ;; I don't like the way switch-to-buffer uses history, since
    ;; that confuses me when it comes to buffers I've already
    ;; killed. Let's use ido instead.
    (add-to-list 'helm-completing-read-handlers-alist
                 '(switch-to-buffer . ido))
    ;; Unicode
    (add-to-list 'helm-completing-read-handlers-alist
                 '(insert-char . ido)))
  :bind (("C-c h" . helm-mini)
         ("M-x" . helm-M-x))
  )
(ido-mode -1) ;; Turn off ido mode in case I enabled it accidentally



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm-swoop - quickly finding lines
;; List match lines to another buffer, which is able to squeeze by any
;; words you input. At the same time, the original buffer's cursor is
;; jumping line to line according to moving up and down the line list

; (require 'helm-swoop)

(autoload 'helm-swoop "helm-swoop" nil t)
(autoload 'helm-back-to-last-point "helm-swoop" nil t)

;; When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
;; From helm-swoop to helm-multi-swoop-all
(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save t)
;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows nil)
;; Split direcion. 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-vertically)
;; If nil, you can slightly boost invoke speed in exchange for text color
(setq helm-swoop-speed-or-color nil)

(provide 'helm-conf)