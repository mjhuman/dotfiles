;; INSTALL PACKAGES
;; --------------------------------------

;/ (require 'package)

;/ (setq package-enable-at-startup nil)

; add MELPA to repository list

;; initialize package.el

(require 'package)

;; add MELPA to repository list
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                           ("melpa" . "https://melpa.org/packages/")))

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))


;;(package-install 'org-contrib)

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(conda-anaconda-home "/home/mj/anaconda3/")
 '(org-agenda-files
   '("~/Dropbox/orgfiles/i.org" "~/Dropbox/orgfiles/arts.org" "~/Dropbox/orgfiles/books.org" "~/Dropbox/orgfiles/gcal.org" "~/Dropbox/orgfiles/inbox.org" "/home/vj/Dropbox/orgfiles/journal/2022.gpg"))
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/Dropbox/orgfiles")
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded 'overview)
 '(org-startup-indented t)
 '(package-selected-packages
   '(org gnuplot-mode gnuplot bibtex-completion ivy-bibtex org-ref org-ref-prettify org-contrib org-latex auctex bibtex-utils latex-preview-pane company-math lsp-treemacs ivy-xref dash-functional dash lsp-ivy eglot ccls company-lsp lsp-ui lsp-mode counsel-irony counse-irony flycheck-irony company-c-headers cpputils-cmake flycheck-aspell flymake-aspell ac-clang exec-path-from-shell gtags ggtags fountain-mode openwith mw-thesaurus synosaurus engine-mode edit-server elfeed-goodies elfeed-org shell-switcher conda company-irony elpy web-mode bm company magit smartparens peep-dired dired-quick-sort iedit htmlize ox-reveal yasnippet-snippets yasnippet flycheck which-key origami default-text-scale expand-region hungry-delete beacon counsel smex ox-pandoc noflet solarized-theme ace-window paradox use-package))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
