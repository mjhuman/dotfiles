;; INSTALL PACKAGES

 ;; use-package
 (unless (package-installed-p 'use-package)
   (package-install 'use-package))

 (setq use-package-verbose t)
 (setq use-package-always-ensure t)

 (set-default-coding-systems 'utf-8)
 (prefer-coding-system 'utf-8)

 ;; set browser to firefox
 (setq browse-url-browser-function 'browse-url-firefox)

; HRS: Disable deprecation warnings about cl. The cl library has been deprecated, but lots of packages still use it. I can’t control that, but I can disable the warnings.
 (setq byte-compile-warnings '(cl-functions))

(setq-default tab-width 2)

(scroll-bar-mode -1)

;; Some combination of GNU TLS and Emacs fail to retrieve archive
;; contents over https.
;; https://www.reddit.com/r/emacs/comments/cdei4p/failed_to_download_gnu_archive_bad_request/etw48ux
;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341

(if (and (version< emacs-version "26.3") (>= libgnutls-version 30603))
    (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))


  ;;Install paradox package manager
  (use-package paradox
   :ensure t)

(defun vmj/view-buffer-name ()
    "Display the filename of the current buffer."
    (interactive)
    (message (buffer-file-name)))

(defun vmj/copy-buffer-path ()
    "Copy current file path"
    (interactive)
    (let (fpln)
      (setq fpln buffer-file-name)
      (kill-new fpln)
      (message (buffer-file-name))))

(defun vmj/copy-buffer-name ()
    "Copy current file name"
    (interactive)
  (insert (buffer-name (window-buffer (minibuffer-selected-window)))))

(defun vmj/generate-scratch-buffer ()
    "Create and switch to a temporary scratch buffer with a random
         name."
    (interactive)
    (switch-to-buffer (make-temp-name "scratch-")))

  (defun vmj/kill-current-buffer ()
    "Kill the current buffer without prompting."
    (interactive)
    (kill-buffer (current-buffer)))

(setq inhibit-startup-message t)
(tool-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(global-display-line-numbers-mode)
;	(global-linum-mode t) ;; enable line numbers globally
(add-to-list 'initial-frame-alist '(maximized))
(add-to-list 'default-frame-alist '(maximized))
(setq ivy-use-virtual-buffers t)
(defun jump-to-next-newline()
  "Move to the end of the line and return"
  (interactive)
  (move-end-of-line)
  (newline))
(setq ivy-format-function 'ivy-format-function-line)
(setq ivy-display-style 'fancy)
(global-prettify-symbols-mode t) ; use fancy lambdas
;;(setq view-read-only t)

(use-package ace-window
  :ensure t
  :init
  (progn
    (setq aw-scope 'frame)
    (global-set-key (kbd "C-x O") 'other-frame)
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0))))) 
    ))

(defun swap-window()
  "Swap windows and leave focus on the original window"
  (interactive)
  (ace-swap-window)
  (aw-flip-window))

(defun window-split-toggle ()
  "Toggle between horizontal and vertical split with two windows."
  (interactive)
  (if (> (length (window-list)) 2)
      (error "Can't toggle with more than 2 windows!")
    (let ((func (if (window-full-height-p)
                    #'split-window-vertically
                  #'split-window-horizontally)))
      (delete-other-windows)
      (funcall func)
      (save-selected-window
        (other-window 1)
        (switch-to-buffer (other-buffer))))))

(window-split-toggle)

(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono 13"))

  ;;(set-frame-font "Inconsolata Medium 14" nil t)
  ;;(add-to-list 'default-frame-alist '(font . "Inconsolata Medium 14"))

(use-package solarized-theme
:ensure t)
  (defun vmj/apply-solarized-theme ()
    (setq solarized-use-variable-pitch nil)
    (setq solarized-height-plus-1 1.0)
    (setq solarized-height-plus-2 1.0)
    (setq solarized-height-plus-3 1.0)
    (setq solarized-height-plus-4 1.0)
    (setq solarized-high-contrast-mode-line t)
    (load-theme 'solarized-dark t))


;;If this code is being evaluated by =emacs --daemon=, ensure that each subsequent
;; frame is themed appropriately.


  (if (daemonp)
      (add-hook 'after-make-frame-functions
                (lambda (frame)
                  (vmj/apply-solarized-theme)))
    (vmj/apply-solarized-theme))

(use-package org-bullets
    :ensure t
    :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

  ;;I like seeing a little downward-pointing arrow instead of the usual ellipsis (...) that org displays when there?s stuff under a header.
;;  (setq org-ellipsis "?")

  ;; Use syntax highlighting in source blocks while editing.
  (setq org-src-fontify-natively t)

  ;; Make TAB act as if it were issued in a buffer of the language?s major mode.
  (setq org-src-tab-acts-natively t)

  ;; When editing a code snippet, use the current window rather than popping open a new one (which shows the same information).
  (setq org-src-window-setup 'current-window)

  ;; Enable spell-checking in Org-mode.
  (add-hook 'org-mode-hook 'flyspell-mode)

(custom-set-variables
 '(org-directory "~/Dropbox/orgfiles")
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 )

(setq org-file-apps
      (append '(
                ("\\.pdf\\'" . "evince %s")
                )))

;;scheduling 
(global-set-key "\C-ca" 'org-agenda)

(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((agenda "")
          (alltodo "")))))

(setq org-agenda-files (list "~/Dropbox/orgfiles/i.org"
                             "~/Dropbox/orgfiles/arts.org"
                             "~/Dropbox/orgfiles/words.org"
                             "~/Dropbox/orgfiles/inbox.org"))

(use-package org-journal
  :ensure t
  :defer t
  :init
  ;; Change default prefix key; needs to be set before loading org-journal
  (setq org-journal-prefix-key "C-c j ")
  :config
  (setq org-journal-dir "~/Dropbox/orgfiles/journal/"
        org-journal-file-type `yearly
        org-journal-date-format "%d %B, %a"))

(global-set-key (kbd "C-c c") 'org-capture)

(setq org-capture-templates
      '(("a" "Appointment" entry (file  "~/Dropbox/orgfiles/gcal.org" )
         "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
        ("l" "Link" entry (file+headline "~/Dropbox/orgfiles/links.org" "Links")
         "* %? %^L" :prepend t)
        ("t" "To Do Item" entry (file+headline "~/Dropbox/orgfiles/i.org" "To Do")
         "* TODO %? \n%u" :prepend t)
        ("d" "Detailed To Do Item" entry (file+headline "~/Dropbox/orgfiles/i.org" "To Do")
         "* TODO %^C %? %^g\n%u" :prepend t)
        ("n" "Note" entry (file+headline "~/Dropbox/orgfiles/notes.org" "Notes")
         "* %?\n%u" :prepend t)
        ("p" "Phrase" entry (file+headline "~/Dropbox/orgfiles/words.org" "Phrases")
         "* %?\n" :prepend t)
        ("e" "EPSE" entry (file+headline "~/Dropbox/orgfiles/epse.org" "Unsorted Notes")
         "* %?\n%u" :prepend t)
        ("i" "TIL" entry (file+headline "~/Dropbox/orgfiles/notes.org" "TIL")
         "* %^C %? \n%u" :prepend t)
        ("j" "Journal entry" plain (function org-journal-find-location)
                               "** %(format-time-string org-journal-time-format)%^{Title}\n%i%?"
                               :jump-to-captured t :immediate-finish t)))

(setq org-refile-targets '((org-agenda-files :maxlevel . 1)))
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)

(defadvice org-capture-finalize 
    (after delete-capture-frame activate)  
  "Advise capture-finalize to close the frame"  
  (if (equal "capture" (frame-parameter nil 'name))  
      (delete-frame)))

(defadvice org-capture-destroy 
    (after delete-capture-frame activate)  
  "Advise capture-destroy to close the frame"  
  (if (equal "capture" (frame-parameter nil 'name))  
      (delete-frame)))

(with-eval-after-load 'org
  (require 'ox-md)
  (require 'ox-beamer))

;; Don?t ask before evaluating code blocks.
(setq org-confirm-babel-evaluate nil)

                                        ;(use-package epresent
                                        ;:ensure t)

(add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook '(lambda() (set-fill-column 80)))

(set-face-foreground 'org-link "MistyRose4")

(use-package ox-pandoc
:ensure t
:config
;; default options for all output formats
(setq org-pandoc-options '((standalone . t)))
;; cancel above settings only for 'docx' format
(setq org-pandoc-options-for-docx '((standalone . nil)))
;; special settings for beamer-pdf and latex-pdf exporters
;; (setq org-pandoc-options-for-beamer-pdf '((pdf-engine . "xelatex")))
;; (setq org-pandoc-options-for-latex-pdf '((pdf-engine . "pdflatex")))
;; special extensions for markdown_github output
(setq org-pandoc-format-extensions '(markdown_github+pipe_tables+raw_html)))

(use-package smex
  :ensure t
  :config 
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

(use-package counsel
    :ensure t
    :bind
    (("M-y" . counsel-yank-pop)
     :map ivy-minibuffer-map
     ("M-y" . ivy-next-line)))

  (use-package ivy
    :ensure t
    :diminish (ivy-mode)
    :bind (("C-x b" . ivy-switch-buffer))
    :config
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (setq ivy-height 20)
    (setq ivy-format-function 'ivy-format-function-line))

  (use-package swiper
    :ensure t
    :bind (("C-s" . swiper)
           ("C-r" . swiper)
           ("C-c C-r" . ivy-resume)
           ("M-x" . counsel-M-x)
           ("C-x r b" . counsel-bookmark)
           ("C-x C-f" . counsel-find-file))
    :config
    (progn
      (ivy-mode 1)
      (setq ivy-use-virtual-buffers t)
      (setq ivy-display-style 'fancy)
      (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
      ))

  (defface ivy-current-match
    '((((class color) (background light))
       :background "#1a4b77" :foreground "white")
      (((class color) (background dark))
       :background "#65a7e2" :foreground "black"))
    "Face used by Ivy for highlighting first match.")

(setq counsel-find-file-ignore-regexp
        (concat
         ;; File names beginning with # or .
         "\\(?:\\`[#.]\\)"
         ;; File names ending with # or ~
         "\\|\\(?:\\`.+?[#~]\\'\\)"))

(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-word-1)) ;; changed from char as per jcs

(use-package hydra 
  :ensure hydra
  :init 
  (global-set-key
   (kbd "C-x t")
   (defhydra toggle (:color blue)
     "toggle"
     ("a" abbrev-mode "abbrev")
     ("s" flyspell-mode "flyspell")
     ("d" toggle-debug-on-error "debug")
     ("c" fci-mode "fCi")
     ("f" auto-fill-mode "fill")
     ("t" toggle-truncate-lines "truncate")
     ("w" whitespace-mode "whitespace")
     ("c" flycheck-mode "flycheck")
     ("o" dired-omit-mode "dired omit mode")
     ("h" window-split-toggle "window split toggle")
     ("m" menu-bar-mode "menu bar")
     ("q" nil "cancel")))
  (global-set-key
   (kbd "C-x j")
   (defhydra gotoline 
     ( :pre (linum-mode 1)
            :post (linum-mode -1))
     "goto"
     ("t" (lambda () (interactive)(move-to-window-line-top-bottom 0)) "top")
     ("b" (lambda () (interactive)(move-to-window-line-top-bottom -1)) "bottom")
     ("m" (lambda () (interactive)(move-to-window-line-top-bottom)) "middle")
     ("e" (lambda () (interactive)(end-of-buffer)) "end")
     ("c" recenter-top-bottom "recenter")
     ("n" next-line "down")
     ("p" (lambda () (interactive) (forward-line -1))  "up")
     ("g" goto-line "goto-line")
     )))

(global-set-key
 (kbd "C-x f")
 (defhydra frequent (:color blue)
   "frequent"
   ("f" counsel-find-file "find-file")
   ("j" org-journal-new-entry "journal new entry")
   ("b" (find-file "~/Dropbox") "DB")
   ("d" (find-file "~/Downloads") "Downloads")
   ("v" (find-file "~/vinotes/posts") "vinotes")
   ("m" (find-file "~/projects/msc") "msc")
   ("p" (find-file "~/projects") "projects")
   ("n" narrow-or-widen-dwim "narrow-or-widen")
   ("V" peep-dired "peep view")
   ("r" revert-buffer "refresh")
   ("w" auto-fill-mode "auto wrap")
   ("g" (find-file "~/projects/cpp/graph") "graph")
   ("c" vmj/copy-file-line-matlab "copy file line to clipboard")
   ("l" calendar "Calendar")
   (";" iedit-mode "iedit")
   ("i" yas/insert-snippet "insert snippet")
   ("t" (counsel-find-file "~/temper") "temper")
   ("h" (counsel-find-file "~/") "home")))

; Highlights the current cursor line
(when window-system
  (global-hl-line-mode))

                                        ; flashes the cursor's line when you scroll
(use-package beacon
  :ensure t
  :config
  (beacon-mode 1))
                                        ; deletes all the whitespace when you hit backspace or delete
(use-package hungry-delete
  :diminish
  :hook (after-init . global-hungry-delete-mode)
  :init (setq hungry-delete-except-modes
              '(help-mode minibuffer-mode minibuffer-inactive-mode calc-mode)))
                                        ; expand the marked region in semantic increments (negative prefix to reduce region)
(use-package expand-region
  :ensure t
  :after (org)
  :config 
  (global-set-key (kbd "C-=") 'er/expand-region))

(setq save-interprogram-paste-before-kill t)

                                        ; font scaling
(use-package default-text-scale
  :ensure t
  :config
  (global-set-key (kbd "C-M-=") 'default-text-scale-increase)
  (global-set-key (kbd "C-M--") 'default-text-scale-decrease))

                                        ;origami folding
(use-package origami
  :ensure t)

(use-package which-key
  :ensure t 
  :config
  (which-key-mode))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    (add-to-list 'ac-modes 'matlab-mode)
    (add-to-list 'ac-modes 'nxml-mode)
    ))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))

(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))
(add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++11")))
                                        ;(add-hook 'text-mode-hook 'flyspell-mode)
                                        ;(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t)

(use-package ox-reveal
  :ensure ox-reveal)

  (setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
  (setq org-reveal-mathjax t)

  (use-package htmlize
  :ensure t)

(setq process-connection-type nil)

; mark and edit all copies of the marked region simultaneously. 
(use-package iedit
  :ensure t)

                                        ; if you're windened, narrow to the region, if you're narrowed, widen
                                        ; bound to C-x n
(defun narrow-or-widen-dwim (p)
  "If the buffer is narrowed, it widens. Otherwise, it narrows intelligently.
Intelligently means: region, org-src-block, org-subtree, or defun,
whichever applies first.
Narrowing to org-src-block actually calls `org-edit-src-code'.

With prefix P, don't widen, just narrow even if buffer is already
narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning) (region-end)))
        ((derived-mode-p 'org-mode)
         ;; `org-edit-src-code' is not a real narrowing command.
         ;; Remove this first conditional if you don't want it.
         (cond ((ignore-errors (org-edit-src-code))
                (delete-other-windows))
               ((org-at-block-p)
                (org-narrow-to-block))
               (t (org-narrow-to-subtree))))
        (t (narrow-to-defun))))

;; (define-key endless/toggle-map "n" #'narrow-or-widen-dwim)
;; This line actually replaces Emacs' entire narrowing keymap, that's
;; how much I like this command. Only copy it if that's what you want.
(define-key ctl-x-map "n" #'narrow-or-widen-dwim)

(add-to-list 'load-path "~/.emacs.d/lisp/")
  (load "dired+")

  (use-package dired-quick-sort
    :ensure t
    :config
    (dired-quick-sort-setup))

  (use-package peep-dired
    :ensure t
    :defer t ; don't access `dired-mode-map' until `peep-dired' is loaded
    :bind (:map dired-mode-map
                ("P" . peep-dired))
    :config
    (setq peep-dired-cleanup-on-disable t)
    (setq peep-dired-enable-on-directories t)
    (setq peep-dired-ignored-extensions '("mkv" "iso" "mp4" "slx" "mdl")))


                                          ; copy to the other open dired buffer
  (setq dired-listing-switches "-al --group-directories-first")

  (setq dired-dwim-target t)
  (setq dired-recursive-copies 'always)

(setq dired-omit-mode t)

  (set-face-foreground 'diredp-dir-name "IndianRed")
  (set-face-foreground 'diredp-file-name "gray")
  (set-face-foreground 'diredp-ignored-file-name "dim gray")
  (set-face-foreground 'diredp-file-suffix "dark cyan")
  (set-face-background 'diredp-dir-name "#002b36")

  (setq dired-dwim-target t)
  (setq dired-recursive-copies 'always)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("org" (name . "^.*org$"))
               ("web" (or (mode . web-mode) (mode . js2-mode)))
               ("shell" (or (mode . eshell-mode) (mode . shell-mode)))
               ("programming" (or
                               (mode . python-mode)
                               (mode . matlab-mode)
                               (mode . c++-mode)))

               ("emacs" (or
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))
               ))))
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

(org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (emacs-lisp . t)
     (C . t)
     (js . t)
     (ditaa . t)
     (dot . t)
     (org . t)
     (latex . t )
     ))

(setq org-babel-python-command "python3")

(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)
  :bind
  ( ("C-<down>" . sp-down-sexp)
    ("C-<up>"   . sp-up-sexp)
    ("M-<down>" . sp-backward-down-sexp)
    ("M-<up>"   . sp-backward-up-sexp)
    ("C-M-a" . sp-beginning-of-sexp)
    ("C-M-e" . sp-end-of-sexp)

    ("C-M-f" . sp-forward-sexp)
    ("C-M-b" . sp-backward-sexp)

    ("C-M-n" . sp-next-sexp)
    ("C-M-p" . sp-previous-sexp)

    ("C-S-f" . sp-forward-symbol)
    ("C-S-b" . sp-backward-symbol)

    ("C-<right>" . sp-forward-slurp-sexp)
    ("M-<right>" . sp-forward-barf-sexp)
    ("C-<left>"  . sp-backward-slurp-sexp)
    ("M-<left>"  . sp-backward-barf-sexp)

    ("C-M-t" . sp-transpose-sexp)
    ("C-M-k" . sp-kill-sexp)
    ("C-k"   . sp-kill-hybrid-sexp)
    ("M-k"   . sp-backward-kill-sexp)
    ("C-M-w" . sp-copy-sexp)

    ("C-M-d" . delete-sexp)

    ("M-<backspace>" . backward-kill-word)
    ("C-<backspace>" . sp-backward-kill-word)
    ([remap sp-backward-kill-word] . backward-kill-word)

    ("M-[" . sp-backward-unwrap-sexp)
    ("M-]" . sp-unwrap-sexp)

    ("C-x C-t" . sp-transpose-hybrid-sexp)

    ("C-c ("  . wrap-with-parens)
    ("C-c ["  . wrap-with-brackets)
    ("C-c {"  . wrap-with-braces)
    ("C-c '"  . wrap-with-single-quotes)
    ("C-c \"" . wrap-with-double-quotes)
    ("C-c _"  . wrap-with-underscores)
    ("C-c `"  . wrap-with-back-quotes)
    ))

(use-package magit
  :bind ("C-x g" . magit-status)
  :config
  (setq git-commit-summary-max-length 50)
  (add-hook 'git-commit-mode-hook 'turn-on-flyspell))

(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))


  (defun org-export-as-pdf-and-open ()
      (interactive)
      (save-buffer)
      (org-open-file (org-latex-export-to-pdf)))

    (add-hook 
     'org-mode-hook
     (lambda()
       (define-key org-mode-map 
           (kbd "<f5>") 'org-export-as-pdf-and-open)))

; table caption
;; (setq org-latex-caption-above 'table)

(use-package org-ref)
    (use-package bibtex-completion)
    (use-package ivy-bibtex)
    (require 'ox-latex)

  (setq bibtex-completion-bibliography
      '("~/dissertation/report/referencesf.bib"))
    ;; (setq bibtex-completion-bibliography '("~/Dropbox/emacs/bibliography/references.bib")
    ;;       bibtex-completion-library-path '("~/Dropbox/emacs/bibliography/bibtex-pdfs/")
    ;;       bibtex-completion-notes-path "~/Dropbox/emacs/bibliography/notes/"
    ;;       bibtex-completion-notes-template-multiple-files "* ${author-or-editor}, ${title}, ${journal}, (${year}) :${=type=}: \n\nSee [[cite:&${=key=}]]\n"

    ;;       bibtex-completion-additional-search-fields '(keywords)
    ;;       bibtex-completion-display-formats
    ;;       '((article       . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${journal:40}")
    ;;         (inbook        . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
    ;;         (incollection  . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
    ;;         (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
    ;;         (t             . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*}"))
    ;;       bibtex-completion-pdf-open-function
    ;;       (lambda (fpath)
    ;;         (call-process "open" nil 0 nil fpath)))


    ;; (require 'bibtex)			

    ;; (setq bibtex-autokey-year-length 4
    ;;         bibtex-autokey-name-year-separator "-"
    ;;         bibtex-autokey-year-title-separator "-"
    ;;         bibtex-autokey-titleword-separator "-"
    ;;         bibtex-autokey-titlewords 2
    ;;         bibtex-autokey-titlewords-stretch 1
    ;;         bibtex-autokey-titleword-length 5
    ;;         org-ref-bibtex-hydra-key-binding (kbd "H-b"))

    ;; (define-key bibtex-mode-map (kbd "H-b") 'org-ref-bibtex-hydra/body)

    ;; (require 'org-ref-ivy)

    ;; (setq org-ref-insert-link-function 'org-ref-insert-link-hydra/body
    ;;       org-ref-insert-cite-function 'org-ref-cite-insert-ivy
    ;;       org-ref-insert-label-function 'org-ref-insert-label-link
    ;;       org-ref-insert-ref-function 'org-ref-insert-ref-link
    ;;       org-ref-cite-onclick-function (lambda (_) (org-ref-citation-hydra/body)))

                                            ;    (setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))
                                            ;    (setq org-latex-pdf-process (list "latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f  %f"))
;;    (setq org-latex-pdf-process (list "latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f  %f"))
  ;  "bibtex %b"
   ; "makeindex %b.nlo -s nomencl.ist -o %b.nls"
                                            ;  (setq org-pandoc-options-for-beamer-pdf '((pdf-engine . "xelatex"))) ;
                                            ;  (setq org-pandoc-options-for-latex-pdf '((pdf-engine . "pdflatex"))) ;


    ;; (with-eval-after-load 'ox-latex
    ;;       (add-to-list 'org-latex-classes
    ;;       '("uom-thesis"
    ;;          "\\documentclass{uom_eee_dissertation_casson}
    ;;          [NO-DEFAULT-PACKAGES]
    ;;          [PACKAGES]
    ;;          [EXTRA]")))


    (with-eval-after-load 'ox-latex
      (add-to-list 'org-latex-classes
                   '("uom-thesis"
                     "\\documentclass{uom_eee_dissertation_casson}
                    [NO-DEFAULT-PACKAGES]
                    [PACKAGES]
                    [EXTRA]"
                     ("\\section{%s}" . "\\section*{%s}")
                     ("\\subsection{%s}" . "\\subsection*{%s}")
                     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                     ("\\paragraph{%s}" . "\\paragraph*{%s}")
                     ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

                                            ;  (eval-after-load 'ox-latex (add-to-list 'org-export-latex-classes 'uom-thesis'))

(defun my-org-latex-yas ()
  "Activate org and LaTeX yas expansion in org-mode buffers."
  (yas-minor-mode)
  (yas-activate-extra-mode 'latex-mode))

(add-hook 'org-mode-hook #'my-org-latex-yas)

(use-package hideshow
  :ensure t
  :bind (("C-M-`" . hs-toggle-hiding)))

(use-package bm
  :bind (("<C-f2>" . bm-toggle)
         ("<f2>" . bm-next)
         ("<S-f2>" . bm-previous)))

(use-package realgud)

(global-auto-revert-mode 1)

;; Treating terms in CamelCase symbols as separate words makes editing
;; a little easier for me, so I like to use subword-mode everywhere.
(global-subword-mode 1)

;; Compilation output goes to the *compilation* buffer. I rarely have
;; that window selected, so the compilation output disappears past the
;; bottom of the window. This automatically scrolls the compilation
;; window so I can always see the output.
(setq compilation-scroll-output t)

(use-package lsp-mode :commands lsp :ensure t)
(use-package lsp-ui :commands lsp-ui-mode :ensure t)
(use-package lsp-treemacs :ensure t)

(use-package ccls
  :ensure t
  :config
  (setq ccls-executable "ccls")
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp))))

(setq ccls-executable "/usr/bin/ccls"
      ccls-initialization-options `(:cache (:directory ".cache"), :compilationDatabaseDirectory "build"))

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (yas-global-mode))

(use-package ivy-xref
  :ensure t
  :init
  ;; xref initialization is different in Emacs 27 - there are two different
  ;; variables which can be set rather than just one
  (when (>= emacs-major-version 27)
    (setq xref-show-definitions-function #'ivy-xref-show-defs))
  ;; Necessary in Emacs <27. In Emacs 27 it will affect all xref-based
  ;; commands other than xref-find-definitions (e.g. project-find-regexp)
  ;; as well
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

;; c++ mode debugging
 (global-set-key (kbd "<f6>") 'gdb)
 (global-set-key (kbd "<f7>") 'compile)


(global-set-key (kbd "<f8>") 'gud-break)
(global-set-key (kbd "<iso-lefttab-f5>") 'gud-remove)


 (global-set-key (kbd "<f5>") 'gud-cont)
 (global-set-key (kbd "<f9>") 'gud-print)
 (global-set-key (kbd "<f10>") 'gud-next)
 (global-set-key (kbd "<f11>") 'gud-step)

(use-package web-mode
    :ensure t
    :config
    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.vue?\\'" . web-mode))
    (setq web-mode-engines-alist
          '(("django"    . "\\.html\\'")))
    (setq web-mode-ac-sources-alist
          '(("css" . (ac-source-css-property))
            ("vue" . (ac-source-words-in-buffer ac-source-abbrev))
            ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
    (setq web-mode-enable-auto-closing t))
  (setq web-mode-enable-auto-quoting t) ; this fixes the quote problem I mentioned
  (setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(setq python-shell-interpreter "python3")
(setq python-shell-interpreter-args "-m IPython --simple-prompt -i")
(setq flycheck-python-pycompile-executable "python3")
(add-to-list 'process-coding-system-alist '("python" . (utf-8 . utf-8)))

(set-language-environment "UTF-8")
(setenv "PYTHONIOENCODING" "utf-8") 
(add-to-list 'process-coding-system-alist '("elpy" . (utf-8 . utf-8))) 
(add-to-list 'process-coding-system-alist '("python" . (utf-8 . utf-8)))
(add-to-list 'process-coding-system-alist '("flake8" . (utf-8 . utf-8)))

(use-package pylint
  :ensure t)
  (add-hook 'after-init-hook #'global-flycheck-mode)

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

(use-package pipenv
  :hook (python-mode . pipenv-mode)
  :init
  (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-extended))

(setq pipenv-with-flycheck nil)

(setq special-display-buffer-names
      '("*compilation*"))

(setq special-display-function
      (lambda (buffer &optional args)
        (switch-to-buffer buffer)
        (get-buffer-window buffer 0)))


(setq compilation-finish-functions
      (lambda (buf str)
        (if (null (string-match ".*exited abnormally.*" str))
            ;;no errors, make the compilation window go away in a few seconds
            (progn
              (run-at-time "0.4 sec" nil
                           (lambda ()
                             (select-window (get-buffer-window (get-buffer-create "*compilation*")))
                             (switch-to-buffer nil)))
              (message "No Compilation Errors!")))))

  ;; (require 'compile)
  ;; (setq compilation-last-buffer nil)

  ;; (defun compile-again (ARG)
  ;;   "Run the same compile as the last time.

  ;; If there is no last time, or there is a prefix argument, this acts like M-x compile."
  ;;   (interactive "p")
  ;;   (if (and (eq ARG 1)
  ;;            compilation-last-buffer)
  ;;       (progn
  ;;         (set-buffer compilation-last-buffer)
  ;;         (revert-buffer t t))
  ;;     (progn
  ;;       (call-interactively 'compile)
  ;;       (setq cur (selected-window))
  ;;       (setq w (get-buffer-window "*compilation*"))
  ;;       (select-window w)
  ;;       (setq h (window-height w))
  ;;       (shrink-window (- h 10))
  ;;       (select-window cur))))
  ;; (global-set-key (kbd "C-x C-m") 'compile-again)
  ;; (defun my-compilation-hook ()
  ;;   "Make sure that the compile window is splitting vertically."
  ;;   (progn
  ;;     (if (not (get-buffer-window "*compilation*"))
  ;;         (progn
  ;;           (split-window-vertically)))))
  ;; (add-hook 'compilation-mode-hook 'my-compilation-hook)
  ;; (defun compilation-exit-autoclose (STATUS code msg)
  ;;   "Close the compilation window if there was no error at all."
  ;;   ;; If M-x compile exists with a 0
  ;;   (when (and (eq STATUS 'exit) (zerop code))
  ;;     ;; then bury the *compilation* buffer, so that C-x b doesn't go there
  ;;     (bury-buffer)
  ;;     ;; and delete the *compilation* window
  ;;     (delete-window (get-buffer-window (get-buffer "*compilation*"))))
  ;;   ;; Always return the anticipated result of compilation-exit-message-function
  ;;   (cons msg code))
  ;; (setq compilation-exit-message-function 'compilation-exit-autoclose)
  ;; (defvar all-overlays ())
  ;; (defun delete-this-overlay(overlay is-after begin end &optional len)
  ;;   (delete-overlay overlay)
  ;;   )
  ;; (defun highlight-current-line ()
  ;; "Highlight current line."
  ;;   (interactive)
  ;;   (setq current-point (point))
  ;;   (beginning-of-line)
  ;;   (setq beg (point))
  ;;   (forward-line 1)
  ;;   (setq end (point))
  ;;   ;; Create and place the overlay
  ;;   (setq error-line-overlay (make-overlay 1 1))

  ;;   ;; Append to list of all overlays
  ;;   (setq all-overlays (cons error-line-overlay all-overlays))

  ;;   (overlay-put error-line-overlay
  ;;                'face '(background-color . "red"))
  ;;   (overlay-put error-line-overlay
  ;;                'modification-hooks (list 'delete-this-overlay))
  ;;   (move-overlay error-line-overlay beg end)
  ;;   (goto-char current-point))
  ;; (defun delete-all-overlays ()
  ;;   "Delete all overlays"
  ;;   (while all-overlays
  ;;     (delete-overlay (car all-overlays))
  ;;     (setq all-overlays (cdr all-overlays))))
  ;; (defun highlight-error-lines(compilation-buffer process-result)
  ;;   (interactive)
  ;;   (delete-all-overlays)
  ;;   (condition-case nil
  ;;       (while t
  ;;         (next-error)
  ;;         (highlight-current-line))
  ;;     (error nil)))
  ;; (setq compilation-finish-functions 'highlight-error-lines)

(use-package shell-switcher
  :ensure t
  :config 
  (setq shell-switcher-mode t)
  :bind (("C-'" . shell-switcher-switch-buffer)
         ("C-x 4 '" . shell-switcher-switch-buffer-other-window)
         ("C-M-'" . shell-switcher-new-shell)))

(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(global-set-key (kbd "C-M-<up>") 'move-line-up)
(global-set-key (kbd "C-M-<down>") 'move-line-down)

(use-package engine-mode
  :ensure t)

(defengine duckduckgo
  "https://duckduckgo.com/?q=%s"
  :keybinding "d")

(defengine github
  "https://github.com/search?ref=simplesearch&q=%s"
  :keybinding "g")

(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
  :keybinding "l")

(defengine rfcs
  "http://pretty-rfc.herokuapp.com/search?q=%s")

(defengine stack-overflow
  "https://stackoverflow.com/search?q=%s"
  :keybinding "s")

(defengine wikipedia
  "http://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
  :keybinding "w")

(defengine wiktionary
  "https://www.wikipedia.org/search-redirect.php?family=wiktionary&language=en&go=Go&search=%s")

(defengine youtube
  "https://www.youtube.com/results?search_query=%s"
  :keybinding "y")

(engine-mode t)

(setq ediff-split-window-function 'split-window-vertically)
(setq ediff-window-setup-function  'ediff-setup-windows-plain)

(defun vmj/region-or-word ()
  (if mark-active
      (buffer-substring-no-properties (region-beginning)
                                      (region-end))
    (thing-at-point 'word)))


(defun vmj/dictionary-prompt ()
  (read-string
   (format "Word (%s): " (or (vmj/region-or-word) ""))
   nil
   nil
   (vmj/region-or-word)))

(defun vmj/dictionary-define-word ()
  (interactive)
  (let* ((word (vmj/dictionary-prompt))
         (buffer-name (concat "Definition: " word)))
    (with-output-to-temp-buffer buffer-name
      (shell-command (format "sdcv -n %s" word) buffer-name))))

(define-key global-map (kbd "C-x l") 'vmj/dictionary-define-word)

(use-package synosaurus
:ensure t)

  (setq-default synosaurus-backend 'synosaurus-backend-wordnet)
  (setq-default synosaurus-choose-method 'popup)
  (add-hook 'after-init-hook #'synosaurus-mode)
  (global-set-key (kbd "C-c l") 'synosaurus-lookup)
  (global-set-key (kbd "C-c r") 'synosaurus-choose-and-replace)


(use-package mw-thesaurus
:ensure t
:config
(setq mw-thesaurus--api-key "353fc03f-5f64-4d61-84a5-0e630f1c96ea"))

;;  (use-package markdown-mode
;;    :commands gfm-mode

;;    :mode (("\\.md$" . gfm-mode))

;;    :config
;;    (setq markdown-command "pandoc --standalone --mathjax --from=markdown")
;;    (add-hook 'gfm-mode-hook 'flyspell-mode)
;;    (custom-set-faces
;;     '(markdown-code-face ((t nil)))))

(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'gfm-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'turn-on-auto-fill)

(global-set-key (kbd "M-SPC") 'cycle-spacing)

(require 'flycheck)

(flycheck-define-checker proselint
  "A linter for prose."
  :command ("proselint" source-inplace)
  :error-patterns
  ((warning line-start (file-name) ":" line ":" column ": "
            (id (one-or-more (not (any " "))))
            (message (one-or-more not-newline)
                     (zero-or-more "\n" (any " ") (one-or-more not-newline)))
            line-end))
  :modes (text-mode markdown-mode gfm-mode org-mode))

(add-to-list 'flycheck-checkers 'proselint)

(add-hook 'markdown-mode-hook #'flycheck-mode)
(add-hook 'gfm-mode-hook #'flycheck-mode)
(add-hook 'text-mode-hook #'flycheck-mode)
(add-hook 'org-mode-hook #'flycheck-mode)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(set-fontset-font t 'malayalam "Chilanka")
(set-fontset-font t 'malayalam "Chilanka" nil 'append)
(set-fontset-font t 'malayalam (font-spec :script 'malayalam) nil 'append)

;; Forces the messages to 0, and kills the *Messages* buffer
(switch-to-buffer "*scratch*")
(delete-other-windows)

(require 'epa-file)
(epa-file-enable)

(setq flycheck-check-syntax-automatically '(mode-enabled new-line idle-change))

(use-package openwith)
(when (require 'openwith nil 'noerror)
      (setq openwith-associations
            (list
             (list (openwith-make-extension-regexp
                    '("mpg" "mpeg" "mp3" "mp4"
                      "avi" "wmv" "wav" "mov" "flv"
                      "ogm" "ogg" "mkv"))
                   "vlc"
                   '(file))
             (list (openwith-make-extension-regexp
                    '("xbm" "pbm" "pgm" "ppm" "pnm"
                      "png" "gif" "bmp" "tif" "jpeg" "jpg"))
                   "viewnior"
                   '(file))
             (list (openwith-make-extension-regexp
                    '("doc" "docx" "xls" "ppt" "odt" "ods" "odg" "odp"))
                   "libreoffice"
                   '(file))
             '("\\.lyx" "lyx" (file))
             '("\\.chm" "kchmviewer" (file))
             (list (openwith-make-extension-regexp
                    '("pdf" "ps" "ps.gz" "dvi"))
                   "evince"
                   '(file))
             ))
      (openwith-mode 1))

;;Keyboard mappings
    (global-set-key (kbd "\e\ei") (lambda () (interactive) (find-file "~/Dropbox/orgfiles/i.org")))
    (global-set-key (kbd "\e\el") (lambda () (interactive) (find-file "~/Dropbox/orgfiles/links.org")))
    (global-set-key (kbd "\e\ea") (lambda () (interactive) (find-file "~/Dropbox/orgfiles/arts.org")))
    (global-set-key (kbd "\e\en") (lambda () (interactive) (find-file "~/Dropbox/orgfiles/notes.org")))
    (global-set-key (kbd "\e\ec") (lambda () (interactive) (find-file "~/.emacs.d/myinit.org")))
    (global-set-key (kbd "\e\ew") (lambda () (interactive) (find-file "~/Dropbox/orgfiles/words.org")))
    (global-set-key (kbd "\e\ee") (lambda () (interactive) (find-file "~/Dropbox/orgfiles/epse.org")))
    (global-set-key (kbd "\e\em") (lambda () (interactive) (find-file "~/Dropbox/music/sangeetham.org")))
    (global-set-key (kbd "\e\ef") (lambda () (interactive) (find-file "~/fre/fre.org")))
    (global-set-key (kbd "\e\ep") (lambda () (interactive) (find-file "/home/vj/fre/podcast/podcast.org")))
    (global-set-key (kbd "\e\ed") (lambda () (interactive) (find-file "~/dissertation/journal.org")))



    (global-set-key (kbd "<f4>") 'kmacro-end-and-call-macro)
    (global-set-key (kbd "<C-f5>") 'revert-buffer)
    (global-set-key (kbd "C-\\") "\C-a\C- \C-e\M-w") ;copy current line
    (global-set-key (kbd "<C-f7>") 'toggle-truncate-lines)
    (global-set-key (kbd "C-`") 'other-window)
    (global-set-key (kbd "C-o") 'other-window)
    (global-set-key (kbd "<C-iso-lefttab>") 'other-window)
    (global-set-key (kbd "C-<return>") 'jump-to-next-newline)
    (global-set-key (kbd "C-x o") 'swap-window)
    (global-set-key (kbd "<C-f6>") 'mlint-clear-warnings)
    (global-set-key (kbd "<C-f8>") 'view-mode)

    (global-set-key (kbd "C-:") 'iedit-mode)

  ;; example of binding keys only when html-mode is active

  (define-key dired-mode-map "\C-o"    'other-window)
;;  (define-key  compilation-mode-map "\C-o"  'other-window)

(use-package fountain-mode)

(use-package gnuplot)
(use-package gnuplot-mode)
