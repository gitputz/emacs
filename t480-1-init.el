
;;;;Config from gitlab.com/Clsmith1
;;

;; Install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))


(setq straight-use-package-by-default t)

(setq backup-directory-alist '((".*" . "~/.local/share/Trash/files")))

;; Default folder 
(setq default-directory "C:/Users/user/Emacs")


;; Saving Customizations

;; Specifying different customization files for different Emacs versions:

;;     (cond ((< emacs-major-version 29)
;;           ((and (= emacs-minor-version 3))
;;            (setq custom-file "C/Users/user/Emacs/.emacs.d/.emacs-29-custom.el"))
	   
	   ;; Examples from the manual
	   ;; Emacs [version number] customization.
;;           ((and (= emacs-major-version 26)
;;                 (< emacs-minor-version 3))
;;            ;; Emacs 26 customization, before version 26.3.
;;            (setq custom-file "~/.config/custom-26.el"))
;;           (t
;;            ;; Emacs version 28.1 or later.
;;            (setq custom-file "~/.config/emacs-custom.el")))

     ;;(load custom-file)

     (setq custom-file "C:/Users/user/Emacs/.emacs.d/.emacs-custom.el")
     (load custom-file)


(use-package beacon)

(use-package doom-themes)

(use-package focus)

(use-package magit)

(use-package rainbow-mode
:hook org-mode prog-mode)

(use-package rainbow-delimiters
:hook ((org-mode . rainbow-delimiters-mode)
       (prog-mode . rainbow-delimiters-mode)))

(use-package hl-todo
  :hook ((org-mode . hl-todo-mode)
         (prog-mode . hl-todo-mode))
  :config
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        `(("TODO"       warning bold)
          ("FIXME"      error bold)
          ("HACK"       font-lock-constant-face bold)
          ("REVIEW"     font-lock-keyword-face bold)
          ("NOTE"       success bold)
          ("DEPRECATED" font-lock-doc-face bold))))

(use-package catppuccin-theme)

(use-package ef-themes)


;;;; eshell config from System Crafters
 (setq eshell-history-size         10000
        eshell-buffer-maximum-lines 10000
        eshell-hist-ignoredups t
        eshell-scroll-to-bottom-on-input t)
;;
(use-package eshell-git-prompt
  :after eshell)
;;
(use-package eshell
  :hook (eshell-first-time-mode . efs/configure-eshell)
  :config

  (with-eval-after-load 'esh-opt
    (setq eshell-destroy-buffer-when-process-dies t)
    (setq eshell-visual-commands '("htop" "zsh" "vim")))

  (eshell-git-prompt-use-theme 'powerline))


(use-package which-key
  :straight t
:init 
  (which-key-mode 1)
:config
(setq which-key-side-window-location 'bottom
      which-key-sort-order #'which-key-key-order
      which-key-allow-imprecise-window-fit nil
	  which-key-sort-uppercase-first nil
	  which-key-add-column-padding 1
	  which-key-max-display-columns nil
	  which-key-min-display-lines 6
	  which-key-side-window-slot -10
	  which-key-side-window-max-height 0.25
	  which-key-idle-delay 0.8
	  which-key-max-description-length 25
	  which-key-allow-imprecise-window-fit nil
	  which-key-separator " → " ))

;;;;Vterm requires compilation of vterm-module at each emacs startup on Ubuntu
;;
;;(use-package vterm
;;:config
;;(setq shell-file-name "/bin/bash"
;;      vterm-max-scrollback 5000))
;;
;;(use-package vterm-toggle
;;:after vterm
;;:config
;;(setq vterm-toggle-fullscreen-p nil)
;;(setq vterm-toggle-scope 'project)
;;(add-to-list 'display-buffer-alist
;;               '((lambda (buffer-or-name _)
;;                     (let ((buffer (get-buffer buffer-or-name)))
;;                       (with-current-buffer buffer
;;                         (or (equal major-mode 'vterm-mode)
;;                             (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
;;                  (display-buffer-reuse-window display-buffer-at-bottom)
                  ;;(display-buffer-reuse-window display-buffer-in-direction)
                  ;;display-buffer-in-direction/direction/dedicated is added in emacs27
                  ;;(direction . bottom)
                  ;;(dedicated . t) ;dedicated is supported in emacs27
;;                  (reusable-frames . visible)
;;                  (window-height . 0.3))))

(use-package treemacs
:straight t
:defer t)

(use-package treemacs-icons-dired
:hook (dired-mode . treemacs-icons-dired-enable-once)
:straight t)

(use-package treemacs-persp
:after (treemacs persp-mode)
:ensure t
:config (treemacs-set-scope-type 'Perspectives))

(use-package doom-modeline
  :straight t
  :init (doom-modeline-mode 1))

;; To display iconc, nerd-icons are necessary. Run M-x nerd-icons-install-fonts. On MS Windows, these fonts must then be installed manually. Do this by right-clicking the mouse and choosing the install option.   

(use-package nerd-icons
  ;; :custom
  ;; The Nerd Font you want to use in GUI
  ;; "Symbols Nerd Font Mono" is the default and is recommended
  ;; but you can use any other Nerd Font if you want
  ;; (nerd-icons-font-family "Symbols Nerd Font Mono")
  )

;; To display icons in eg Dired.
;; See 'nerd icons' above for instructions if using MS Windows
(use-package all-the-icons
      :if (display-graphic-p))

(use-package all-the-icons-dired
:hook (dired-mode . (lambda () (all-the-icons-dired-mode t))))


(use-package org-auto-tangle
:defer t
:hook (org-mode . org-auto-tangle-mode))

(add-hook 'org-mode-hook 'org-indent-mode)
(setq org-directory "~/Org/"
      org-agenda-files '("~/Org/agenda.org")
      org-default-notes-file (expand-file-name "notes.org" org-directory)
      org-ellipsis " ▼ "
      org-log-done 'time
      org-journal-dir "~/Org/journal/"
      org-journal-date-format "%B %d, %Y (%A) "
      org-journal-file-format "%Y-%m-%d.org"
      org-hide-emphasis-markers t)
(setq org-src-preserve-indentation nil
      org-src-tab-acts-natively t
      org-edit-src-content-indentation 0
      org-src-fontify-natively t
      org-confirm-babel-evaluate nil)

(use-package toc-org
   :commands toc-org-enable
   :init (add-hook 'org-mode-hook 'toc-org-enable))

(use-package org-modern)
(with-eval-after-load 'org (global-org-modern-mode))

(use-package org-tempo
 :straight nil)

;;install vertico
(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  (setq vertico-cycle t))

(use-package vertico-directory
:after vertico
:straight nil
:load-path "straight/repos/vertico/extensions/"
:bind (:map vertico-map
            ("RET" . vertico-directory-enter)
            ("DEL" . vertico-directory-delete-char)
            ("M-DEL" . vertico-directory-delete-word))

:hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package company 
  :ensure  
  :custom
  (company-idle-delay 0.1)
  (global-company-mode t)
  :bind
  (:map company-active-map
	("C-n" . company-select-next)
	("C-p" . company-select-previous)
	("M-<" . company-select-first)
	("M->" . company-select-last))

  (:map company-mode-map
        ("<tab>" . tab-indent-or-complete)
         ("TAB" . tab-indent-or-complete)))

(defun company-yasnippet-or-completion ()
  (interactive)
  (or (do-yas-expand)
      (company-complete-common)))

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "::") t nil)))))

(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))


(defun tab-indent-or-complete ()
(interactive)
(if (minibufferp)
    (minibuffer-complete)
  (if (or (not yas/minor-mode)
          (null (do-yas-expand)))
(if (check-expansion)
      (company-complete-common)
    (indent-for-tab-command)))))


(use-package company-box
  :after company
  :hook (company-mode . company-box-mode))

;; Enable rich annotations using the Marginalia package
(use-package marginalia
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init section is always executed.
  :init

  ;; Marginalia must be actived in the :init section of use-package such that
  ;; the mode gets enabled right away. Note that this forces loading the
  ;; package.
  (marginalia-mode))

(use-package embark
  :straight t)

(use-package embark-consult
 :straight t
 :hook
 (embark-collection-mode . consult-preview-at-point-mode))

(use-package evil
  :straight t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :straight t
  :config
  (evil-collection-init))

;;install dashboard
(use-package dashboard
   :straight t
   :init
 (setq dashboard-set-heading-icons t)
 (setq dashboard-set-file-icons t)
 (setq dashboard-banner-logo-title "You can learn Emacs in a day. Everyday")
 (setq dashboard-startup-banner 'logo)
 (setq dashboard-center-content nil)
 (setq dashboard-items '((recents . 5)
                         (projects . 3)
                         (agenda . 3))))
                        
 :config
(dashboard-setup-startup-hook)

(use-package consult)



(use-package consult-dir
 :straight t
 :bind (("C-x C-d" . consult-dir)
 :map vertico-map
 ("C-x C-d" . consult-dir)
 ("C-x C-j" . consult.dir-jump-file)))

(use-package perspective
  :bind
  ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))  ; pick your own prefix key here
  :init
  (persp-mode))

(use-package lsp-mode
 :ensure
 :commands lsp
 :custom
(lsp-rust-analyzer-cargo-watch-command "clippy")
(lsp-eldoc-render-all t)
(lsp-idle-delay 0.6)
(lsp-inlay-hint-enable nil)
(lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
(lsp-rust-analyzer-display-chaining-hints t)
(lsp-rust-analyzer-displal-lifetime-elision-hints-use-parameter-names t) 
(lsp-rust-analyzer-display-closure-return-type-hints t)
(lsp-rust-analyzer-display-parameter-hints t)
(lsp-rust-analyzer-display-reborrow-hints t)
(setq lsp-auto-guess-root nil) 
:config
(add-hook 'lsp-mode-hook 'lsp-ui-mode
          'lsp-mode-hook 'lsp-enable-which-key-integration))

(use-package lsp-ui
:ensure
:commands lsp-ui-mode
:custom
(lsp-ui-peek-always-show t)
(lsp-ui-sideline-show-hover t)
(lsp-ui-doc-enable nil))

(use-package lsp-jedi
:straight t)

(use-package rustic
:straight 
:bind (:map rustic-mode-map
       ("M-j" . lsp-ui-imenu)
       ("M-?" . lsp-find-references))
:config
(setq lsp-format-buffer t))

(use-package ccls
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
        (lambda () (require 'ccls) (lsp))))
(setq ccls-executable "/usr/bin/ccls")
;;(setq ccls-sem-highlight-method 'font-lock)
(setq ccls-use-default-rainbow-sem-highlight 'font-lock)
(ccls-code-lens-mode 1)

(use-package nix-mode
 :mode ("\\.nix\\'" "\\.nix.in'")
 :hook (nix-mode . lsp-deferred)
 :straight t)

(use-package haskell-mode)

(use-package toml-mode)

(use-package rust-mode
:hook (rust-mode . lsp-mode))

(use-package flycheck
  :straight t)

(setq treesit-language-source-alist
'((rust "https://github.com/tree-sitter/tree-sitter-rust")
  (nix "https://github.com/nix-community/tree-sitter-nix")))

(setq major-mode-remap-alist
   '((rust-mode . rust-ts-mode)))

;;(use-package direnv
 ;; :config
  ;;(direnv-mode))

(use-package projectile)

(use-package yasnippet
:config
(yas-reload-all)
(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'text-mode-hook 'yas-minor-mode))

(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; Using garbage magic hack.
 (use-package gcmh
   :config
   (gcmh-mode 1))
;; Setting garbage collection threshold
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Silence compiler warnings as they can be pretty disruptive (setq comp-async-report-warnings-errors nil)

;; Silence compiler warnings as they can be pretty disruptive
(if (boundp 'comp-deferred-compilation)
    (setq comp-deferred-compilation nil)
    (setq native-comp-deferred-compilation nil))
;; In noninteractive sessions, prioritize non-byte-compiled source files to
;; prevent the use of stale byte-code. Otherwise, it saves us a little IO time
;; to skip the mtime checks on every *.elc file.
(setq load-prefer-newer noninteractive)

;; load dashboard instead of scratchpad at startup *INSTALL DASHBOARD*
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
(load-theme 'doom-one :no-confirm) ; Set theme
(menu-bar-mode -1) ; Turn menubar off
(scroll-bar-mode -1) ; Turn scrollbar off
(tool-bar-mode -1) ; Turn tool-bar off
(global-display-line-numbers-mode 1) ; Display line numbers globally
(beacon-mode 1) ; Turn beacon on
(setq inhibit-startup-screen t) ; Disable startup default startup screen
(setq auto-save-interval 1000)
(setq make-backup-files nil) ; Disable automatic backup files

(defun y-or-n-p-with-return (orig-func &rest args)
  (let ((query-replace-map (copy-keymap query-replace-map)))
    (define-key query-replace-map (kbd "RET") 'act)
    (apply orig-func args)))        

(advice-add 'y-or-n-p :around #'y-or-n-p-with-return)

(electric-indent-mode -1)
(setq org-edit-src-content-indentation 0)


;;;; Set fonts to be used by Emacs
;;;;
;;;;First, you need to download the font. You can do this by opening a terminal and using the command wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
;;;;
;;;;(Note: to install Ubuntu Nerd Fonts, download them from https://www.nerdfonts.com/font-downloads)
;;;;
;;;;Next, extract the downloaded zip file using unzip JetBrainsMono.zip
;;;;
;;;;Then, move the font files to the system font directory with sudo mv JetBrainsMono/* /usr/share/fonts/
;;;;
;;;;Finally, for the font to be available, update the font cache with sudo fc-cache -f -v


;; -----------------------------------------------------------
;; Integrating fonts into Emacs on Windows

;; Emacs Elements advises correctly
(set-frame-font "JetBrains Mono" nil t)


(setq pixel-scroll-precision-mode 1)
;; Uncomment the following line if line spacing needs adjusting.
;;(setq-default line-spacing 0.12)

(add-to-list 'default-frame-alist '(alpha-background . 90))
;; Needed if using emacsclient. Otherwise, your fonts will be smaller than expected.
;;(add-to-list 'default-frame-alist '(font . "SauceCodePro Nerd Font-16" :weight 'semibold))
;; changes certain keywords to symbols, such as lamda!
(setq global-prettify-symbols-mode t)
;;(add-hook 'find-file-hook (lambda () (set-face-attribute 'default nil :height 105)))

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)


(global-set-key (kbd "C-t") 'vterm-toggle)





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("9a870ed55018161c9f022bf47e0e852078ad97c8021a1a9130af9cde1880bfa4" "545a268abdb70a28a299242bb79daf7cf1f088ddcbe9518c9d754a6f6159feb6" default))
 '(org-agenda-files nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
