;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(setq package-enable-at-startup nil)

; add MELPA to repository list
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                             ("melpa" . "https://melpa.org/packages/")                        
                             ("org" . "https://orgmode.org/elpa/")))



; initialize package.el
(package-initialize)



(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
;(org-babel-load-file (expand-file-name "~/.emacs.d/personal.org"))
