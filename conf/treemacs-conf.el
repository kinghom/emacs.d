
(use-package treemacs
  :defer t
  :commands (treemacs
             treemacs-toggle
             treemacs-bookmark
             treemacs-find-file
             treemacs-select-window)
  :config
    (setq treemacs-follow-after-init          t
          treemacs-width                      35
          treemacs-indentation                2
          treemacs-git-integration            t
          treemacs-collapse-dirs              3
          treemacs-silent-refresh             nil
          treemacs-change-root-without-asking nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-show-hidden-files          t
          treemacs-never-persist              nil
          treemacs-is-never-other-window      nil
          treemacs-goto-tag-strategy          'refetch-index)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
  ; :bind
  ; (:map global-map
  ;       ([f8]         . treemacs-toggle)
  ;       ("M-0"        . treemacs-select-window)
  ;       ("C-c 1"      . treemacs-delete-other-windows)
  ;       ("M-m ft"     . treemacs-toggle)
  ;       ("M-m fT"     . treemacs)
  ;       ("M-m fB"     . treemacs-bookmark)
  ;       ("M-m f C-t"  . treemacs-find-file)
  ;       ("M-m f M-t") . treemacs-find-tag)
  )

; (use-package treemacs-projectile
;   :defer t
;   :ensure t
;   :config
;   (setq treemacs-header-function #'treemacs-projectile-create-header)
;   :bind (:map global-map
;               ("M-m fP" . treemacs-projectile)
;               ("M-m fp" . treemacs-projectile-toggle)))

(provide 'treemacs-conf)