;;Configuração do Emacs
;;Realce de sintaxe
;;(setq font-lock-mode t)
;;Adicionar gruber-darker-theme
;;Adicionar csharp-mode

;;Tab config
(setq-default tab-width 2)

;; Remove welcome message
(setq inhibit-startup-message t)

;; Remove menus
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
;;Retirei as configs pois uso o emacs terminal 

;;Números das linhas
(global-linum-mode t )

;;Font size
(set-face-attribute 'default nil :height 150)
;;Font type
(set-frame-font "Iosevka 15" nil t)


;;Packages
(require 'package)
(setq package-enable-at-startup nil) ;ativação automática dasbilitada

;MELPA - repository
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize);inicia pacotes

(unless (package-installed-p ''use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;Auto complete
;;(use-package auto-complete
  ;;:ensure t
  ;;:init
  ;;(progn
    ;;(ac-config-default)
    ;;(global-auto-complete-mode t)))

;;neoTree
(use-package neotree
  :ensure t
  :bind (("C-\\". 'neotree-toggle)))

;;Atalhos personalizados
(global-set-key (kbd "C-<tab>") 'other-window);Window navgate
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)

;;Melpa stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
	 '("bddf21b7face8adffc42c32a8223c3cc83b5c1bbd4ce49a5743ce528ca4da2b6" default))
 '(package-selected-packages
	 '(lsp-mode flycheck csharp-mode gruber-darker-theme almost-mono-theme almost-mono-themes use-package))
 '(warning-suppress-log-types '((use-package) (comp) (use-package) (use-package)))
 '(warning-suppress-types '((comp) (use-package) (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;Omnisharp
(use-package omnisharp
	:after company
	:config
	(add-hook 'csharp-mode 'omnisharp-mode)
	(add-to-list 'company-backends 'company-omnisharp))

(define-key omnisharp-mode (kbd ".") 'omnisharp-add-dot-and-auto-complete)
(define-key omnisharp-mode (kbd "<C-SPC>") 'omnisharp-auto-complete)

;;(add-hook 'csharp-mode-hook 'flycheck-mode)
(add-hook 'prog-mode-hook 'flycheck-mode)

(use-package projectile
	:config
	(projectile-mode))
