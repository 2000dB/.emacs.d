;; projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; irony
(use-package irony
  :ensure t
  :defer t
  :init
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  :config
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
 )

(use-package company
  :ensure t
  :defer t
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (use-package company-irony :ensure t :defer t)
  (setq company-idle-delay              nil
	company-minimum-prefix-length   2
	company-show-numbers            nil
	company-tooltip-limit           20
	company-dabbrev-downcase        nil
	company-backends                '((company-irony company-gtags))
	)
  :bind ("C-\\" . company-complete-common)
  )


(use-package company-irony-c-headers)
;; Load with `irony-mode` as a grouped backend
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))

(use-package company-irony-c-headers
  :init
  (add-to-list 'company-backends 'company-irony-c-headers))


;; flycheck
(use-package flycheck
  :init
  (global-flycheck-mode 1)
)


;; yas
(use-package yasnippet
  :init
  (yas-global-mode 1)
  :config
  (use-package yasnippet-snippets)
  )


(provide 'setup-packages)
