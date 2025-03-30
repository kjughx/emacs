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
  :init
  (setq evil-want-C-u-scroll t)
  :diminish evil-collection-unimpaired-mode
  :config
  (evil-collection-init))

(use-package evil-mc
  :ensure t
  :diminish
  :ensure t
  :config
  (global-evil-mc-mode 1))

(provide 'evil)
;;; lsp.el ends here
