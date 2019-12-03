;;; init-recentf.el --- Settings for tracking recent files -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-hook 'after-init-hook 'recentf-mode)
(setq-default
 recentf-max-saved-items 1000
 recentf-exclude '((expand-file-name package-user-dir)
                   ".cache"
                   ".cask"
                   "/tmp/"
                   "/ssh:"
                   ".elfeed"
                   "bookmarks"
                   "cache"
                   "ido.*"
                   "persp-confs"
                   "recentf"
                   "undo-tree-hist"
                   "url"
                   "COMMIT_EDITMSG\\'"))

(provide 'init-recentf)
;;; init-recentf.el ends here
