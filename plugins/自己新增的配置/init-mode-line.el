;;; package ---  nyan-mode
;;; Commentary:

;;-------------------------------------------------
;; nyan-mode 彩虹猫
;;-------------------------------------------------

;; 这里你要将路径改为你的东西放置的文件夹

;;; Code:
(add-to-list 'load-path "~/.emacs.d/plugins/mode-line/nyan-mode")
(require 'nyan-mode)

;;(set-face-attribute 'mode-line nil :background "#454545" :foreground "#d5d2be")
;;(set-face-attribute 'mode-line-buffer-id nil :foreground "#2c53ca" :background "#ccc19b")

(setq system-time-locale "C")

(setq default-mode-line-format
      (list ""
            'mode-line-mule-info
            'mode-line-modified
            " ♛ "
            'mode-line-buffer-identification
            "  (%l,%c)  "
            "("
            'mode-name
            ") "
            '(vc-mode vc-mode)
            "  "
            'mode-line-process
            '(:eval (when nyan-mode (list (nyan-create))))
            "  "
            (propertize (format-time-string "%a,%b/%d"))
            ))

(nyan-mode t) ;;启动nyan-mode
(setq-default nyan-bar-length 15)
;;(nyan-start-animation)
;;(setq-default nyan-wavy-trail t)
;;(setq-default nyan-cat-face-number 0)

(provide 'init-mode-line)
;;; init-mode-line.el ends here
