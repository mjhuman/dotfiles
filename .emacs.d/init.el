
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

; start auto-complete with emacs
;;(require 'auto-complete)
; do default config for auto-complete
;;(require 'auto-complete-config)
;;(ac-config-default)
;; auto complete for html
;;(require 'ac-html)

; start yasnippet with emacs
;;(require 'yasnippet)
;;(yas-global-mode 1)

;; ; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
;; (defun my:ac-c-header-init ()
;;   (require 'auto-complete-c-headers)
;;   (add-to-list 'ac-sources 'ac-source-c-headers)
;;   (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/usr/llvm-gcc-4.2/lib/gcc/i686-apple-darwin11/4.2.1/include")
;; )
;; ; now let's call this function from c/c++ hooks
;; (add-hook 'c++-mode-hook 'my:ac-c-header-init)
;; (add-hook 'c-mode-hook 'my:ac-c-header-init)

; Fix iedit bug in Mac
;(define-key global-map (kbd "C-c ;") 'iedit-mode)

;; ; start google-c-style with emacs
;; (require 'google-c-style)
;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)


;; ; turn on Semantic
;; (semantic-mode 1)
;; ; let's define a function which adds semantic as a suggestion backend to auto complete
;; ; and hook this function to c-mode-common-hook
;; (defun my:add-semantic-to-autocomplete() 
;;   (add-to-list 'ac-sources 'ac-source-semantic)
;; )
;; (add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
; turn on ede mode 
;(global-ede-mode 1)
; create a project for our program.
;;(ede-cpp-root-project "my project" :file "~/demos/my_program/src/main.cpp"
;;		      :include-path '("/../my_inc"))
; you can use system-include-path for setting up the system header file locations.
; turn on automatic reparsing of open buffers in semantic
;(global-semantic-idle-scheduler-mode 1)



;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; (defun my-web-mode-hook ()
;;   "Hooks for Web mode."
;;   (setq web-mode-markup-indent-offset 2)
;;   (setq web-mode-css-indent-offset 2)
;;   (setq web-mode-code-indent-offset 2)
;; )
;; (add-hook 'web-mode-hook  'my-web-mode-hook)
;; (setq web-mode-enable-auto-pairing t)
;; (setq web-mode-enable-css-colorization t)

;; (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
;; (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
;; (add-hook 'emmet-mode-hook (lambda () (setq emmet-indent-after-insert nil)))
;; (add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent 2 spaces.

;; ;;If you want the cursor to be positioned between first empty quotes after expanding:
;; (setq emmet-move-cursor-between-quotes t) ;; default nil

;; ;;Or if you don't want to move cursor after expanding:
;; (setq emmet-move-cursor-after-expanding nil) ;; default t

;;------------------------------------------------------------------------------------------//



;; My customization:

;; ;; c++ mode debugging
;; (global-set-key (kbd "<f5>") 'gdb)
;; (global-set-key (kbd "<C-tab>") 'other-window)
;; (global-set-key (kbd "<f7>")'compile)
;; (global-set-key (kbd "<f9>") 'gud-break)
;; (global-set-key (kbd "<C-iso-lefttab>") 'previous-multiframe-window)

;; Theme, startup and line number
;;(load-theme 'misterioso)
;;(load-theme 'solarized-dark)
;;(setq inhibit-startup-message t) ;; hide the startup message
;;(global-linum-mode t) ;; enable line numbers globally
;;(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;(set-face-foreground 'font-lock-string-face "red")
;;(set-face-foreground 'font-lock-comment-face "green")
;;(set-face-foreground 'font-lock-keyword-face "blue")

;(set-frame-font "DejaVu Sans Mono 13" nil t)

;; (setq tab-width 2) ; or any other preferred value
;; (defvaralias 'c-basic-offset 'tab-width)
;; (defvaralias 'cperl-indent-level 'tab-width)

;; (defun move-line (n)
;;   "Move the current line up or down by N lines."
;;   (interactive "p")
;;   (setq col (current-column))
;;   (beginning-of-line) (setq start (point))
;;   (end-of-line) (forward-char) (setq end (point))
;;   (let ((line-text (delete-and-extract-region start end)))
;;     (forward-line n)
;;     (insert line-text)
;;     ;; restore point to original column in moved line
;;     (forward-line -1)
;;     (forward-char col)))

;; (defun move-line-up (n)
;;   "Move the current line up by N lines."
;;   (interactive "p")
;;   (move-line (if (null n) -1 (- n))))

;; (defun move-line-down (n)
;;   "Move the current line down by N lines."
;;   (interactive "p")
;;   (move-line (if (null n) 1 n)))

;; (global-set-key (kbd "M-<up>") 'move-line-up)
;; (global-set-key (kbd "M-<down>") 'move-line-down)

;(global-set-key (kbd "<XF86AudioPlay>") 'compile)
;(global-set-key (kbd "<XF86Search>") 'gdb)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/Dropbox/orgfiles")
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (origami dumb-jump ggtags elfeed-org elfeed-goodies elfeed shell-switcher default-text-scale ac-cider cider counsel-projectile dired-quick-sort dired+ nodejs-repl which-key web-mode virtualenvwrapper use-package undo-tree try tern-auto-complete solarized-theme smartparens rtags py-autopep8 projectile paradox ox-reveal org-bullets org-ac noflet material-theme magit js2-refactor jedi jade-mode irony iedit hungry-delete htmlize google-c-style flycheck expand-region epresent elpy ein dracula-theme counsel color-theme-solarized cmake-mode better-defaults beacon auto-complete-c-headers ahungry-theme ace-window ac-js2 ac-html ac-emmet))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
