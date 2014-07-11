(provide 'erlconf)
;;; Erlang
(add-to-list 'load-path "/usr/lib/erlang/lib/tools-2.6.8/emacs")
(require 'erlang-start)

;; EDTS
(add-to-list 'load-path "~/.emacs.d/edts")
(require 'edts-start)

;; Distel
; (require 'distel)
; (distel-setup)

;; Wrangler
; (add-to-list 'load-path
;         "/usr/local/lib/erlang/lib/wrangler-1.1.01/elisp")
; (require 'wrangler)

;; highlight tabs in erlang
(defun highlight-tabs ()
  "Highlight tab characters."
  (font-lock-add-keywords
   nil '(("\\(\t+\\)" 1 '(:background "#333333") t))))

(add-hook 'erlang-mode-hook 'highlight-tabs)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
