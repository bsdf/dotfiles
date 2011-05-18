(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backup"))))
 '(coffee-tab-width 4)
 '(inhibit-startup-echo-area-message nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message "")
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(vc-follow-symlinks nil)
 '(visible-bell t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "#3f3f3f" :foreground "#dcdccc" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "apple" :family "Inconsolata")))))

(setq ring-bell-function 'ignore)

(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(setenv "PATH" (concat "/usr/local/bin"
		       path-separator
		       (getenv "PATH")))

(setq load-path (cons "~/.emacs.d/" load-path))
(setq load-path (cons "~/.emacs.d/colortheme" load-path))
(setq load-path (cons "~/.emacs.d/coffee-mode" load-path))
(setq load-path (cons "~/.emacs.d/egg" load-path))

(let ((shellname "/usr/local/bin/zsh"))
  (setenv "ESHELL" shellname)
  (setenv "SHELL" shellname)
  (setq shell-file-name shellname))

;; specific customizations for various terminals etc
(when (eq window-system nil)
  ; enable mouse
  (xterm-mouse-mode)
  ; iterm2 is set to send C-; as f6 cuz it sux
  (global-set-key [f6] 'other-window)
)

(when (eq window-system 'ns)
  ())


(global-set-key "\C-x\C-h" 'help-command) ;; rebind help command
(global-set-key "\C-h" 'backward-char)
(global-set-key [?\C-\;] 'other-window)
(global-set-key "\C-x\C-j" 'execute-extended-command) ;; M-x
(global-set-key [C-backspace] 'backward-kill-word)
(global-set-key "\C-w" 'forward-word)
;(global-set-key "\C-q" 'backward-word)
(global-set-key "\C-q" 'quoted-insert)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-j" 'next-line)
(global-set-key "\C-b" 'scroll-down)
(global-set-key "\C-cb" 'end-of-buffer)  ;;; "bottom" of buffer
(global-set-key "\C-ct" 'beginning-of-buffer)  ;;; "top" of buffer
(global-set-key "\C-c\C-b" 'end-of-buffer)
(global-set-key "\C-c\C-t" 'beginning-of-buffer)
(global-set-key "\C-c\C-g" 'goto-line)
(global-set-key [C-return] 'newline-and-indent)

(show-paren-mode)

(require 'color-theme)
(color-theme-initialize)

(require 'zenburn)
(color-theme-zenburn)

(defun recenter-top ()
 (interactive)
 (recenter 0))

(global-set-key "\C-z" nil)
(global-set-key "\C-zt" 'recenter-top)
(global-set-key "\C-z\C-t" 'recenter-top)
(global-set-key "\C-zz" 'recenter)
(global-set-key "\C-z\C-z" 'recenter)

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

(define-key my-keys-minor-mode-map (kbd "C-j") 'next-line)

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " (-:" 'my-keys-minor-mode-map)

(my-keys-minor-mode 1)

(defun my-minibuffer-setup-hook ()
  (my-keys-minor-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

(require 'coffee-mode)

; emacsclient stuff
(server-start)
(add-hook 'server-switch-hook
	  (lambda ()
	    (when (current-local-map)
	      (use-local-map (copy-keymap (current-local-map))))
	    (when server-buffer-clients
	      (local-set-key (kbd "C-x k") 'server-edit))))