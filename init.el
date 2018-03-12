;; package
(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-packages)
(require 'setup-helm)
(require 'setup-appearance)
(require 'setup-keybindings)

;; cua
(cua-mode t)
(setq cua-auto-tabify-rectangles nil)

;; auto-backup / auto-save
(defvar --autosave-directory (concat user-emacs-directory "autosave"))
(if (not (file-exists-p --autosave-directory))
    (make-directory --autosave-directory t))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name --autosave-directory))))
(defvar --backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-directory))
    (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 30              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )

(server-start)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet-snippets yasnippet company-irony-c-headers company-irony irony flycheck company-c-headers company helm-ag helm-projectile helm-swoop helm use-package spacemacs-theme projectile git-gutter-fringe+)))
 '(safe-local-variable-values
   (quote
    ((company-clang-arguments "-I/Users/vdb/LIBRARIES/openFrameworks/libs/openFrameworks/**")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
