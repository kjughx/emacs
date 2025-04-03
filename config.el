(require 'package)
(setq package-archives
  '(("melpa" . "https://melpa.org/packages/")
    ("gnu" . "https://elpa.gnu.org/packages/")
    ("nongnu" . "https://elpa.nongnu.org/nongnu/")))
(package-initialize)

(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

(require 'use-package)
(use-package diminish :ensure t)

(defvar evil-want-keybinding nil)
  (defvar evil-want-C-u-scroll t)
  (defvar evil-want-integration t)

  (use-package evil
    :init
    (setq evil-vsplit-window-right t)
    (setq evil-split-window-below t)
    :config
    (evil-set-undo-system 'undo-redo)
    (evil-mode))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

(use-package general
  :ensure t
  :config
  (general-evil-setup)
  (general-create-definer pj/leader-keys
    :states '(normal insert visual emacs)

    :keymaps 'override
    :prefix "SPC"
    :global-prefix "M-SPC")
  (pj/leader-keys
    "b" '(:ignore t :wk "buffer")
    "bb" '(switch-to-buffer :wk "Switch buffer")
    "bk" '(kill-this-buffer :wk "Kill buffer")
    "bn" '(next-buffer :wk "Buffer next")
    "bp" '(previous-buffer :wk "Buffer previous")
    "br" '(revert-buffer :wk "Buffer reload"))
  
  (pj/leader-keys
    "cc" '(:ignore t :wk "compile")
    "cn" '(next-error :wk "Next compilation error")
    "cp" '(previous-error :wk "Previous compilation error"))

  (pj/leader-keys
    "d" '(:ignore t :wk "dired")
    "dd" '(dired :wk "Open dired"))

  (pj/leader-keys
    "g" '(:ignore: t :wk "magit")
    "gg" '(magit :wk "Open magit"))

  (pj/leader-keys
    "f" '(:ignore t :wk "file")
    "ff" '(find-file :wk "Find file")
    "fc" '((lambda () (interactive) (find-file "~/.config/emacs/config.org")) :wk "Open config.org"))

  (pj/leader-keys
    "e" '(:ignore t :wk "evaluate")
    "eb" '(eval-buffer :wk "Evaluate buffer")
    "ed" '(eval-defun :wk "Evaluate defun")
    "ee" '(eval-expression :wk "Evaluate expression")
    "er" '(eval-region :wk "Evaluate region"))

  (pj/leader-keys
    "h" '(:ignore t :wk "help")
    "hf" '(describe-function :wk "Help function")
    "hv" '(describe-variable :wk "Help variable"))

  (pj/leader-keys
    "v" '(:ignore t :wk "vterm")
    "vv" '(multi-vterm :wk "Open vterm")
    "vn" '(multi-vterm-next :wk "Next vterm")
    "vp" '(multi-vterm-prev :wk "Previous vterm"))

  (pj/leader-keys
    "s" '(:ignore t :wk "split")
    "ss" '(split-window-right :wk "Split window vertically"))

  (pj/leader-keys
    "q"  '(evil-window-delete :wk "Quit window")
    "w"  '(save-buffer :wk "Save buffer")
    "/"  '(comment-line :wk "Comment line/region"))

  (pj/leader-keys
    "m" '(:ignore t :wk "multiple-cursors")
    "mm" '(mc/edit-lines :wk "Mark at selection")
    "mn" '(mc/mark-next-like-this :wk "Mark next like this")
    "mp" '(mc/mark-previous-like-this :wk "Mark prev like this")
    "ma" '(mc/mark-all-like-this :wk "Mark all like this"))
)

(use-package move-text
  :ensure t
  :config
  (evil-define-key 'normal 'global (kbd "C-j") #'move-text-line-down)
  (evil-define-key 'normal 'global (kbd "C-k") #'move-text-line-up))

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

(define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up)

(set-face-attribute 'default nil
  :font "FiraCode Nerd Font"
  :height 180)

;; Uncomment the following line if line spacing needs adjusting.
(setq-default line-spacing 0.12)

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

(setq inhibit-startup-screen t)      ;; no splash screen
(menu-bar-mode 0)                    ;; ew menu bar
(tool-bar-mode 0)                    ;; ew tool bar
(scroll-bar-mode 0)                  ;; ew scroll bar
(column-number-mode 1)               ;; so we can see the column
(global-display-line-numbers-mode 1) ;; line numbers are useful
(show-paren-mode 1)                  ;; on by default but still

(use-package toc-org
  :ensure t
  :commands toc-org-enable
  :init (add-hook 'org-mode-hook 'toc-org-enable))

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets :ensure t)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(electric-indent-mode -1)

(use-package sudo-edit
  :ensure t
  :config
    (pj/leader-keys
      "fu" '(sudo-edit-find-file :wk "Sudo find file")
      "fU" '(sudo-edit :wk "Sudo edit file")))

(use-package rainbow-mode
  :ensure t
  :diminish
  :hook 
  ((org-mode prog-mode) . rainbow-mode))

(use-package which-key
  :ensure t
  :init
    (which-key-mode 1)
  :config
  (setq which-key-side-window-location 'right
	  which-key-sort-order #'which-key-key-order-alpha
	  which-key-sort-uppercase-first nil
	  which-key-add-column-padding 1
	  which-key-max-display-columns nil
	  which-key-min-display-lines 6
	  which-key-side-window-slot -10
	  which-key-side-window-max-height 0.25
	  which-key-idle-delay 0.2
	  which-key-max-description-length 40
	  which-key-allow-imprecise-window-fit t
	  which-key-separator " → " ))

(use-package vterm
  :ensure t
  :config
  (setq shell-file-name "/bin/fish"
        vterm-max-scrollback 5000))
(use-package multi-vterm
  :ensure t)

(use-package gruber-darker-theme
  :ensure t)
(custom-set-faces
  '(org-block ((t (:background "#181818" :foreground "#e4e4ef")))))

(use-package whitespace
  :ensure t
  :diminish
  :hook ((org-mode prog-mode) . whitespace-mode)
  :config
  (setq whitespace-style '(face spaces space-mark tab-mark tabs))
  (setq whitespace-space-regexp "\\(\x20\\)"))

(use-package magit
:ensure t
:diminish)

(use-package ido
  :ensure t
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (setq ido-enable-flex-matching t)
  (setq-default confirm-nonexistent-file-or-buffer nil)
  (setq ido-use-filename-at-point 'guess))

(use-package ido-completing-read+
  :ensure t
  :after ido
  :config
  (ido-ubiquitous-mode 1))

(use-package ido-vertical-mode
  :ensure t
  :config
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))

(use-package multiple-cursors
  :ensure t)
