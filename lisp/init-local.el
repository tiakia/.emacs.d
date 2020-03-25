;;; package --- local
;;; Commentary:
;;; Code:

;;;==========================================
;; - tide
;; - web-mode
;; - prettier
;; - mode-line
;; - pyim
;; - yas
;; - neotree
;; - origami
;; - dashboard
;;;==========================================

;; tide typeScript

(add-to-list 'load-path
             "~/.emacs.d/plugins/tide")

(require 'tide)


(dolist (hook (list
               'web-mode-hook
               'typescript-mode-hook
               ))
  (add-hook hook (lambda ()
                   ;; 初始化 tide
                   (tide-setup)
                   ;; 当 tsserver 服务没有启动时自动重新启动
                   (unless (tide-current-server)
                     (tide-restart-server))
                   )))
;;; -------------------------------------------------------------

;; ;; Javascript, Typescript and Flow support for lsp-mode
;; ;;
;; ;; Install:
;; ;;
;; ;; npm install -g typescript
;; ;; npm install -g typescript-language-server
;; ;;
;; ;; Fixed error "[tsserver] /bin/sh: /usr/local/Cellar/node/10.5.0_1/bin/npm: No such file or directory" :
;; ;;
;; ;; sudo ln -s /usr/local/bin/npm /usr/local/Cellar/node/10.5.0_1/bin/npm
;; ;;
;; (add-hook 'js-mode-hook #'lsp-typescript-enable)
;; (add-hook 'typescript-mode-hook #'lsp-typescript-enable) ;; for typescript support
;; (add-hook 'web-mode #'lsp-typescript-enable) ;; for web-mode support

;; (defun lsp-company-transformer (candidates)
;;   (let ((completion-ignore-case t))
;;     (all-completions (company-grab-symbol) candidates)))

;; (defun lsp-js-hook nil
;;   (make-local-variable 'company-transformers)
;;   (push 'lsp-company-transformer company-transformers))

;; (add-hook 'js-mode-hook 'lsp-js-hook)
;; (add-hook 'web-mode-hook 'lsp-js-hook)
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

;; Installing on Windows
;; First install chocolate
;; Then choco install diffutils
(require 'prettier-js)

(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'js2-jsx-mode-hook 'prettier-js-mode)
;; prettier code ends here

;;; --------------------------------------------------------------

;;; mode-line-custom start

;; Mode-line
(use-package doom-modeline
  :ensure t
  :config
  (setq size-indication-mode t)
  (setq doom-modeline-project-detection 'project)
  (setq doom-modeline-buffer-file-name-style 'file-name)
  ;; Whether display icons in mode-line. Respects `all-the-icons-color-icons'.
  ;; While using the server mode in GUI, should set the value explicitly.
  (setq doom-modeline-icon (display-graphic-p))

  ;; Whether display the icon for `major-mode'. Respects `doom-modeline-icon'.
  (setq doom-modeline-major-mode-icon t)

  ;; Whether display the colorful icon for `major-mode'.
  ;; Respects `doom-modeline-major-mode-icon'.
  (setq doom-modeline-major-mode-color-icon t)

  ;; Whether display the icon for the buffer state. It respects `doom-modeline-icon'.
  (setq doom-modeline-buffer-state-icon t)

  ;; Whether display the modification icon for the buffer.
  ;; Respects `doom-modeline-icon' and `doom-modeline-buffer-state-icon'.
  (setq doom-modeline-buffer-modification-icon t)

  ;; Whether to use unicode as a fallback (instead of ASCII) when not using icons.
  (setq doom-modeline-unicode-fallback nil)

  ;; Whether display the minor modes in mode-line.
  (setq doom-modeline-minor-modes (featurep 'minions))

  ;; If non-nil, a word count will be added to the selection-info modeline segment.
  (setq doom-modeline-enable-word-count nil)

  ;; Major modes in which to display word count continuously.
  ;; Also applies to any derived modes. Respects `doom-modeline-enable-word-count'.
  (setq doom-modeline-continuous-word-count-modes '(text-mode))

  ;; Whether display the buffer encoding.
  (setq doom-modeline-buffer-encoding t)

  ;; Whether display the indentation information.
  (setq doom-modeline-indent-info nil)

  ;; If non-nil, only display one number for checker information if applicable.
  (setq doom-modeline-checker-simple-format t)

  ;; The maximum number displayed for notifications.
  (setq doom-modeline-number-limit 99)

  ;; The maximum displayed length of the branch name of version control.
  (setq doom-modeline-vcs-max-length 12)

  ;; Whether display the perspective name. Non-nil to display in mode-line.
  (setq doom-modeline-persp-name t)

  ;; If non nil the default perspective name is displayed in the mode-line.
  (setq doom-modeline-display-default-persp-name nil)

  ;; Whether display the `lsp' state. Non-nil to display in mode-line.
  (setq doom-modeline-lsp t)

  ;; Whether display the GitHub notifications. It requires `ghub' package.
  (setq doom-modeline-github nil)

  ;; The interval of checking GitHub.
  (setq doom-modeline-github-interval (* 30 60))

  ;; Whether display the modal state icon.
  ;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
  (setq doom-modeline-modal-icon t)

  ;; Whether display the mu4e notifications. It requires `mu4e-alert' package.
  (setq doom-modeline-mu4e t)

  ;; Whether display the IRC notifications. It requires `circe' or `erc' package.
  (setq doom-modeline-irc t)

  ;; Function to stylize the irc buffer names.
  (setq doom-modeline-irc-stylize 'identity)

  ;; Whether display the environment version.
  (setq doom-modeline-env-version t)
  ;; Or for individual languages
  (setq doom-modeline-env-enable-python t)
  (setq doom-modeline-env-enable-ruby t)
  (setq doom-modeline-env-enable-perl t)
  (setq doom-modeline-env-enable-go t)
  (setq doom-modeline-env-enable-elixir t)
  (setq doom-modeline-env-enable-rust t)

  ;; Change the executables to use for the language version string
  (setq doom-modeline-env-python-executable "python") ; or `python-shell-interpreter'
  (setq doom-modeline-env-ruby-executable "ruby")
  (setq doom-modeline-env-perl-executable "perl")
  (setq doom-modeline-env-go-executable "go")
  (setq doom-modeline-env-elixir-executable "iex")
  (setq doom-modeline-env-rust-executable "rustc")

  ;; What to dispaly as the version while a new one is being loaded
  (setq doom-modeline-env-load-string "...")

  ;; Hooks that run before/after the modeline version string is updated
  (setq doom-modeline-before-update-env-hook nil)
  (setq doom-modeline-after-update-env-hook nil)
  :hook (after-init . doom-modeline-mode))

;; -----------------------------------------------------------------

;; Icons
;; NOTE: Must run `M-x all-the-icons-install-fonts' manually on Windows
(add-to-list 'load-path "~/.emacs.d/plugins/all-the-icons.el")

(defconst sys/win32p
  (eq system-type 'windows-nt)
  "Are we running on a WinTel system?")

(require 'all-the-icons)

(use-package all-the-icons
  :if (display-graphic-p)
  :custom-face
  ;; Reset colors since they are too dark in `doom-themes'
  (all-the-icons-silver ((((background dark)) :foreground "#716E68")
                         (((background light)) :foreground "#716E68")))
  (all-the-icons-lsilver ((((background dark)) :foreground "#B9B6AA")
                          (((background light)) :foreground "#7F7869")))
  (all-the-icons-dsilver ((((background dark)) :foreground "#838484")
                          (((background light)) :foreground "#838484")))
  :init
  (unless (or sys/win32p (member "all-the-icons" (font-family-list)))
    (all-the-icons-install-fonts t))
  :config
  (set-frame-font "Source Code Pro" t)
  (add-to-list 'all-the-icons-mode-icon-alist
               '(help-mode all-the-icons-faicon "info-circle" :height 1.1 :v-adjust -0.1 :face all-the-icons-purple))
  (add-to-list 'all-the-icons-mode-icon-alist
               '(Info-mode all-the-icons-faicon "info-circle" :height 1.1 :v-adjust -0.1))
  (add-to-list 'all-the-icons-icon-alist
               '("\\NEWS" all-the-icons-faicon "newspaper-o" :height 0.9 :v-adjust -0.2))
  (add-to-list 'all-the-icons-icon-alist
               '("\\.ipynb" all-the-icons-fileicon "jupyter" :height 1.2 :face all-the-icons-orange))
  (add-to-list 'all-the-icons-mode-icon-alist
               '(ein:notebooklist-mode all-the-icons-faicon "book" :face all-the-icons-orange))
  (add-to-list 'all-the-icons-mode-icon-alist
               '(ein:notebook-mode all-the-icons-fileicon "jupyter" :height 1.2 :face all-the-icons-orange))
  (add-to-list 'all-the-icons-mode-icon-alist
               '(ein:notebook-multilang-mode all-the-icons-fileicon "jupyter" :height 1.2 :face all-the-icons-orange))
  (add-to-list 'all-the-icons-icon-alist
               '("\\.epub$" all-the-icons-faicon "book" :face all-the-icons-green))
  (add-to-list 'all-the-icons-mode-icon-alist
               '(nov-mode all-the-icons-faicon "book" :face all-the-icons-green))
  (add-to-list 'all-the-icons-mode-icon-alist
               '(gfm-mode  all-the-icons-octicon "markdown" :face all-the-icons-blue)))

;;; --------------------------------------------------------------

;; (add-to-list 'load-path "~/.emacs.d/plugins/mode-line/nyan-mode")
;; (require 'nyan-mode)

;; ;; 简化 major-mode 的名字，替换表中没有的显示原名
;; (defun codefalling//simplify-major-mode-name ()
;;   "Return simplifyed major mode name."
;;   (let* ((major-name (format-mode-line "%m"))
;;          (replace-table '(ELisp "𝝀"
;;                                 Spacemacs\ buffer "𝓢"
;;                                 Python "𝝅"
;;                                 Shell ">"
;;                                 Markdown "𝓜"
;;                                 GFM "𝓜"
;;                                 Org "𝒪"
;;                                 Text "𝓣"
;;                                 Java "♨"
;;                                 Fundamental "ℱ"
;;                                 Web "ⓦ"
;;                                 JSON "卐"
;;                                 ))
;;          (replace-name (plist-get replace-table (intern major-name))))
;;     (if replace-name replace-name major-name)))

;; (setq default-mode-line-format
;;       (list ""
;;             'mode-line-mule-info
;;             ;;'mode-name
;;             ;; 改写mode－name
;;             "["
;;             '(:eval (propertize (codefalling//simplify-major-mode-name) 'face 'font-lock-string-face
;;                                 'help-echo buffer-file-coding-system))
;;             "]"
;;             " ❤"
;;             ;;'mode-line-modified
;;             ;;" %* "
;;             ;; 改写 mode－line-modified
;;             " [" ;; insert vs overwrite mode, input-method in a tooltip
;;             '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
;;                                 'face 'font-lock-preprocessor-face
;;                                 'help-echo (concat "Buffer is in "
;;                                                    (if overwrite-mode
;;                                                        "overwrite"
;;                                                      "insert") " mode")))

;;             ;; was this buffer modified since the last save
;;             '(:eval (when (buffer-modified-p)
;;                       (concat ","  (propertize "Mo"
;;                                                'face 'font-lock-warning-face
;;                                                'help-echo "Buffer has been modified"))))

;;             ;; is this buffer read-only?
;;             '(:eval (when buffer-read-only
;;                       (concat ","  (propertize "RO"
;;                                                'face 'font-lock-type-face
;;                                                'help-echo "Buffer is read-only"))))
;;             "] "
;;             ;;'mode-line-buffer-identification
;;             ;; 改写 mode-line-buffer-dientification
;;             '(:eval (propertize "%b " 'face 'font-lock-keyword-face
;;                                 'help-echo (buffer-file-name)))
;;             "%l"
;;             "/"
;;             (propertize "%I" 'face 'font-lock-constant-face) ;; size
;;             " "
;;             ;; git info
;;             `(vc-mode vc-mode)
;;             ;;'mode-line-process
;;             ;;'(:eval (when nyan-mode (list (nyan-create))))
;;             ))

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

;;; neotree start
(add-to-list 'load-path "~/.emacs.d/plugins/neotree")
(require 'neotree)
(add-to-list 'load-path "~/.emacs.d/plugins/all-the-icons.el")
(require 'all-the-icons)

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
(add-hook 'emacs-lisp-mode-hook 'origami-mode)

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

;;; 支持 org 导出为 markdown
(setq org-export-backends (quote (ascii html icalendar latex md)))

;;; --------------------------------------------------------------

;; dashboard

(defcustom centaur-logo (expand-file-name "logo.png" user-emacs-directory)
  "Set Centaur logo.  nil means official logo."
  :type 'string)

(use-package dashboard
  :after all-the-icons projectile persp-mode
  :diminish (dashboard-mode page-break-lines-mode)
  :defines (persp-save-dir persp-special-last-buffer)
  :functions (all-the-icons-faicon
              all-the-icons-material
              persp-get-buffer-or-null
              persp-load-state-from-file
              persp-switch-to-buffer
              winner-undo
              widget-forward)
  :bind (("<f2>" . open-dashboard)
         :map dashboard-mode-map
         ("q" . quit-dashboard)
         ("R" . restore-session)
         )
  :hook (dashboard-mode . (lambda () (setq-local frame-title-format "")))
  :init (dashboard-setup-startup-hook)
  :config
  ;;(setq initial-buffer-choice (lambda () (get-buffer dashboard-buffer-name)))
  (setq initial-buffer-choice (lambda () (switch-to-buffer dashboard-buffer-name)))
  ;; Set the title
  (setq dashboard-banner-logo-title "Welcome to Emacs Dashboard ❤ Enjoy Programming")
  ;; Set the banner
  (setq dashboard-startup-banner (or centaur-logo 'official))
  ;; Value can be
  ;; 'official which displays the official emacs logo
  ;; 'logo which displays an alternative emacs logo
  ;; 1, 2 or 3 which displays one of the text banners
  ;; "path/to/your/image.png" which displays whatever image you would prefer

  ;; Content is not centered by default. To center, set
  (setq dashboard-center-content t)

  ;; To disable shortcut "jump" indicators for each section, set
  (setq dashboard-show-shortcuts nil)
  ;; To customize which widgets are displayed, you can use the following snippet
  (setq dashboard-items '((recents  . 20)
                          (bookmarks . 5)
                          (projects . 10)
                          (agenda . 5)
                          ))
  ;; To add icons to the widget headings and their items:
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  ;; To modify heading icons with another icon from all-the-icons octicons:
  (dashboard-modify-heading-icons '((recents . "file-text")
                                    (bookmarks . "book")))
  ;; To show navigator below the banner:
  (setq dashboard-set-navigator t)
  ;; To customize the buttons of the navigator like this:
  ;; Format: "(icon title help action face prefix suffix)"
  (setq dashboard-navigator-buttons
        `( ;; line1
          ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
            "Homepage"
            "Browse homepage"
            (lambda (&rest _) (browse-url "homepage")))
           ;; ("★" "Star" "Show stars" (lambda (&rest _) (show-stars)) warning)
           ;; ("?" "" "?/h" #'show-help nil "<" ">")
           )
          ;; line 2
          ;; ((,(all-the-icons-faicon "linkedin" :height 1.1 :v-adjust 0.0)
          ;;   "Linkedin"
          ;;   ""
          ;;   (lambda (&rest _) (browse-url "homepage")))
          ;;  ("⚑" nil "Show flags" (lambda (&rest _) (message "flag")) error))
          ))

  ;; To show info about the packages loaded and the init time:
  (setq dashboard-set-init-info t)
  ;; Also, the message can be customized like this:
  ;; (setq dashboard-init-info "This is an init message!")
  (setq dashboard-init-info (concat
                             (propertize (format "%d packages loaded in %s "
                                                 (length package-activated-list) (emacs-init-time))
                                         'face 'font-lock-comment-face)
                             ))
  ;;A randomly selected footnote will be displayed. To disable it:
  (setq dashboard-set-footer t)
  ;;To customize it and customize its icon;
  (setq dashboard-footer "Dashboard is pretty cool!")
  (setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
                                                     :height 1.1
                                                     :v-adjust -0.05
                                                     :face 'font-lock-keyword-face))
  ;;To display today’s agenda items on the dashboard, add agenda to dashboard-items:
  ;;(add-to-list 'dashboard-items '(agenda) t)
  ;; To show agenda for the upcoming seven days set the variable show-week-agenda-p to t.
  (setq show-week-agenda-p t)

  ;; (defvar dashboard-recover-layout-p nil
  ;;   "Wether recovers the layout.")

  (defun open-dashboard ()
    "Open the *dashboard* buffer and jump to the first widget."
    (interactive)
    ;; Check if need to recover layout
    ;; (if (> (length (window-list-1))
    ;;        ;; exclude `treemacs' window
    ;;        (if (and (fboundp 'treemacs-current-visibility)
    ;;                 (eq (treemacs-current-visibility) 'visible))
    ;;            2
    ;;          1))
    ;;     (setq dashboard-recover-layout-p t))

    (delete-other-windows)

    ;; Refresh dashboard buffer
    (if (get-buffer dashboard-buffer-name)
        (kill-buffer dashboard-buffer-name))
    (dashboard-insert-startupify-lists)
    (switch-to-buffer dashboard-buffer-name)

    ;; Jump to the first section
    (goto-char (point-min))
    (dashboard-goto-recent-files))

  (defun quit-dashboard ()
    "Quit dashboard window."
    (interactive)
    (quit-window t)
    (when (and dashboard-recover-layout-p
               (bound-and-true-p winner-mode))
      (winner-undo)
      (setq dashboard-recover-layout-p nil)))

  (defun restore-session ()
    "Restore last session."
    (interactive)
    (when (bound-and-true-p persp-mode)
      (message "Restoring session...")
      (condition-case-unless-debug err
          (persp-load-state-from-file)
        (error
         (message "Error: Unable to restore last session -- %s" err)))
      (when (persp-get-buffer-or-null persp-special-last-buffer)
        (persp-switch-to-buffer persp-special-last-buffer))))


  (defun dashboard-goto-recent-files ()
    "Go to recent files."
    (interactive)
    (funcall (local-key-binding "r")))

  (defun dashboard-goto-projects ()
    "Go to projects."
    (interactive)
    (funcall (local-key-binding "p")))

  (defun dashboard-goto-bookmarks ()
    "Go to bookmarks."
    (interactive)
    (funcall (local-key-binding "m")))

  )

(global-set-key (kbd "<f2>") 'open-dashboard)

;;; ----------------------------------------------------

;;(setq org-agenda-files (find-lisp-find-files "~/org/" "\.org$"))

(setq org-agenda-files '("~/org"))

;;; ----------------------------------------------------


(provide 'init-local)
;;; init-local ends here
