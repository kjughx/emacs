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
 '(custom-safe-themes
   '("e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-hl-change ((t (:background "#333355"))))
 '(diff-hl-delete ((t (:background "#553333"))))
 '(diff-hl-insert ((t (:background "#335533"))))
 '(org-block ((t (:background "#181818" :foreground "#e4e4ef")))))
