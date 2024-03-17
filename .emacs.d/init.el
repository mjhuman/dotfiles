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

(org-babel-load-file (expand-file-name "~/.emacs.d/ente.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(conda-anaconda-home "/home/mj/anaconda3/")
 '(custom-safe-themes
	 '("fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "c3e6b52caa77cb09c049d3c973798bc64b5c43cc437d449eacf35b3e776bf85c" default))
 '(org-agenda-files
	 '("/home/vj/Dropbox/orgfiles/i.org" "/home/vj/Dropbox/orgfiles/arts.org" "/home/vj/Dropbox/orgfiles/gcal.org" "/home/vj/Dropbox/orgfiles/inbox.org" "/home/vj/Dropbox/orgfiles/journal/20230101"))
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/Dropbox/orgfiles")
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded 'overview)
 '(org-startup-indented t)
 '(package-selected-packages
	 '(json-mode epresent ox-latex realgud pylint pipenv async material-theme material org gnuplot-mode gnuplot bibtex-completion ivy-bibtex org-ref org-ref-prettify org-contrib org-latex auctex bibtex-utils latex-preview-pane company-math lsp-treemacs ivy-xref dash-functional dash lsp-ivy eglot ccls company-lsp lsp-ui lsp-mode counsel-irony counse-irony flycheck-irony company-c-headers cpputils-cmake flycheck-aspell flymake-aspell ac-clang exec-path-from-shell gtags ggtags fountain-mode openwith mw-thesaurus synosaurus engine-mode edit-server elfeed-goodies elfeed-org shell-switcher conda company-irony elpy web-mode bm company magit smartparens peep-dired dired-quick-sort iedit htmlize ox-reveal yasnippet-snippets yasnippet flycheck which-key origami default-text-scale expand-region hungry-delete beacon counsel smex ox-pandoc noflet solarized-theme ace-window paradox use-package))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
