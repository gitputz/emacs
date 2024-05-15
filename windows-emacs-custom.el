;; Customizations to Emacs
;; Seperate customization files loaded by init.el


;; Keybindings applied to All buffers

  ;; Copied from 'Rebinding Keys in Your Init File, Emacs *info*
  (keymap-global-set "C-c x" 'clipboard-kill-region)
  (keymap-global-set "C-c k" 'clipboard-kill-ring-save)
  (keymap-global-set "C-c y" 'clipboard-yank)

;; ***********NOTHING in the font section below works on MS Windows!***********
;; Location of Fonts installed on the Windows system
;;(add-to-list 'bdf-directory-list "C:/Users/user/Fonts/Jet_Brains_Mono/fonts/ttf")
;;
;;(set-face-attribute 'default nil 
;;  :font "JetBrains Mono"
;;  :height 120
;;  :weight 'bold)
;;;;(set-face-attribute 'variable-pitch nil 
;;;;  :font "Ubuntu Nerd Font"
;;;;  :height 120
;;;;  :weight 'semibold)
;;(set-face-attribute 'fixed-pitch nil
;;  :font "JetBrains Mono"
;;  :height 120
;;  :weight 'bold)
;;;; Makes commented text and keywords italics.
;;;; This is working in emacsclient but not emacs.
;;;; Your font must have an italic face available.
(set-face-attribute 'font-lock-comment-face nil
 :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
 :slant 'italic)
;;
;;(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font-14"))

;; Vim keybindings
(use-package general
  :config
  (general-evil-setup)
  
  ;; set up 'SPC' as the global leader key
  (general-create-definer lee/leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC" ;; set leader
    :global-prefix "M-SPC") ;; access leader in insert mode
    

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
    "b S" '(save-some-buffers :wk "Save multiple buffers"))
;;    "b w" '(bookmark-save :wk "Save current bookmarks to bookmark file"))


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
;;    "f c" '((lambda () (interactive)
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

)
    (lee/leader-keys
    "e"   '(:ignore t :wk "Evaluate")
  ;; (dt/leader-keys
;;    "e" '(:ignore t :wk "Eshell/Evaluate")    
    "e b" '(eval-buffer :wk "Evaluate elisp in buffer")
;;    "e d" '(eval-defun :wk "Evaluate defun containing or after point")
;;    "e e" '(eval-expression :wk "Evaluate and elisp expression")
    ;; "e h" '(counsel-esh-history :which-key "Eshell history")
;;    "e l" '(eval-last-sexp :wk "Evaluate elisp expression before point")
    "e r" '(eval-region :wk "Evaluate elisp in region")
;;    "e R" '(eww-reload :which-key "Reload current page in EWW")
;;    "e s" '(eshell :which-key "Eshell")
    "e w" '(eww :which-key "EWW emacs web wowser"))

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
;; From DT's config -doesn't work
;;    ;; Move Windows
;;    "w H" '(buf-move-left :wk "Buffer move left")
;;    "w J" '(buf-move-down :wk "Buffer move down")
;;    "w K" '(buf-move-up :wk "Buffer move up")
;;    "w L" '(buf-move-right :wk "Buffer move right"))
;;
;; Does work
    ;; Move Windows
    "w H" '(evil-window-move-far-left :wk "Buffer move left")
    "w J" '(evil-window-move-very-bottom :wk "Buffer move down")
    "w K" '(evil-window-move-very-top :wk "Buffer move up")
    "w L" '(evil-window-move-far-right :wk "Buffer move right"))


;; Powershell as your shell within Emacs on MS Windows
;; Not a terminal emulator. For that functionality use eshell
;; M-x shell

;; Kudos to Jeffrey Snover: https://docs.microsoft.com/en-us/archive/blogs/dotnetinterop/run-powershell-as-a-shell-within-emacs
(setq explicit-shell-file-name "powershell.exe")
(setq explicit-powershell.exe-args '())
