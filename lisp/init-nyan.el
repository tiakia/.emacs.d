;;-------------------------------------------------
;; nyan-mode 彩虹猫
;;-------------------------------------------------

;; 这里你要将路径改为你的东西放置的文件夹
(add-to-list 'load-path "~/.emacs.d/plugins/nyan-mode")
(require 'nyan-mode)

(setq default-mode-line-format
      (list ""
            'mode-line-mule-info
            'mode-line-modified
            " ♛ "
            'mode-line-buffer-identification
            "  (%l,%c)  "
            "("
            'mode-name
            'minor-mode-list
            ") "
            '(vc-mode vc-mode)
            " "
            'mode-line-process
            '(:eval (when nyan-mode (list (nyan-create))))
            ))

(nyan-mode t) ;;启动nyan-mode
;;(nyan-start-animation)
;;(setq-default nyan-wavy-trail t)
(setq-default nyan-bar-length 15)
;;(setq-default nyan-cat-face-number 0)

(provide 'init-nyan)
