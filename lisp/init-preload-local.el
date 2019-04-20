;;; package ---- preload
;;; Commentary:
;;; Code:

;; Set psersonal information
(setq user-full-name "Tiankai"
      user-mail-address "tiankai0426@sina.com")

;; set default font
(set-default-font "Source Code Pro-12")

;; set frame
;;设置窗口位置为屏库左上角(0,0)
(set-frame-position (selected-frame) 0 0)

(set-frame-width (selected-frame) 110)
(set-frame-height (selected-frame) 33)

;; set language environment
(set-language-environment 'Chinese-GBK)
(prefer-coding-system 'utf-8-unix)

(provide 'init-preload-local)
;;; init-preload-local ends here
