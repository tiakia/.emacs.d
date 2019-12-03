;;; init-windows.el --- Working with windows within frames -*- lexical-binding: t -*-
;;; Commentary:

;; This is not about the "Windows" OS, but rather Emacs's "windows"
;; concept: these are the panels within an Emacs frame which contain
;; buffers.

;;; Code:

;;----------------------------------------------------------------------------
;; Navigate window layouts with "C-c <left>" and "C-c <right>"
;;----------------------------------------------------------------------------
(add-hook 'after-init-hook 'winner-mode)

;; Make "C-x o" prompt for a target window when there are more than 2
(require-package 'switch-window)
(setq-default switch-window-shortcut-style 'alphabet)
(setq-default switch-window-timeout nil)
(global-set-key (kbd "C-x o") 'switch-window)

;; Quickly switch windows
;;(require-package 'ace-window);
;; (global-set-key (kbd "C-o") 'ace-window)
;; (setq aw-background nil)
;; (use-package ace-window
;;              :functions (hydra-frame-window/body my-aw-window<)
;;              :bind ([remap other-window] . ace-window)
;;              :custom-face
;;              (aw-leading-char-face ((t (:inherit error :bold t :height 1.1))))
;;              (aw-mode-line-face ((t (:inherit mode-line-emphasis :bold t))))
;;              :hook (after-init . ace-window-display-mode)
;;              :config
;;              ;; (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;;              ;; https://github.com/abo-abo/ace-window/wiki/Hydra
;;              ;; hydra-frame-window is designed from `ace-window' and
;;              ;; matches aw-dispatch-alist with a few extra
;;              (defhydra hydra-frame-window (:color red :hint nil)
;;                "
;; ^Frame^                 ^Window^      Window Size^^^^^^    ^Text Zoom^               (__)
;; _0_: delete             _t_oggle        ^ ^ _k_ ^ ^            _=_                   (oo)
;; _1_: delete others      _s_wap          _h_ ^+^ _l_            ^+^             /------\\/
;; _2_: new                _d_elete        ^ ^ _j_ ^ ^            _-_            / |    ||
;; _F_ullscreen            _o_ther         _b_alance^^^^          ^ ^        *  /\\---/\\  ~~  C-c w/C-x o w
;; "
;;                ("0" delete-frame :exit t)
;;                ("1" delete-other-frames :exit t)
;;                ("2" make-frame  :exit t)
;;                ("b" balance-windows)
;;                ("s" ace-swap-window)
;;                ("F" toggle-frame-fullscreen)
;;                ("t" toggle-window-split)
;;                ("d" ace-delete-window :exit t)
;;                ("o" ace-window :exit t)
;;                ("-" text-scale-decrease)
;;                ("=" text-scale-increase)
;;                ("h" shrink-window-horizontally)
;;                ("k" shrink-window)
;;                ("j" enlarge-window)
;;                ("l" enlarge-window-horizontally)
;;                ("q" nil "quit"))
;;              (add-to-list 'aw-dispatch-alist '(?w hydra-frame-window/body) t)
;;              (bind-key "C-c w" #'hydra-frame-window/body))

;;----------------------------------------------------------------------------


;;----------------------------------------------------------------------------
;; When splitting window, show (other-buffer) in the new window
;;----------------------------------------------------------------------------
(defun split-window-func-with-other-buffer (split-function)
  (lambda (&optional arg)
    "Split this window and switch to the new window unless ARG is provided."
    (interactive "P")
    (funcall split-function)
    (let ((target-window (next-window)))
      (set-window-buffer target-window (other-buffer))
      (unless arg
        (select-window target-window)))))

(global-set-key (kbd "C-x 2") (split-window-func-with-other-buffer 'split-window-vertically))
(global-set-key (kbd "C-x 3") (split-window-func-with-other-buffer 'split-window-horizontally))

(defun sanityinc/toggle-delete-other-windows ()
  "Delete other windows in frame if any, or restore previous window config."
  (interactive)
  (if (and winner-mode
           (equal (selected-window) (next-window)))
      (winner-undo)
    (delete-other-windows)))

(global-set-key (kbd "C-x 1") 'sanityinc/toggle-delete-other-windows)

;;----------------------------------------------------------------------------
;; Rearrange split windows
;;----------------------------------------------------------------------------
(defun split-window-horizontally-instead ()
  "Kill any other windows and re-split such that the current window is on the top half of the frame."
  (interactive)
  (let ((other-buffer (and (next-window) (window-buffer (next-window)))))
    (delete-other-windows)
    (split-window-horizontally)
    (when other-buffer
      (set-window-buffer (next-window) other-buffer))))

(defun split-window-vertically-instead ()
  "Kill any other windows and re-split such that the current window is on the left half of the frame."
  (interactive)
  (let ((other-buffer (and (next-window) (window-buffer (next-window)))))
    (delete-other-windows)
    (split-window-vertically)
    (when other-buffer
      (set-window-buffer (next-window) other-buffer))))

(global-set-key (kbd "C-x |") 'split-window-horizontally-instead)
(global-set-key (kbd "C-x _") 'split-window-vertically-instead)


;; Borrowed from http://postmomentum.ch/blog/201304/blog-on-emacs
(defun sanityinc/split-window()
  "Split the window to see the most recent buffer in the other window.
Call a second time to restore the original window configuration."
  (interactive)
  (if (eq last-command 'sanityinc/split-window)
      (progn
        (jump-to-register :sanityinc/split-window)
        (setq this-command 'sanityinc/unsplit-window))
    (window-configuration-to-register :sanityinc/split-window)
    (switch-to-buffer-other-window nil)))

(global-set-key (kbd "<f7>") 'sanityinc/split-window)



(defun sanityinc/toggle-current-window-dedication ()
  "Toggle whether the current window is dedicated to its current buffer."
  (interactive)
  (let* ((window (selected-window))
         (was-dedicated (window-dedicated-p window)))
    (set-window-dedicated-p window (not was-dedicated))
    (message "Window %sdedicated to %s"
             (if was-dedicated "no longer " "")
             (buffer-name))))

(global-set-key (kbd "C-c <down>") 'sanityinc/toggle-current-window-dedication)



(unless (memq window-system '(nt w32))
  (windmove-default-keybindings 'control))


(provide 'init-windows)
;;; init-windows.el ends here
