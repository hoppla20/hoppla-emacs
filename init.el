(dolist (sym '(customize-option customize-browse customize-group customize-face
               customize-rogue customize-saved customize-apropos
               customize-changed customize-unsaved customize-variable
               customize-set-value customize-customized customize-set-variable
               customize-apropos-faces customize-save-variable
               customize-apropos-groups customize-apropos-options
               customize-changed-options customize-save-customized))
  (put sym 'disabled "Hoppla-emacs doesn't support `customize', configure Emacs from $EMACSCONFDIR/default.org instead"))
(put 'customize-themes 'disabled "Use `load-theme' in $EMACSCONFDIR/default.org instead")

(require 'package)
(setq package-archives
'(
   ("melpa" . "https://melpa.org/packages/")
   ("melpaStable" . "https://stable.melpa.org/packages/")
   ("nongnu" . "https://elpa.nongnu.org/nongnu/")
   ("elpa" . "https://elpa.gnu.org/packages/")
   ("elpaDevel" . "https://elpa.gnu.org/devel/")
 ))
(package-initialize)

(setq use-package-always-ensure t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

(use-package goto-chg)
(use-package evil
	     :after goto-chg
	     :init
	     (setq evil-undo-system 'undo-red
	     (setq evil-want-integration t)
	     (setq evil-want-keybinding nil)
	     (setq evil-overriding-maps nil)
	     :config
	     (evil-mode 1))
(use-package evil-collection
	     :after evil
	     :config
	     (evil-collection-init))

(use-package org
	     :mode (("\\.org$" . org-mode))
	     :config)

(use-package magit)

(use-package htmlize)
(use-package ox-reveal
	     :after htmlize
	     :config
	     (setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js"))
