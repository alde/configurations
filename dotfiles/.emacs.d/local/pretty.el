(provide 'pretty)

;; fonts
(set-default-font "Source Code Pro 10")

;; color themes
(add-to-list 'load-path "~/.emacs.d/colors")

;; not sure this one is needed
(set-face-foreground 'minibuffer-prompt "#66D9EF")

;; always turn off tool-bar
(add-hook 'before-make-frame-hook (tool-bar-mode -1))
;; always turn off scroll-bar
(add-hook 'before-make-frame-hook (scroll-bar-mode -1))

(add-to-list 'load-path "~/.emacs.d/elpa/rainbow-delimiters-1.3.4")
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

