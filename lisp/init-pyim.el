;; 灵拼
(require 'pyim)
(require 'pyim-basedict)
(pyim-basedict-enable)
(setq default-input-method "pyim")
(setq pyim-default-scheme 'quanpin)
(setq pyim-page-length 5)
(global-set-key (kbd "C-<SPC>") 'toggle-input-method)

(provide 'init-pyim)
