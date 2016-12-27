(spacemacs/set-leader-keys "hsH" 'hs-hide-all)
(spacemacs/set-leader-keys "hsh" 'hs-hide-block)
(spacemacs/set-leader-keys "hsS" 'hs-show-all)
(spacemacs/set-leader-keys "hss" 'hs-show-block)
;; helm imenu
(spacemacs/set-leader-keys "ha" 'helm-imenu)

(eval-after-load 'evil 
  '(progn
     ;; (define-key evil-normal-state-map (kbd "SPC") 'ace-jump-mode)
     (define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
     (define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
     (define-key evil-insert-state-map (kbd "C-k") 'kill-line)
     (define-key evil-visual-state-map (kbd "C-a") 'move-beginning-of-line)
     (define-key evil-visual-state-map (kbd "C-e") 'move-end-of-line)
     (define-key evil-normal-state-map (kbd "C-a") 'move-beginning-of-line)
     (define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)
     (define-key evil-normal-state-map (kbd "C-k") 'kill-line)
     (define-key evil-insert-state-map (kbd "C-t") 'transpose-chars)
     ))


