(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))

(setq package-enable-at-startup nil)

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq make-backup-files nil)
(menu-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode t)
(setq custom-safe-themes t)
(setq-default indent-tabs-mode nil)

;; Set backups to go to specific directory and turn them off
(setq backup-directory-alist '("." . "~/.emacs.d/saves"))
(setq make-backup-files nil)

;; Bullshit custom bullshit
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(use-package evil
  :ensure t
  :config
  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-leader ",")
    (evil-leader/set-key
      "," 'evil-switch-to-windows-last-buffer
      "b" 'helm-mini
      "g" 'magit-status
    ))
  (evil-set-initial-state 'magit-diff-mode 'normal) 
  ;;(add-to-list 'evil-normal-state-modes '(magit-diff-mode))
    (evil-mode t))

(use-package helm
  :ensure t
  :config
  (helm-mode t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-autoresize-mode t))

;; themes
(use-package color-theme-sanityinc-tomorrow :ensure t)
(use-package zenburn-theme :ensure t)
(use-package cyberpunk-theme :ensure t)
(use-package gruvbox-theme :ensure t)

(load-theme 'sanityinc-tomorrow-eighties)

(setq linum-format "%d ")
(global-linum-mode t)
(global-hl-line-mode t)

(use-package powerline
  :ensure t
  :config
  (powerline-evil-center-color-theme))
(use-package powerline-evil
  :ensure t)

(use-package org
  :ensure t
  :config
  (add-hook 'org-mode-hook
            (evil-define-key 'normal org-mode-map (kbd "TAB") 'org-cycle))
  (add-hook 'org-agenda-mode-hook
          (lambda ()
            (define-key org-agenda-mode-map "j" 'org-agenda-next-item)
            (define-key org-agenda-mode-map "k" `org-agenda-previous-item)))
  (setq org-default-notes-file "~/Dropbox/org/todo.org")
  (setq org-directory "~/Dropbox/org")
  (setq org-agenda-files '("~/Dropbox/org")))

(use-package org-evil
  :ensure t)

(use-package magit
  :ensure t
  :defer t)
;; Make tab work right in asm-mode
(defun my-asm-mode-hook ()
  ;; you can use `comment-dwim' (M-;) for this kind of behaviour anyway
  (local-unset-key (vector asm-comment-char))
  ;; asm-mode sets it locally to nil, to "stay closer to the old TAB behaviour".
  (setq tab-always-indent (default-value 'tab-always-indent)))
(add-hook 'asm-mode-hook #'my-asm-mode-hook)
