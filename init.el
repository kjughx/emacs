(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("gnu" . "https://elpa.gnu.org/packages/")
	("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(global-display-line-numbers-mode 1)

(set-face-attribute 'default nil :font "Fira Code" :height 160)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(require 'use-package)

(use-package gruber-darker-theme
  :ensure t)

(use-package ido
  :ensure t
  :config
  (ido-mode 1)
  (ido-everywhere 1))

(use-package ido-completing-read+
  :ensure t
  :after ido
  :config
  (ido-ubiquitous-mode 1))

(use-package crm-custom
  :ensure t
  :config
  (crm-custom-mode))

(use-package smex
  :ensure t
  :config
    (global-set-key (kbd "M-x") 'smex)
    (global-set-key (kbd "M-X") 'smex-major-mode-commands)
    (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
    )

(use-package company
  :ensure t
  :hook (lsp-mode . company-mode)
  :config
  (setq company-idle-delay 0.2
	company-minimum-prefix-length 2)
  (company-mode))

(use-package lsp-mode
  :ensure t
  :hook ((prog-mode . lsp))
  :commands lsp
  :config
  (setq lsp-warn-no-matched-clients nil))

(use-package whitespace
  :ensure t
  :diminish
  :hook (prog-mode . whitespace-mode)
  :config
  (setq whitespace-style '(face spaces space-mark tab-mark tabs))
  (setq whitespace-space-regexp "\\(\x20\\)")
  (setq whitespace-space-mark '("·" . "·"))
  (setq whitespace-tab-mark '("» " . "» ")))

(use-package magit
  :ensure t
  :diminish)

;; All evil-* packages need this
(defvar evil-want-keybinding nil)
(defvar evil-want-C-u-scroll t)
(defvar evil-want-integration t)

;; This loads evil too
(use-package evil-leader
  :ensure t
  :init
    (setq-default evil-leader/leader "<SPC>")
  :config
    (evil-leader-mode 1)
    (global-evil-leader-mode)
    (evil-mode))

(use-package evil-collection
  :ensure t
  :diminish
  :config
  (evil-collection-init))

(use-package evil-mc
  :ensure t
  :diminish
  :ensure t
  :config
  (global-evil-mc-mode 1))

;; Bindings using the leader key
(evil-leader/set-key "f" 'find-file)
(evil-leader/set-key "b" 'switch-to-buffer)
(evil-leader/set-key "w" 'save-buffer)
(evil-leader/set-key "q" 'evil-quit)
(evil-leader/set-key "d" 'dired)
(evil-leader/set-key "gg" 'magit)
(evil-leader/set-key "cc" 'compile)
(evil-leader/set-key "cn" 'next-error)
(evil-leader/set-key "cp" 'previous-error)
(evil-leader/set-key "/" 'comment-line)

(define-key evil-visual-state-map (kbd "<") (lambda ()
						(interactive)
						(call-interactively 'evil-shift-left)
						(evil-normal-state)
						(evil-visual-restore)))
(define-key evil-visual-state-map (kbd ">") (lambda ()
						(interactive)
						(call-interactively 'evil-shift-right)
						(evil-normal-state)
						(evil-visual-restore)))

(use-package move-text
  :ensure t
  :config
  (evil-define-key 'normal 'global (kbd "C-j") #'move-text-line-down)
  (evil-define-key 'normal 'global (kbd "C-k") #'move-text-line-up))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     default))
 '(package-selected-packages
   '(company crm-custom evil-collection evil-leader evil-mc
	     gruber-darker-theme ido-completing-read+ lsp-mode magit
	     move-text smex)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-space ((t (:foreground "#5a5a5a")))))
