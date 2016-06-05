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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (powerline-evil powerline use-package))))

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
    ))
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
;; Make tab work right in asm-mode
(defun my-asm-mode-hook ()
  ;; you can use `comment-dwim' (M-;) for this kind of behaviour anyway
  (local-unset-key (vector asm-comment-char))
  ;; asm-mode sets it locally to nil, to "stay closer to the old TAB behaviour".
  (setq tab-always-indent (default-value 'tab-always-indent)))

(add-hook 'asm-mode-hook #'my-asm-mode-hook)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
