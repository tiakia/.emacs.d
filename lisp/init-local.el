;;; package --- local
;;; Commentary:
;;; Code:

;;;==========================================
;; - tide
;; - lsp
;; - web-mode
;; - prettier
;; - pyim
;; - mode-line
;; - yas
;; - alpha
;; - neotree
;; - origami
;;;==========================================

;; tide typeScript

(defun setup-tide-mode ()
  "Setup tide mode."
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;;; -------------------------------------------------------------

;; lsp-mode 使用 typescript-language-server 后端
(require-package 'lsp-typescript)

;; Javascript, Typescript and Flow support for lsp-mode
;;
;; Install:
;;
;; npm install -g typescript
;; npm install -g typescript-language-server
;;
;; Fixed error "[tsserver] /bin/sh: /usr/local/Cellar/node/10.5.0_1/bin/npm: No such file or directory" :
;;
;; sudo ln -s /usr/local/bin/npm /usr/local/Cellar/node/10.5.0_1/bin/npm
;;
(add-hook 'js-mode-hook #'lsp-typescript-enable)
(add-hook 'typescript-mode-hook #'lsp-typescript-enable) ;; for typescript support
(add-hook 'web-mode #'lsp-typescript-enable) ;; for web-mode support

(defun lsp-company-transformer (candidates)
  (let ((completion-ignore-case t))
    (all-completions (company-grab-symbol) candidates)))

(defun lsp-js-hook nil
  (make-local-variable 'company-transformers)
  (push 'lsp-company-transformer company-transformers))

(add-hook 'js-mode-hook 'lsp-js-hook)
(add-hook 'web-mode-hook 'lsp-js-hook)
;; tide typeScript ends here

;;; -------------------------------------------------------------

(add-to-list 'load-path
             "~/.emacs.d/plugins/web-mode")

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . web-mode))

;;; init-web-mode.el ends here

;;; --------------------------------------------------------------

;; prettier code
(require 'prettier-js)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'js2-jsx-mode-hook 'prettier-js-mode)
;; prettier code ends here

;;; --------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/plugins/mode-line/nyan-mode")
(require 'nyan-mode)

;;(set-face-attribute 'mode-line nil :background "#454545" :foreground "#d5d2be")
;;(set-face-attribute 'mode-line-buffer-id nil :foreground "#2c53ca" :background "#ccc19b")

(setq system-time-locale "C")

(setq default-mode-line-format
      (list ""
            'mode-line-mule-info
            'mode-line-modified
            " ❤ "
            'mode-line-buffer-identification
            " [%l/"
            (propertize "%I" 'face 'font-lock-constant-face) ;; size
            "]  "
            'mode-name
            " "
            ;; git info
            `(vc-mode vc-mode)
            "  "
            ;;'mode-line-process
            ;;'(:eval (when nyan-mode (list (nyan-create))))
            ))

;;(nyan-mode t) ;;启动nyan-mode
;;(setq-default nyan-bar-length 15)
;;(nyan-start-animation)
;;(setq-default nyan-wavy-trail t)
;;(setq-default nyan-cat-face-number 0)

;;; init-mode-line.el ends here

;;; --------------------------------------------------------------

;; yasnippet start
(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)

(yas-global-mode 1)
;; Remove Yasnippet's default tab key binding
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
;; Alternatively use Control-c + tab
(define-key yas-minor-mode-map (kbd "\C-c TAB") 'yas-expand)

;;; yasnipped ends here

;;; --------------------------------------------------------------

;; 灵拼
(add-to-list 'load-path
             "~/.emacs.d/plugins/pyim")
(require 'pyim)
(require 'pyim-basedict)

(pyim-basedict-enable)
(setq default-input-method "pyim")
(setq pyim-default-scheme 'quanpin)
(setq pyim-page-length 5)
(global-set-key (kbd "C-\\") 'toggle-input-method)

;;; init-pyim ends here

;;; --------------------------------------------------------------

;;set transparent effect
(global-set-key [(f10)] 'loop-alpha)
(setq alpha-list '((100 100) (95 65) (85 55) (75 45) (65 35)))
(defun loop-alpha ()
  "Be transparent until a key stroke."
  (interactive)
  (let ((h (car alpha-list)))                ;; head value will set to
    ((lambda (a ab)
       (set-frame-parameter (selected-frame) 'alpha (list a ab))
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ) (car h) (car (cdr h)))

    (setq alpha-list (cdr (append alpha-list (list h))))
    )
  )

;;; init-alpha.el ends here

;;; --------------------------------------------------------------

;;; neotree start
(add-to-list 'load-path "~/.emacs.d/plugins/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
;; need M-x [ret] package-install all-the-icons [ret]
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;; NeoTree 会自动改变根目录
(setq projectile-switch-project-action 'neotree-projectile-action)
;; 随时切换根到项目目录
;; (defun neotree-ffip-project-dir ()
;;   "Open NeoTree using the git root."
;;   (interactive)
;;   (let ((project-dir (ffip-project-root))
;;         (file-name (buffer-file-name)))
;;     (if project-dir
;;         (progn
;;           (neotree-dir project-dir)
;;           (neotree-find file-name))
;;       (message "Could not find git project root."))))

;; (define-key map (kbd "C-c C-p") 'neotree-ffip-project-dir)
;;; neotree ends here


;;; --------------------------------------------------------------

;;; 代码折叠 start
;; Hideshow
;; (use-package hideshow
;;              :ensure nil
;;              :diminish hs-minor-mode
;;              :bind (:map hs-minor-mode-map
;;                          ("C-`" . hs-toggle-hiding)))

;; Flexible text folding
;; Flexible text folding
(require-package 'origami)
(setq origami-show-fold-header t)
(add-hook 'web-mode-hook 'origami-mode)
(add-hook 'js2-mode-hook 'origami-mode)
(add-hook 'js2-jsx-mode-hook 'origami-mode)
(add-hook 'lisp-mode-hook 'origami-mode)
(global-set-key (kbd "C-`") 'origami-toggle-node)

;; (use-package origami
;;              :hook (prog-mode . origami-mode)
;;              :init (setq origami-show-fold-header t)
;;              :config
;;              (defhydra origami-hydra (:color blue :hint none)
;;                "
;;       _:_: recursively toggle node       _a_: toggle all nodes    _t_: toggle node
;;       _o_: show only current node        _u_: undo                _r_: redo
;;       _R_: reset
;;       "
;;                (":" origami-recursively-toggle-node)
;;                ("a" origami-toggle-all-nodes)
;;                ("t" origami-toggle-node)
;;                ("o" origami-show-only-node)
;;                ("u" origami-undo)
;;                ("r" origami-redo)
;;                ("R" origami-reset))

;;              :bind (:map origami-mode-map
;;                          ("C-`" . origami-hydra/body))
;;              :config
;;              (face-spec-reset-face 'origami-fold-header-face))
;;; 代码折叠 ends


;;; --------------------------------------------------------------

(provide 'init-local)
;;; init-local ends here
