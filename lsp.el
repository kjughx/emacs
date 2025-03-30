(require 'eglot)
(add-hook 'prog-mode-hook 'eglot-ensure)
(setq eldoc-echo-area-use-multiline-p t)
(use-package company
  :ensure t
  :diminish
  :hook (prog-mode . company-mode))
(setq eglot-stay-out-of '(flymake))
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
(evil-leader/set-key "lR" 'eglot-rename)
(evil-leader/set-key "la" 'eglot-code-actions)
(evil-leader/set-key "lf" 'eglot-format-buffer)
(evil-leader/set-key "lq" 'flycheck-list-errors)
(define-key evil-motion-state-map (kbd "]q") 'flycheck-next-error)
(define-key evil-motion-state-map (kbd "[q") 'flycheck-previous-error)

(provide 'lsp)
;;; lsp.el ends here
