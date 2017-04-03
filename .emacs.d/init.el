(add-to-list 'load-path "~/.emacs.d/lisp")


(package-initialize)

(set-face-foreground 'font-lock-string-face "red")
(set-face-foreground 'font-lock-comment-face "green")
(set-face-foreground 'font-lock-keyword-face "blue")

;;(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "<f5>") 'gdb)
(global-set-key (kbd "<f6>") 'other-window)
(global-set-key (kbd "<f7>")'compile)
(global-set-key (kbd "<f8>") 'gdb-next)
(global-set-key (kbd "<f9>") 'gdb-step)

;; INSTALL PACKAGES
;; --------------------------------------
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    material-theme))

(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(load-theme 'material t) ;; load material theme