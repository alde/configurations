(provide 'base)
;; no startup message
(setq inhibit-startup-message t)
;; text-mode as default major mode
(setq default-major-mode 'text-mode)

;; To tab or not to tab, that is the question
(setq-default indent-tabs-mode nil)

;; Cursor
(blink-cursor-mode 1)

;; line numbers
(global-linum-mode)

;; display position
(column-number-mode t)
(line-number-mode t)

;; display time and date
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time-mode t)

;; indicate empty lines
(setq indicate-empty-lines t)

;; highlight current line
(global-hl-line-mode t)

;; show trailing whitespace
(setq-default show-trailing-whitespace t)

;; show matching parens
(setq show-paren-delay 0.0)
(setq show-paren-style 'mixed)
(show-paren-mode t)

;; whitespace mode
(setq-default whitespace-style '(tabs trailing lines tab-mark))
(setq whitespace-line-column 78)
(global-whitespace-mode 1)

;; moving cursor down at bottom scrolls a couple of lines, not half page
(setq-default scroll-step 1)
(setq-default scroll-conservatively 100000)
(setq-default scroll-margin 5)
(setq-default scroll-preserve-screen-position t)
(setq scroll-up-aggressively 0.01)
(setq scroll-down-aggressively 0.01)

;; use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-kill-emacs 'y-or-n-p)

;; delete selection with text insertion
(delete-selection-mode t)

;; pick up changes to files on disk automatically (ie, after git pull)
(global-auto-revert-mode t)
