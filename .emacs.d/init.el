;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(setq package-enable-at-startup nil)

; add MELPA to repository list
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                             ("melpa" . "https://melpa.org/packages/")                        
                             ("org" . "https://orgmode.org/elpa/")))

;;(setq package-user-dir "/ssd2/dotfiles/.emacs.d/packages")

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
(org-babel-load-file (expand-file-name "~/.emacs.d/personal.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(excorporate-configuration (quote ("" . "")))
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/Dropbox/orgfiles")
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-journal-file-type (quote monthly) t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (deft org-plus-contrib org-journal-list org-journal excorporate fountain-mode mw-thesaurus yasnippet-snippets which-key web-mode virtualenvwrapper use-package undo-tree tern-auto-complete synosaurus spacemacs-theme solarized-theme smex smartparens shell-switcher peep-dired paradox ox-reveal origami org-gcal org-bullets org-ac moe-theme magit irony-eldoc iedit hungry-delete htmlize hideshow-org ggtags flycheck-irony expand-region epresent engine-mode elpy elfeed-org elfeed-goodies edit-server dired-quick-sort dired+ diminish default-text-scale counsel-projectile company-irony-c-headers company-irony beacon base16-theme ace-window)))
 '(paradox-github-token t)
 '(safe-local-variable-values
   (quote
    ((eval add-hook
	   (quote before-save-hook)
	   (quote time-stamp))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
 '(org-journal-calendar-entry-face ((t (:foreground "yellow" :slant italic))))
 '(org-journal-calendar-scheduled-face ((t (:foreground "green" :slant normal)))))



