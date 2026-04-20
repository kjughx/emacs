(require 'org)

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
   '("d5fd482fcb0fe42e849caba275a01d4925e422963d1cd165565b31d3f4189c87"
     "5a0ddbd75929d24f5ef34944d78789c6c3421aa943c15218bac791c199fc897d"
     "8363207a952efb78e917230f5a4d3326b2916c63237c1f61d7e5fe07def8d378"
     "75b371fce3c9e6b1482ba10c883e2fb813f2cc1c88be0b8a1099773eb78a7176"
     "51fa6edfd6c8a4defc2681e4c438caf24908854c12ea12a1fbfd4d055a9647a3"
     "e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7"
     "01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     default))
 '(diff-hl-show-hunk-inline-popup-hide-hunk t)
 '(diff-hl-show-hunk-inline-popup-smart-lines nil t)
 '(gerrit-results-limit 1024)
 '(grep-command "rg --vimgrep ")
 '(ignored-local-variable-values
   '((etags-regen-ignores "test/manual/etags/")
     (etags-regen-regexp-alist
      (("c" "objc") "/[ \11]*DEFVAR_[A-Z_ \11(]+\"\\([^\"]+\\)\"/\\1/"
       "/[ \11]*DEFVAR_[A-Z_ \11(]+\"[^\"]+\",[ \11]\\([A-Za-z0-9_]+\\)/\\1/"))))
 '(lua-indent-level 2)
 '(magit-diff-refine-hunk 'all)
 '(package-selected-packages
   '(company crm-custom diminish dts-mode eshell-syntax-highlighting
             evil-anzu evil-collection evil-leader evil-mc evil-mu4e
             fish-mode flycheck general git-gutter go-mode
             gruber-darker-theme gruvbox-theme lsp-mode lsp-ui
             lua-mode magit meson-mode move-text multi-vterm
             multiple-cursors nix-mode org-bullets rainbow-mode
             rust-mode smex sudo-edit toc-org)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#181818" :foreground "#e4e4ef" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight medium :height 132 :width normal :foundry "UKWN" :family "Iosevka"))))
 '(ansi-color-blue ((t (:foreground "#076678"))))
 '(ansi-color-bright-blue ((t (:foreground "#076678"))))
 '(blue ((t (:foreground "#076678"))))
 '(diff-hl-change ((t (:background "#333355"))))
 '(diff-hl-delete ((t (:background "#553333"))))
 '(diff-hl-insert ((t (:background "#335533"))))
 '(org-block ((t (:background "#181818" :foreground "#e4e4ef")))))
