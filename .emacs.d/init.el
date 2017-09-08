
(add-to-list 'load-path "~/.emacs.d/lisp")

;; INSTALL PACKAGES
;; --------------------------------------

; start package.el with emacs
(require 'package)
(setq package-enable-at-startup nil)

; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

; initialize package.el
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))


