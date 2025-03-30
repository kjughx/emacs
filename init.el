(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(global-display-line-numbers-mode 1)

(set-face-attribute 'default nil :font "Fira Code" :height 160)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(load "~/.config/emacs/evil.el")
(load "~/.config/emacs/packages.el")
(load "~/.config/emacs/bindings.el")
(load "~/.config/emacs/lsp.el")

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
   '(company crm-custom diminish evil-collection evil-leader evil-mc
	     flycheck gruber-darker-theme ido-completing-read+
	     ido-vertical-mode magit move-text rust-mode)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-space ((t (:foreground "#5a5a5a")))))
