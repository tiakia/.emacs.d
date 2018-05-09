(add-hook 'after-init-hook (lambda () (recentf-mode 1)))
(setq-default
 recentf-max-saved-items 20
 recentf-exclude '("/tmp/" "/ssh:"))


(provide 'init-recentf)
