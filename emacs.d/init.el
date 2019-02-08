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
(setq-default tab-width 4)
(column-number-mode t)

(setq tramp-default-method "ssh")

;; Set backups to go to specific directory and turn them off
(setq backup-directory-alist '("." . "~/.emacs.d/saves"))
(setq make-backup-files nil)

;; Bullshit custom bullshit
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; evil mode!!!
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
      "x" 'helm-M-x
      "o" 'delete-other-windows
      "t" 'helm-projectile
      "a" 'org-agenda
      "c" 'org-capture
      "s" 'ag-project
      "S" 'ag-project-regexp
      "$" 'toggle-truncate-lines
      "l" 'open-morgan-log))
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))
  (evil-define-key 'normal global-map (kbd "C-S-p") 'helm-projectile-switch-project)
  (evil-define-key 'normal global-map (kbd "C-z") 'eshell)
  (evil-set-initial-state 'magit-diff-mode 'normal)
  (evil-set-initial-state 'ess-r-help-mode 'normal)
  (evil-mode t))

(use-package helm
  :ensure t
  :config
  (helm-mode t)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-autoresize-mode t))

;; This is auto-complete
(use-package company
  :ensure t
  :init
  (global-company-mode)
  :config
  (setq company-idle-delay 0.2)
  (define-key company-active-map [tab] 'company-complete)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

;; Project mode - project level command-t replacement
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t)
  (setq projectile-globally-ignored-directories (append '("target" "node_modules") projectile-globally-ignored-directories))
  (setq projectile-globally-ignored-file-suffixes (append '("pyc") projectile-globally-ignored-file-suffixes)))

(use-package helm-projectile
  :ensure t)

(use-package ag
  :ensure t
  :config
  (setq ag-executable "/usr/local/bin/ag")
  (setq ag-highlight-search t)
  (setq ag-reuse-window t)
  (setq ag-reuse-buffers t))

;; themes
(use-package color-theme-sanityinc-tomorrow :ensure t)
(use-package zenburn-theme :ensure t)
(use-package cyberpunk-theme :ensure t)
(use-package gruvbox-theme :ensure t)
(use-package solarized-theme :ensure t)

(load-theme 'solarized-dark)

(setq linum-format "%d ")
(global-linum-mode t)
(global-hl-line-mode t)

(use-package powerline-evil
  :ensure t)

(use-package org
  :ensure t
  :config
  (add-hook 'org-mode-hook
            (lambda ()
            (evil-define-key 'normal org-mode-map (kbd "TAB") 'org-cycle)))
  (add-hook 'org-agenda-mode-hook
          (lambda ()
            (setq org-habit-graph-column 50)
            (define-key org-agenda-mode-map "j" 'org-agenda-next-item)
            (define-key org-agenda-mode-map "k" `org-agenda-previous-item)))
  (setq org-capture-templates
    '(("a" "My TODO task format." entry
        (file "todo.org")
        "* TODO %?"
        :empty-lines 1)
      ("m" "Meeting" entry
       (file "meetings.org")
       "* MEETING with %? :MEETING:\n%t")))
  (setq org-agenda-text-search-extra-files '(agenda-archives))
  (setq org-default-notes-file "~/Dropbox/org/todo.org")
  (setq org-directory "~/Dropbox/org")
  (setq org-default-notes-file "~/Dropbox/org/todo.org")
  (setq org-agenda-files '("~/Dropbox/org/"))
  (setq org-log-done 'time)
  (setq org-todo-keywords
        '((sequence "TODO" "IN PROGRESS" "WAITING" "|" "DONE" "CANCELED")
          (sequence "MEETING")))
  (setq org-modules
        '(org-habit)))

(use-package org-evil
  :ensure t)

(use-package magit
  :ensure t
  :defer t)

(use-package highlight-symbol
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

;; Set up font
(add-hook 'window-setup-hook
          (lambda ()
            (add-to-list 'default-frame-alist '(font . "Hack"))
            (set-face-attribute 'default nil :font "Hack")
            (set-face-attribute 'default nil :height 100)
            (define-key global-map (kbd "<s-return>") 'toggle-frame-fullscreen)))

;; Taken from aaron bieber's dotfiles; really need to change the colors
(defface my-pl-segment1-active
  '((t (:foreground "#000000" :background "#E1B61A")))
  "Powerline first segment active face.")
(defface my-pl-segment1-inactive
  '((t (:foreground "#CEBFF3" :background "#3A2E58")))
  "Powerline first segment inactive face.")
(defface my-pl-segment2-active
  '((t (:foreground "#F5E39F" :background "#8A7119")))
  "Powerline second segment active face.")
(defface my-pl-segment2-inactive
  '((t (:foreground "#CEBFF3" :background "#3A2E58")))
  "Powerline second segment inactive face.")
(defface my-pl-segment3-active
  '((t (:foreground "#CEBFF3" :background "#3A2E58")))
  "Powerline third segment active face.")
(defface my-pl-segment3-inactive
  '((t (:foreground "#CEBFF3" :background "#3A2E58")))
  "Powerline third segment inactive face.")
(use-package powerline
  :ensure t
  :config
  ;;(powerline-evil-center-color-theme))
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (seg1 (if active 'my-pl-segment1-active 'my-pl-segment1-inactive))
                          (seg2 (if active 'my-pl-segment2-active 'my-pl-segment2-inactive))
                          (seg3 (if active 'my-pl-segment3-active 'my-pl-segment3-inactive))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           (powerline-current-separator)
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (let ((evil-face (powerline-evil-face)))
                                       (if evil-mode
                                           (powerline-raw (powerline-evil-tag) evil-face)
                                         ))
                                     (if evil-mode
                                         (funcall separator-left (powerline-evil-face) seg1))
                                     (powerline-buffer-id seg1 'l)
                                     (powerline-raw "[%*]" seg1 'l)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format seg1 'l))
                                     (powerline-raw " " seg1)
                                     (funcall separator-left seg1 seg2)
                                     (when (boundp 'erc-modified-channels-object)
                                       (powerline-raw erc-modified-channels-object seg2 'l))
                                     (powerline-major-mode seg2 'l)
                                     (powerline-process seg2)
                                     (powerline-minor-modes seg2 'l)
                                     (powerline-narrow seg2 'l)
                                     (powerline-raw " " seg2)
                                     (funcall separator-left seg2 seg3)
                                     (powerline-vc seg3 'r)
                                     (when (bound-and-true-p nyan-mode)
                                       (powerline-raw (list (nyan-create)) seg3 'l))))
                          (rhs (list (powerline-raw global-mode-string seg3 'r)
                                     (funcall separator-right seg3 seg2)
                                     (unless window-system
                                       (powerline-raw (char-to-string #xe0a1) seg2 'l))
                                     (powerline-raw "%4l" seg2 'l)
                                     (powerline-raw ":" seg2 'l)
                                     (powerline-raw "%3c" seg2 'r)
                                     (funcall separator-right seg2 seg1)
                                     (powerline-raw " " seg1)
                                     (powerline-raw "%6p" seg1 'r)
                                     (when powerline-display-hud
                                       (powerline-hud seg1 seg3)))))
                     (concat (powerline-render lhs)
                             (powerline-fill seg3 (powerline-width rhs))
                             (powerline-render rhs)))))))

;; Make tab work right in asm-mode
(defun my-asm-mode-hook ()
  ;; you can use `comment-dwim' (M-;) for this kind of behaviour anyway
  (local-unset-key (vector asm-comment-char))
  ;; asm-mode sets it locally to nil, to "stay closer to the old TAB behaviour".
  (setq tab-always-indent (default-value 'tab-always-indent)))
(add-hook 'asm-mode-hook #'my-asm-mode-hook)

(use-package rust-mode
  :ensure t)

(use-package go-mode
  :ensure t)

(use-package markdown-mode
  :ensure t
  :config
  (setq markdown-command "pandoc --from markdown_github --to html"))

(use-package ess
  :ensure t
  :config
  (setq flycheck-lintr-linters "with_defaults(line_length_linter(120))"))

(use-package dockerfile-mode
  :ensure t)

;; Python stuff
(use-package virtualenvwrapper
  :ensure t
  :config
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell)
  (setq projectile-switch-project-action
      '(lambda ()
         (venv-projectile-auto-workon)
         (projectile-find-file))))

;; Custom functions for work
(defun open-morgan-log (log-number)
  "Prompt user for log # to open."
  (interactive "sEnter log id number: ")
  (find-file (concat "/login01.cluster.haib.org:/gpfs/gpfs1/myerslab/data/Analysis/logs/" log-number ".main.log")))

