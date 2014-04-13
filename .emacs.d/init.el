;; emacs directory
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defun package-install-with-refresh (package)
  (unless (assq package package-alist)
    (package-refresh-contents))
  (unless (package-installed-p package)
    (package-install package)))

;; install evil
(package-install-with-refresh 'evil)

;; enable evil
(require 'evil)
(evil-mode t)
(setq evil-default-cursor t)

;; show paren hightlight
(show-paren-mode t)

;; require final newline
(setq require-final-newline t)

;; tab width
(setq tab-width 4)

;; use space instead of tab
(setq indent-tabs-mode nil)

;; show line number
(global-linum-mode)

;; hide startup screen
(setq inhibit-startup-screen t)

;; hide tool bar
(tool-bar-mode 0)

;; color theme
(load-theme 'molokai t)

;; C-c as ESC
(defun evil-escape-or-quit (&optional prompt)
  (interactive)
  (cond
   ((or (evil-normal-state-p) (evil-insert-state-p) (evil-visual-state-p)
        (evil-replace-state-p) (evil-visual-state-p)) [escape])
   (t (kbd "C-g"))))
(define-key key-translation-map (kbd "C-c") #'evil-escape-or-quit)
(define-key evil-operator-state-map (kbd "C-c") #'evil-escape-or-quit)
(define-key evil-normal-state-map [escape] #'keyboard-quit)

;; change line moving keys
(defun evil-swap-key (map key1 key2)
  "Swap KEY1 and KEY2 in MAP."
  (let ((def1 (lookup-key map key1))
        (def2 (lookup-key map key2)))
    (define-key map key1 def2)
    (define-key map key2 def1)))
(evil-swap-key evil-motion-state-map "j" "gj")
(evil-swap-key evil-motion-state-map "k" "gk")

;; set gui font
(when (and (>= emacs-major-version 24)
           (eq window-system 'ns))
  (create-fontset-from-ascii-font "Menlo-13:weight=normal:slant=normal" nil "menlo")
  (set-fontset-font "fontset-menlo" 'japanese-jisx0213.2004-1 (font-spec :family "Hiragino Kaku Gothic ProN"))
  (set-fontset-font "fontset-menlo" 'japanese-jisx0213-2 (font-spec :family "Hiragino Kaku Gothic ProN"))
  (set-fontset-font "fontset-menlo" 'katakana-jisx0201 (font-spec :family "Hiragino Kaku Gothic ProN"))
  (add-to-list 'default-frame-alist '(font . "fontset-menlo")))

;; set window size
(setq default-frame-alist (append '((width . 168)
                                    (height . 53)
                                    (alpha . 0.95))
                                  default-frame-alist))
