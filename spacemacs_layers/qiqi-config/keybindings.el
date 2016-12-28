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


;; super + 方向键 操作窗口移动
(global-set-key (kbd "s-<left>") 'evil-window-left)
(global-set-key (kbd "s-<right>") 'evil-window-right)
(global-set-key (kbd "s-<up>") 'evil-window-up)
(global-set-key (kbd "s-<down>") 'evil-window-down)

;; f5 绑定到日程 打开或者关闭
(defun interactively-open-org-agenda ()
  ;; (interactive "bjust msg current buffer name")
  (interactive)
  (if (string-equal (buffer-name) "*Org Agenda*")
      (org-agenda-quit) (org-agenda-list)))

(global-set-key (kbd "<f5>") 'interactively-open-org-agenda)
