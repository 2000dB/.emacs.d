;; basic
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq ring-bell-function 'ignore)
(setq-default indent-tabs-mode nil)

;; c/c++ mode offset
(setq c-default-styfle "linux"
      c-basic-offset 4)


;; highlight current line and matching parentheses
(show-paren-mode 1)
(global-hl-line-mode 1)

;; theme
(use-package spacemacs-theme
  :defer t
  :init (load-theme 'spacemacs-dark t))

;; font
(set-default-font "Inconsolata-14")

;; line numbers
(setq linum-format "%4d ")
(global-linum-mode 1)
(setq linum-disabled-modes-list '(eshell-mode  compilation-mode))
(defun linum-on ()
  (unless (or (minibufferp) (member major-mode linum-disabled-modes-list))
    (linum-mode 1)))

;; git-gutter
(use-package git-gutter+
  :init
  (global-git-gutter+-mode t))
  
(use-package git-gutter-fringe+
  :config
  (git-gutter-fr+-minimal)
  (set-face-attribute 'git-gutter-fr+-added nil :background " #3e3e3e" :foreground "green")
  (set-face-attribute 'git-gutter-fr+-modified nil :background "#3e3e3e" :foreground "white")
  (set-face-attribute 'git-gutter-fr+-deleted nil :background "#3e3e3e" :foreground "red"))

(provide 'setup-appearance)

