;; -*- lexical-binding: t -*-
;;

(when (executable-find "git")

  ;;
  ;; magit
  ;;
  (require 'magit)
  (require 'magit-svn)

  (setq magit-process-connection-type nil)
  (setq magit-repo-dirs-depth 2)
  (setq magit-save-some-buffers nil)
  (setq magit-process-popup-time 10)
  (setq magit-completing-read-function 'magit-ido-completing-read)

  ;; Add an extra newline to separate commit message from git commentary
  (defun magit-commit-mode-init ()
    (when (looking-at "\n")
      (open-line 1)))
  (add-hook 'git-commit-mode-hook 'magit-commit-mode-init)

  ;; get git status of specified dir
  (defun magit-status-somedir ()
    (interactive)
    (let ((current-prefix-arg t))
      (magit-status default-directory)))

  ;; close popup when commiting
  (defadvice git-commit-commit (after delete-window activate)
    (delete-window))

  (add-hook 'magit-log-edit-mode-hook
   (lambda ()
     (setq fill-paragraph-function nil)))

  (defun magit-cheat-sheet ()
    (interactive)
    (browse-url "http://daemianmack.com/magit-cheatsheet.html"))

  ;; Don't let magit-status mess up window configurations
  ;; http://whattheemacsd.com/setup-magit.el-01.html
  (defadvice magit-status (around magit-fullscreen activate)
   (window-configuration-to-register :magit-fullscreen)
   ad-do-it
   (delete-other-windows))

  (defun magit-quit-session ()
    "Restores the previous window configuration and kills the magit buffer"
    (interactive)
    (kill-buffer)
    (jump-to-register :magit-fullscreen))

  (define-key magit-status-mode-map (kbd "q") 'magit-quit-session)
  (require 'magit-key-mode)
)

(provide 'git-conf)