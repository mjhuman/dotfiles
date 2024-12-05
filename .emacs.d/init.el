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

(server-start)
;;(package-install 'org-contrib)

(org-babel-load-file (expand-file-name "~/.emacs.d/ente.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/Dropbox/orgfiles")
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded 'overview)
 '(org-startup-indented t)
 '(package-selected-packages
	 '(ox-hugo gnuplot-mode gnuplot fountain-mode openwith mw-thesaurus synosaurus engine-mode shell-switcher pipenv elpy pylint web-mode ivy-xref ccls lsp-treemacs lsp-ui lsp-mode realgud bm ivy-bibtex org-ref magit smartparens peep-dired dired-quick-sort iedit htmlize ox-reveal yasnippet-snippets yasnippet flycheck auto-complete which-key origami default-text-scale expand-region hungry-delete beacon counsel smex ox-pandoc org-journal org-bullets solarized-theme ace-window paradox)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
