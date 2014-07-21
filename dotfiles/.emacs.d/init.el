;;; Startup

(add-to-list 'load-path "~/.emacs.d/local")

(require 'base)
(require 'pretty)
(require 'erlconf)

(add-to-list 'load-path "~/.emacs.d/helm")
(require 'helm-config)
(helm-mode 1)
;; (server-start)
(require 'iso-transl)
(add-to-list 'load-path "~/.emacs.d/elpa/nyan-mode-20120710.2200/")
(require 'nyan-mode)
(nyan-mode 1)

;;; package archives
(setq package-archives '(("elpa"        . "http://tromey.com/elpa/")
                         ("technomancy" . "http://repo.technomancy.us/emacs/")
                         ("melpa"       . "http://melpa.milkbox.net/packages/")
                         ("marmalade"   . "http://marmalade-repo.org/packages/")
                         ("gnu"         . "http://elpa.gnu.org/packages/")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tronesque)))
 '(custom-safe-themes (quote ("65ae93029a583d69a3781b26044601e85e2d32be8f525988e196ba2cb644ce6a" "ee6081af57dd389d9c94be45d49cf75d7d737c4a78970325165c7d8cb6eb9e34" "f0a99f53cbf7b004ba0c1760aa14fd70f2eabafe4e62a2b3cf5cabae8203113b" default)))
 '(fci-rule-color "#383838"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
