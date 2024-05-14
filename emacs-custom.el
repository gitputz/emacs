;; Customizations to Emacs
;; Seperate customization files loaded by init.el


;; Keybindings applied to All buffers

  ;; Copied from 'Rebinding Keys in Your Init File, Emacs *info*
  (keymap-global-set "C-c x" 'clipboard-kill-region)
  (keymap-global-set "C-c k" 'clipboard-kill-ring-save)
  (keymap-global-set "C-c y" 'clipboard-yank)

;; Does work
    ;; Move Windows
    "w H" '(evil-window-move-far-left :wk "Buffer move left")
    "w J" '(evil-window-move-very-bottom :wk "Buffer move down")
    "w K" '(evil-window-move-very-top :wk "Buffer move up")
    "w L" '(evil-window-move-far-right :wk "Buffer move right"))



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


;; File Management Configuration
;; System Crafters from Scratchpad
;;
;;(use-package dired
;;  :straight nil
;;  :commands (dired dired-jump)
;;  :bind (("C-x C-j" . dired-jump))
;;  :custom ((dired-listing-switches "-agho --group-directories-first"))
;;  :config
;;  (evil-collection-define-key 'normal 'dired-mode-map
;;    "h" 'dired-single-up-directory
;;    "l" 'dired-single-buffer))


;; Killing and Yanking aka Copying and Pasting
;; Killed from menu-bar.el?

(defun menu-bar-enable-clipboard ()
  "Make CUT, PASTE and COPY (keys and menu bar items) use the clipboard.
Do the same for the keys of the same name."
  (interactive)
  ;; These are Sun server keysyms for the Cut, Copy and Paste keys
  ;; (also for XFree86 on Sun keyboard):
;;  (define-key global-map [f20] 'clipboard-kill-region)
;;  (define-key global-map [f16] 'clipboard-kill-ring-save)
;;  (define-key global-map [f18] 'clipboard-yank)
  ;; X11 versions:
  (define-key global-map [cut] 'clipboard-kill-region)
  (define-key global-map [C-c k] 'clipboard-kill-ring-save)


;; Keybindings applied to All buffers

  ;; Copied from 'Rebinding Keys in Your Init File, Emacs *info*
  (define-key global-map [C-c y] 'clipboard-yank))
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("88f7ee5594021c60a4a6a1c275614103de8c1435d6d08cc58882f920e0cec65e" "7ec8fd456c0c117c99e3a3b16aaf09ed3fb91879f6601b1ea0eeaee9c6def5d9" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

