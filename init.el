(org-babel-load-file
 (expand-file-name
  "config.org"
  "~/.config/emacs"))
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
   '(company crm-custom diminish eshell-syntax-highlighting
	     evil-collection evil-leader evil-mc flycheck general
	     git-gutter gruber-darker-theme ido-completing-read+
	     ido-vertical-mode lsp-mode magit move-text multi-vterm
	     multiple-cursors org-bullets rainbow-mode rust-mode smex
	     sudo-edit toc-org)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-block ((t (:background "#181818" :foreground "#e4e4ef")))))
