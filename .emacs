(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(setq evil-want-C-u-scroll t)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "s" 'split-window-horizontally
  "S" 'split-window-vertically
  "e" 'buffer-menu
  "q" 'evil-quit
  "b" 'switch-to-buffer
  "w" 'save-buffer
  "k" 'kill-buffer
  "/" 'comment-line
  "v" 'my/select-current-line-and-forward-line
  "p" 'helm-find-files
  "t" 'term-char-mode
  "y" 'term-line-mode
  "re" (lambda ()
	 (interactive)
	 (call-interactively 'slime-eval-last-expression-in-repl)
	 (call-interactively 'previous-multiframe-window)
	 )
  "rd" 'slime-compile-defun
  "rf" 'slime-compile-and-load-file
  "rr" 'slime-compile-region
  "rm" 'slime-macroexpand-all
  )
(evil-global-set-key 'motion
  (kbd "TAB") 'other-window)
(evil-global-set-key 'motion
  (kbd "<backtab>") 'previous-multiframe-window)

(require 'evil)
(evil-mode 1)

(with-eval-after-load 'evil
  ;; use evil mode in the buffer created from calling `list-packages'.
  (add-to-list 'evil-buffer-regexps '("*Packages*" . normal))
  (add-to-list 'evil-buffer-regexps '("*Custom Themes*" . normal))
  (add-to-list 'evil-buffer-regexps '("*Backtrace*" . normal))
  (add-to-list 'evil-buffer-regexps '("*terminal*" . normal))

  (with-eval-after-load 'package
    ;; movement keys j,k,l,h set up for free by defaulting to normal mode.
    ;; mark, unmark, install
    (evil-define-key 'normal package-menu-mode-map (kbd "m") #'package-menu-mark-install)
    (evil-define-key 'normal package-menu-mode-map (kbd "u") #'package-menu-mark-unmark)
    (evil-define-key 'normal package-menu-mode-map (kbd "x") #'package-menu-execute)))

;; (add-hook 'after-make-frame-functions
;;           (lambda (frame)
;;             (let ((mode (if (display-graphic-p frame) 'light 'dark)))
;;               (set-frame-parameter frame 'background-mode mode)
;;               (set-terminal-parameter frame 'background-mode mode))
;; 	    (set-frame-parameter frame 'background-mode 'dark)
;;             (enable-theme 'solarized)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized)))
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(frame-background-mode (quote dark))
 '(package-selected-packages
   (quote
    (slime color-theme-solarized xterm-color evil-leader helm evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (set-background-color nil)
;; (setq solarized-termcolors 256)

;; (add-hook 'after-make-frame-functions
;;           (lambda (frame)
;;             (set-frame-parameter frame 'background-mode 'dark))
;;             (enable-theme 'solarized-theme)))
;; (load-theme 'solarized-theme)
;; ;; (setq solarized-termcolors 256)

(setq visible-bell 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(xterm-mouse-mode 1)

(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(global-visual-line-mode 1)

;; (setq inhibit-startup-screen t)
;; (setq frame-resize-pixelwise t
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; (set-face-attribute 'default (selected-frame) :height 100 nil)
(set-face-attribute 'default (selected-frame) :height 100)


;; (custom-set-variables
;;  '(initial-frame-alist (quote ((fullscreen . maximized)))))
;; (toggle-full-screen)

;; (defun toggle-full-screen ()
;;   "Toggles full-screen mode for Emacs window on Win32."
;;   (interactive)
;;   (shell-command "emacs_fullscreen.exe"))

;; (defun toggle-bars ()
;;   "Toggles bars visibility."
;;   (interactive)
;;   (menu-bar-mode)
;;   (tool-bar-mode)
;;   (scroll-bar-mode))

;; (defun toggle-full-screen-and-bars ()
;;   "Toggles full-screen mode and bars."
;;   (interactive)
;;   (toggle-bars)
;;   (toggle-full-screen))

;; (global-set-key [f11] 'toggle-full-screen-and-bars)

(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(global-set-key [f11] 'toggle-fullscreen)



; (mouse-wheel-mode 't)
;; scroll one line at a time (less "jumpy" than defaults)
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;; (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
;; (setq scroll-step 1) ;; keyboard scroll one line at a time
(unless (display-graphic-p)
   (menu-bar-mode -1))
(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(global-set-key
;  (kbd "C-/") 'comment-or-uncomment-region-or-line)
  (kbd "C-l") 'comment-line)
(global-set-key [mouse-4] 'scroll-down-line)
(global-set-key [mouse-5] 'scroll-up-line)
;(global-set-key
;  (kbd [?\C-/] 'comment-or-uncomment-region)

;(define-key minibuffer-local-map (kbd "ESC") 'keyboard-escape-quit)
;(global-set-key (kbd "<escape>") 'top-level)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(define-key minibuffer-local-map "<escape>" 'top-level)
(define-key minibuffer-local-ns-map "<escape>" 'top-level)
(define-key minibuffer-local-completion-map "<escape>" 'top-level)
(define-key minibuffer-local-must-match-map "<escape>" 'top-level)
(define-key minibuffer-local-isearch-map "<escape>" 'top-level)

(defun my/select-current-line-and-forward-line (arg)
  "Select the current line and move the cursor by ARG lines IF
no region is selected.

If a region is already selected when calling this command, only move
the cursor by ARG lines."
  (interactive "p")
  (when (not (use-region-p))
    (forward-line 0)
    (set-mark-command nil))
  (forward-line arg))

(setq inferior-lisp-program "sbcl")
