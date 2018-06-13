;;; package --- color-theme
;;; Commentary:
;;; Code:
;;------------------------------------------------------------
;;   将 color-theme 添加到加载路径
;;------------------------------------------------------------


(add-to-list 'load-path "~/.emacs.d/plugins/themes/color-theme")
(require 'color-theme)
(color-theme-initialize)
;; 这个是你选择的主题，后面的calm forest就是它的名字，注意使用小写。
;;(color-theme-calm-forest)
;;(color-theme-subtle-hacker)
;;(color-theme-bharadwaj-slate)
;;(color-theme-sitaramv-solaris)

;; solarized aalto-light subtle-hacker gnome2 gray30 green-kingsajz
;; robin-hood white-on-grey bharadwaj bharadwaj-slate
;; charcoal-black cheap-goldenrod

;;------------------------------------------------------------
;;   不在 color-theme 的 themes
;;------------------------------------------------------------

;;------- alect-theme -------

(add-to-list 'load-path "~/.emacs.d/plugins/themes/alect-themes")
(require 'alect-themes)
(load-theme 'alect-dark t)

;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(alect-dark))

;; Ensure that themes will be applied even if they have not been customized
;; (defun reapply-themes ()
;;   "Forcibly load the themes listed in `custom-enabled-themes'."
;;   (dolist (theme custom-enabled-themes)
;;     (unless (custom-theme-p theme)
;;       (load-theme theme)))
;;   (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

;; (add-hook 'after-init-hook 'reapply-themes)


;;------------------------------------------------------------------------------
;; Toggle between light and dark
;;------------------------------------------------------------------------------


(provide 'init-themes)
;;; init-themes.el ends here
