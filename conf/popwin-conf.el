
(use-package popwin
  :config
  (progn
    (popwin-mode 1)

    (setq display-buffer-function 'popwin:display-buffer)

    ;; enable popwin-mode globally is too dangerous
    (add-to-list 'popwin:special-display-config '("*Help*" :height 20))
    (add-to-list 'popwin:special-display-config '("*Message*" :noselect t :height 20))
    (add-to-list 'popwin:special-display-config '("*Completions*" :noselect t))
    (add-to-list 'popwin:special-display-config '("*compilation*" :noselect t))
    (add-to-list 'popwin:special-display-config '("*Occur*" :noselect t))
    (add-to-list 'popwin:special-display-config '("*Backtrace*" :height 10))
    (add-to-list 'popwin:special-display-config '("*Remember*" :stick t))
    (add-to-list 'popwin:special-display-config '("*Org Agenda*"))
    (add-to-list 'popwin:special-display-config '("*sdic*" :noselect))
    (add-to-list 'popwin:special-display-config '("*Apropos*" :noselect t :height 20))
    (add-to-list 'popwin:special-display-config '("*Warnings*"))
    (add-to-list 'popwin:special-display-config '("*pabbrev suggestions*"))
    (add-to-list 'popwin:special-display-config '("*auto-async-byte-compile*" :noselect))
    (add-to-list 'popwin:special-display-config '("*helm-mode-universal-coding-system-argument*"))
    (add-to-list 'popwin:special-display-config '("*Ido Completions*" :noselect t :height 30))
    (add-to-list 'popwin:special-display-config '("*magit-commit*" :noselect t :height 30 :width 80 :stick t))
    (add-to-list 'popwin:special-display-config '("*magit-diff*" :noselect t :height 40 :width 80))
    (add-to-list 'popwin:special-display-config '("*magit-edit-log*" :noselect t :height 15 :width 80))
    (add-to-list 'popwin:special-display-config '("\\*ansi-term\\*.*" :regexp t :height 30))
    (add-to-list 'popwin:special-display-config '("*shell*" :height 30))
    (add-to-list 'popwin:special-display-config '("*Kill Ring*" :height 30))
    (add-to-list 'popwin:special-display-config '("*Compile-Log*" :height 30 :stick t))
  ))