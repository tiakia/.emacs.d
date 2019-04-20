;;; package --- pyim
;;; Commentary:
;; 灵拼
(require 'pyim)
(require 'pyim-basedict)

;;; Code:
(pyim-basedict-enable)
(setq default-input-method "pyim")
(setq pyim-default-scheme 'quanpin)
(setq pyim-page-length 5)
(global-set-key (kbd "C-.") 'toggle-input-method)

(provide 'init-pyim)
;;; init-pyim ends here
