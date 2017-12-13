;; 灵拼
(require 'pyim)
(require 'pyim-basedict)
(pyim-basedict-enable)
(setq default-input-method "pyim")
(setq pyim-default-scheme 'quanpin)
(global-set-key (kbd "C-<SPC>") 'toggle-input-method)

(provide 'init-pyim)
