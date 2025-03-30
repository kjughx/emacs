;; Can't get evil-want-C-u-scroll to work
(define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up)

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

(provide 'pj/bindings)
