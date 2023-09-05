(require 'org)
(require 'no-littering)

;; configuration files
(defvar hoppla/defaults-file (no-littering-expand-etc-file-name "defaults.org"))
(defvar hoppla/hoppla-file (no-littering-expand-etc-file-name "hoppla.org"))
(defvar hoppla/user-file (no-littering-expand-etc-file-name "user.el"))

;; load default configuration
(org-babel-load-file hoppla/defaults-file)
;; load user configuration if it exists
(when (file-exists-p hoppla/user-file)
  (load-file hoppla/user-file))
;; load hoppla
(org-babel-load-file hoppla/hoppla-file)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(helpful which-key use-package ox-reveal org-sticky-header
	     no-littering magit ivy-rich htmlize evil-collection
	     counsel catppuccin-theme general doom-modeline
	     all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
