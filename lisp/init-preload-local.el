;;; package ---- preload
;;; Commentary:
;;; Code:

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "~/.emacs.d/plugins/use-package")
  (require 'use-package))

;; Set psersonal information
(setq user-full-name "Tiankai"
      user-mail-address "tiankai0426@sina.com")

;; Title
(setq frame-title-format
      '("Tiankai's Emacs - "
        (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))
(setq icon-title-format frame-title-format)

;; set default font
;; (set-default-font "Source Code Pro-11")

(set-face-attribute
 'default nil
 :font (font-spec :name "-adobe-Source Code Pro-extralight-italic-normal-*-*-*-*-*-m-0-iso10646-1"
                  :size 11.0))

;; set frame
;;设置窗口位置为屏幕左上角(0,0)
(set-frame-position (selected-frame) 0 0)

(set-frame-width (selected-frame) 110)
(set-frame-height (selected-frame) 33)

;; set language environment
(set-language-environment 'Chinese-GBK)
(prefer-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8)
;; (set-buffer-file-coding-system 'utf-8)
(setq system-time-locale "C")


(provide 'init-preload-local)
;;; init-preload-local ends here
