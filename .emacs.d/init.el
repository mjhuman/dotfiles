;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(setq package-enable-at-startup nil)

; add MELPA to repository list
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                             ("melpa" . "https://melpa.org/packages/")                        
                             ("org" . "https://orgmode.org/elpa/")))

(setq package-user-dir "/ssd2/dotfiles/.emacs.d/packages")

; initialize package.el
(package-initialize)


; start package.el with emacs
;(require 'package)
;(setq package-enable-at-startup nil)

; add MELPA to repository list
;(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;                         ("melpa" . "https://melpa.org/packages/")))

; initialize package.el
;(package-initialize)

;; Bootstrap `use-package'
;(unless (package-installed-p 'use-package)
;	(package-refresh-contents)
;	(package-install 'use-package))

;(set-default-coding-systems 'utf-8)
;(prefer-coding-system 'utf-8)

;;(add-to-list 'load-path "~/.emacs.d/lisp")
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(org-babel-load-file (expand-file-name "~/house/orgfiles/mlinit.org"))
