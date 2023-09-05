(load-file (expand-file-name "default.el" user-emacs-directory))

(require 'org)
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))

