;;将~/.emacs.d/添加到加载路径
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme")
(require 'color-theme)
(color-theme-initialize)
;; 这个是你选择的主题，后面的calm forest就是它的名字，注意使用小写。
(color-theme-calm-forest)
;; ;; If you don't customize it, this is the theme you get.
;; (setq-default custom-enabled-themes '(tango-dark))

;; ;; Ensure that themes will be applied even if they have not been customized
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
