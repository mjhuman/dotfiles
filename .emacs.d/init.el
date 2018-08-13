;; INSTALL PACKAGES
;; --------------------------------------

; start package.el with emacs
(require 'package)
(setq package-enable-at-startup nil)

; add MELPA to repository list
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

; initialize package.el
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;;(setq skip-sbtools-p4-extensions t) ;; uncomment to prevent perforce from slowing down emacs
(load-file "//mathworks/hub/share/sbtools/emacs_setup.el")

;;(add-to-list 'load-path "~/.emacs.d/lisp")
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
;;(org-babel-load-file (expand-file-name "~/.emacs.d/personal.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ff-always-in-other-window t)
 '(gdb-non-stop-setting nil t)
 '(git-commit-summary-max-length 100)
 '(message-fill-column 100)
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/Dropbox/orgfiles")
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (hideshow-org zenburn-theme yasnippet-snippets which-key web-mode virtualenvwrapper use-package undo-tree try tern-auto-complete synosaurus spacemacs-theme solarized-theme smex smartparens shell-switcher popup-complete peep-dired paradox ox-reveal ox-pandoc origami org-onenote org-gcal org-bullets org-ac nodejs-repl mw-thesaurus moe-theme mediawiki magit js2-refactor jedi iedit hungry-delete htmlize google-c-style ggtags flycheck expand-region excorporate epresent engine-mode elpy elfeed-org elfeed-goodies edit-server-htmlize dumb-jump dracula-theme dired-quick-sort dired+ diminish default-text-scale counsel-projectile confluence company-irony color-theme-solarized color-theme-sanityinc-solarized beacon base16-theme auto-complete-sage atomic-chrome ace-window ac-rtags ac-js2 ac-etags ac-cider ac-c-headers)))
 '(paradox-github-token t)
 '(rtags-error-message-function (quote sb-rtags-error-message-function)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
 '(woman-unknown ((t (:inherit font-lock-warning-face :foreground "red4")))))
