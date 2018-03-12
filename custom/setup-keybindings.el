;; split buffers
(global-set-key (kbd "M-0") 'delete-window)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-2") 'split-window-horizontally)
(global-set-key (kbd "M-3") 'split-window-vertically)

;; comments (setup comment styles here too!)
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c u") 'uncomment-region)

(add-hook 'c-mode-hook (lambda () (setq comment-start "//"
                                        comment-end   "")))


(provide 'setup-keybindings)
