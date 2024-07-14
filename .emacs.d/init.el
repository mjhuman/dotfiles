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
