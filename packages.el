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

(use-package ido-vertical-mode
  :ensure t
  :config
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only))

(use-package crm-custom
  :ensure t
  :config
  (crm-custom-mode))

(use-package rust-mode
  :ensure t
  :diminish
  :config
    (autoload 'rust-mode "rust-mode" nil t)
    (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode)))

(use-package whitespace
  :ensure t
  :diminish
  :hook (prog-mode . whitespace-mode)
  :config
  (setq whitespace-style '(face spaces space-mark tab-mark tabs))
  (setq whitespace-space-regexp "\\(\x20\\)"))

(use-package magit
  :ensure t
  :diminish)

(provide 'pj/packages)
;;; packages.el ends here
