(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default)))
 '(electric-pair-mode t)
 '(fringe-mode 0 nil (fringe))
 '(gnus-select-method (quote (nntp "news.newsfan.net")))
 '(markdown-command "/usr/local/bin/pandoc --ascii")
 '(ns-use-srgb-colorspace t)
 '(password-cache-expiry 36000)
 '(powerline-default-separator (quote arrow))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

(require 'ido)
(ido-mode t)

(add-hook 'after-init-hook 'global-company-mode)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))



(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(require 'yasnippet)
(yas-global-mode 1)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;powerline
;;(add-to-list 'load-path "~/.emacs.d/emacs-powerline")
(require 'powerline)
(powerline-default-theme)
;;set powerline separator colors right



;;set the mode line to be "flat"
;; (set-face-attribute 'mode-line nil :box nil)
;; (set-face-attribute 'mode-line-inactive nil :box nil)

;;(setq company-backends (delete 'company-semantic company-backends))
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)

;;bind tab yasnippet and company mode both to tab  key-binding
(defun check-expansion ()
    (save-excursion
      (if (looking-at "\\_>") t
        (backward-char 1)
        (if (looking-at "\\.") t
          (backward-char 1)
          (if (looking-at "->") t nil)))))

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

  (global-set-key [tab] 'tab-indent-or-complete)

;;bind super+x to helm-M-x
(global-set-key (kbd "s-x") 'helm-M-x)

;;helm configuration
(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)


;;rainbow parentaces
(require 'rainbow-delimiters)
(rainbow-delimiters-mode-enable)
;;(global-rainbow-delimiters-mode)

;;hide and show mode
(defun toggle-selective-display (column)
  (interactive "P")
  (set-selective-display
   (or column
       (unless selective-display
	 (1+ (current-column))))))

(defun toggle-hiding (column)
  (interactive "P")
  (if hs-minor-mode
      (if (condition-case nil
	      (hs-toggle-hiding)
	    (error t))
	  (hs-show-all))
    (toggle-selective-display column)))

(load-library "hideshow")
(global-set-key (kbd "C-+") 'toggle-hiding)
(global-set-key (kbd "C-\\") 'toggle-selective-display)

(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)

;;set erc to use http proxy
(defvar http-proxy-host "localhost")
(defvar http-proxy-port "8087")

(defun open-http-proxy-stream (name buffer host service &rest parameters)
  "Open network stream via http proxy. Proxy is defined by variables http-proxy-host and http-proxy-port."
  (let ((tmp-process (apply 'open-network-stream name buffer http-proxy-host http-proxy-port parameters)))
  (process-send-string name (format "CONNECT %s:%d HTTP/1.1\n\n" host service))
  tmp-process))

(setq erc-server-connect-function 'open-http-proxy-stream)

;;shift+arrow key bindings for window moving
(windmove-default-keybindings)


;;insert python documentations string
;;which is """"""""
(defun python-insert-doc ()
  "insert python doc string under some symbol"
    (interactive)
    (insert "\"\"\"\"\"\"")
    (backward-char 3))

;;org-mode configuration
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))


;; make the modeline high contrast
;; (setq solarized-high-contrast-mode-line nil)

;;fix the wired status bar separation problem
(setq x-use-underline-position-properties nil)
(setq underline-minimum-offset 4)
