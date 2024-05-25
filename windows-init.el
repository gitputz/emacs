
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
(load-theme 'doom-dracula :no-confirm) ; Set theme
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
(set-frame-font "JetBrainsMono Nerd Font" nil t)

;; ***********NOTHING in the font section below works on MS Windows!***********
;; Location of Fonts installed on the Windows system
;;(add-to-list 'bdf-directory-list "C:/Users/user/Fonts/Jet_Brains_Mono/fonts/ttf")
;;
;;(set-face-attribute 'default nil 
;;  :font "JetBrainsMono Nerd Font"
;;  :height 120
;;  :weight 'bold)
;;;;(set-face-attribute 'variable-pitch nil 
;;;;  :font "Ubuntu Nerd Font"
;;;;  :height 120
;;;;  :weight 'semibold)
;;(set-face-attribute 'fixed-pitch nil
;;  :font "JetBrainsMono Nerd Font"
;;  :height 120
;;  :weight 'bold)
;;;; Makes commented text and keywords italics.
;;;; This is working in emacsclient but not emacs.
;;;; Your font must have an italic face available.
;;(set-face-attribute 'font-lock-comment-face nil
;;  :slant 'italic)
;;(set-face-attribute 'font-lock-keyword-face nil
;;  :slant 'italic)
;;
;;(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font-14"))

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


;; Vim keybindings
(use-package general
  :config
  (general-evil-setup)
  
  ;; set up 'SPC' as the global leader key
  (general-create-definer lee/leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC" ;; set leader
    :global-prefix "M-SPC")

  (lee/leader-keys
    "w" '(:ignore t :wk "Windows")
    ;; Window splits
    "w c" '(evil-window-delete :wk "Close window")
    "w n" '(evil-window-new :wk "New window")
    "w s" '(evil-window-split :wk "Horizontal split window")
    "w v" '(evil-window-vsplit :wk "Vertical split window")
    ;; Window motions
    "w h" '(evil-window-left :wk "Window left")
    "w j" '(evil-window-down :wk "Window down")
    "w k" '(evil-window-up :wk "Window up")
    "w l" '(evil-window-right :wk "Window right")
    "w w" '(evil-window-next :wk "Goto next window")
    ;; Move Windows
    "w H" '(buf-move-left :wk "Buffer move left")
    "w J" '(buf-move-down :wk "Buffer move down")
    "w K" '(buf-move-up :wk "Buffer move up")
    "w L" '(buf-move-right :wk "Buffer move right"))
)

 (lee/leader-keys
;;    "h" '(:ignore t :wk "Help")
;;    "h f" '(describe-function :wk "Describe function")
;;    "h v" '(describe-variable :wk "Describe variable")
;;    "h r r" '((lambda () (interactive)
;;                (load-file "~/.emacs.d/init.el")
;;                (ignore (elpaca-process-queues)))
;;              :wk "Reload emacs config"))
;;
;;;;Help keys ripped from DT Configuring Emacs
;;(dt/leader-keys
    "h" '(:ignore t :wk "Help")
    ;; "h a" '(counsel-apropos :wk "Apropos")
    "h b" '(describe-bindings :wk "Describe bindings")
    "h c" '(describe-char :wk "Describe character under cursor")
    "h d" '(:ignore t :wk "Emacs documentation")
    "h d a" '(about-emacs :wk "About Emacs")
    "h d d" '(view-emacs-debugging :wk "View Emacs debugging")
    "h d f" '(view-emacs-FAQ :wk "View Emacs FAQ")
    "h d m" '(info-emacs-manual :wk "The Emacs manual")
    "h d n" '(view-emacs-news :wk "View Emacs news")
    "h d o" '(describe-distribution :wk "How to obtain Emacs")
    "h d p" '(view-emacs-problems :wk "View Emacs problems")
    "h d t" '(view-emacs-todo :wk "View Emacs todo")
    "h d w" '(describe-no-warranty :wk "Describe no warranty")
    "h e" '(view-echo-area-messages :wk "View echo area messages")
    "h f" '(describe-function :wk "Describe function")
    "h F" '(describe-face :wk "Describe face")
    "h g" '(describe-gnu-project :wk "Describe GNU Project")
    "h i" '(info :wk "Info")
    "h I" '(describe-input-method :wk "Describe input method")
    "h k" '(describe-key :wk "Describe key")
    "h l" '(view-lossage :wk "Display recent keystrokes and the commands run")
    "h L" '(describe-language-environment :wk "Describe language environment")
    "h m" '(describe-mode :wk "Describe mode")
    "h r" '(:ignore t :wk "Reload")
    "h r r" '((lambda () (interactive)
                (load-file "~/.emacs.d/init.el")
                (ignore (elpaca-process-queues)))
              :wk "Reload emacs config")
    "h t" '(load-theme :wk "Load theme")
    "h v" '(describe-variable :wk "Describe variable")
    "h w" '(where-is :wk "Prints keybinding for command if set")
    "h x" '(describe-command :wk "Display full documentation for command"))


    (lee/leader-keys
    "SPC" '(execute-extended-command :wk "M-x")
    "." '(find-file :wk "Find file")
    "f f" '(find-file :wk "Find file")
    "=" '(perspective-map :wk "Perspective") ;; Lists all the perspective keybindings
    "TAB TAB" '(comment-line :wk "Comment lines")
    "u" '(universal-argument :wk "Universal argument"))

;; Keybindings re Buffers and Bookmarks
    (lee/leader-keys
;;    "b"   '(:ignore t :wk "Buffers")
;;    "b i" '(ibuffer :wk "Ibuffer")
;;    "b p" '(previous-buffer :wk "Previous buffer")
;;    "b n" '(next-buffer :wk "Next buffer")

  ;; (dt/leader-keys
    "b" '(:ignore t :wk "Bookmarks/Buffers")
    "b b" '(switch-to-buffer :wk "Switch to buffer")
    "b c" '(clone-indirect-buffer :wk "Create indirect buffer copy in a split")
    "b C" '(clone-indirect-buffer-other-window :wk "Clone indirect buffer in new window")
;;    "b d" '(bookmark-delete :wk "Delete bookmark")
    "b i" '(ibuffer :wk "Ibuffer")
    "b k" '(kill-current-buffer :wk "Kill current buffer")
    "b K" '(kill-some-buffers :wk "Kill multiple buffers")
;;    "b l" '(list-bookmarks :wk "List bookmarks")
;;    "b m" '(bookmark-set :wk "Set bookmark")
    "b n" '(next-buffer :wk "Next buffer")
    "b p" '(previous-buffer :wk "Previous buffer")
    "b r" '(revert-buffer :wk "Reload buffer")
    "b R" '(rename-buffer :wk "Rename buffer")
    "b s" '(basic-save-buffer :wk "Save buffer")
    "b S" '(save-some-buffers :wk "Save multiple buffers")
;;    "b w" '(bookmark-save :wk "Save current bookmarks to bookmark file")
)


    (lee/leader-keys
    "d"   '(:ignore t :wk "Dired")
    "d d" '(dired :wk "Open Dired")
    "d j" '(dired-jump :wk "Dired jump to current"))


;; Keybindings re Files etc
    (lee/leader-keys
    ;; "f"   '(:ignore t :wk "Files")
    "f c" '((lambda () (interactive) (find-file "~/.emacs.d/init.el")) :wk "Open emacs config")
    ;; "f d" '(find-grep-dired :wk "Search for strings in files in DIR"))
  ;; (dt/leader-keys
    "f" '(:ignore t :wk "Files")    
    ;; "f c" '((lambda () (interactive)
              ;; (find-file "~/.emacs.d/config.org")) 
            ;; :wk "Open emacs config.org")
    "f e" '((lambda () (interactive)
              (dired "~/.emacs.d/")) 
            :wk "Open user-emacs-directory in dired")
    "f d" '(find-grep-dired :wk "Search for string in files in DIR")
    ;; "f g" '(counsel-grep-or-swiper :wk "Search for string current file")
    "f i" '((lambda () (interactive)
              (find-file "~/.emacs.d/init.el")) 
            :wk "Open emacs init.el")
    ;; "f j" '(counsel-file-jump :wk "Jump to a file below current directory")
    ;; "f l" '(counsel-locate :wk "Locate a file")
    ;; "f r" '(counsel-recentf :wk "Find recent files")
    "f u" '(sudo-edit-find-file :wk "Sudo find file")
    "f U" '(sudo-edit :wk "Sudo edit file"))


    (lee/leader-keys
    "e"   '(:ignore t :wk "Evaluate")
    "e r" '(eval-region :wk "Eval Region")
    "e b" '(eval-buffer :wk "Eval Buffer"))
  ;; (dt/leader-keys
    "e" '(:ignore t :wk "Eshell/Evaluate")    
    "e b" '(eval-buffer :wk "Evaluate elisp in buffer")
    "e d" '(eval-defun :wk "Evaluate defun containing or after point")
    "e e" '(eval-expression :wk "Evaluate and elisp expression")
    ;; "e h" '(counsel-esh-history :which-key "Eshell history")
    "e l" '(eval-last-sexp :wk "Evaluate elisp expression before point")
    "e r" '(eval-region :wk "Evaluate elisp in region")
    "e R" '(eww-reload :which-key "Reload current page in EWW")
    "e s" '(eshell :which-key "Eshell")
    "e w" '(eww :which-key "EWW emacs web wowser")



