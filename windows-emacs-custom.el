

;; PowerShell as a shell within Emacs
;; https://www.reddit.com/r/emacs/comments/m3cx27/powershellwindows_terminal_from_emacs/ 
;; https://learn.microsoft.com/en-us/archive/blogs/dotnetinterop/run-powershell-as-a-shell-within-emacs 

;; Below may, in combination with lsp-pwsh, work

;;(use-package powershell
;;    :straight t
;;    :config
;;    ;; Change default compile command for powershell
;;    (add-hook 'powershell-mode-hook
;;    (lambda ()
;;        (set (make-local-variable 'compile-command)
;;        (format "powershell.exe -NoLogo -NonInteractive -Command \"& '%s'\""             (buffer-file-name)))))
;;)
