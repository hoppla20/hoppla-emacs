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

