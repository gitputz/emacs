;; Customizations to Emacs
;; Seperate customization files loaded by init.el


;; Keybindings applied to All buffers

  ;; Copied from 'Rebinding Keys in Your Init File, Emacs *info*
  (keymap-global-set "C-c x" 'clipboard-kill-region)
  (keymap-global-set "C-c k" 'clipboard-kill-ring-save)
  (keymap-global-set "C-c y" 'clipboard-yank)


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

