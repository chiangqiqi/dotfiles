(use-package org
  :defer t
  :config
  (require 'org)
  (require 'ob-latex)
  (require 'ox-latex)
  (require 'elec-pair)

;;; Notes
(setq org-default-notes-file (concat org-directory "/notes.org"))
;; any headline with level <= 2 is a target
(setq org-refile-targets '((org-agenda-files :maxlevel . 2)))

(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "M-j") 'org-insert-heading)
            (local-set-key (kbd "C-c d") 'fb-insert-diff)
            (local-set-key (kbd "C-c t") 'fb-insert-task)
            (org-indent-mode)))

;; 添加 org-mode 中的 electric-pairs 
(defvar org-electric-pairs
  '( (?$ . ?$) (?= . ?=)  (?~ . ?~))
  "Electric pairs for `org-mode'.")

(defun org-add-electric-pairs ()
  "Add =, $ as electric pairs."
  (setq-local electric-pair-pairs (append electric-pair-pairs org-electric-pairs))
  (setq-local electric-pair-text-pairs electric-pair-pairs))

(add-hook 'org-mode-hook 'org-add-electric-pairs))
