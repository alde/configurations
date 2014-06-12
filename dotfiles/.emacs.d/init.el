;;; Startup

(add-to-list 'load-path "~/.emacs.d/local")

(require 'base)
(require 'pretty)
(require 'erlconf)

(add-to-list 'load-path "~/git/external/helm")
(require 'helm-config)
(helm-mode 1)

;;; package archives
(setq package-archives '(("elpa"        . "http://tromey.com/elpa/")
                         ("technomancy" . "http://repo.technomancy.us/emacs/")
                         ("melpa"       . "http://melpa.milkbox.net/packages/")
                         ("marmalade"   . "http://marmalade-repo.org/packages/")
                         ("gnu"         . "http://elpa.gnu.org/packages/")))
