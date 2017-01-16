;; 给 =org-pomodoro= 增加桌面通知功能

(defun notify-osx (title message)
  (call-process "terminal-notifier"		 
                nil 0 nil		 
                "-group" "Emacs"		 
                "-title" title		 
                "-sender" "org.gnu.Emacs"		 
                "-message" message		 
                "-activate" "oeg.gnu.Emacs"))

(add-hook 'org-pomodoro-finished-hook
          (lambda ()
            (notify-osx "Pomodoro completed!" "Time for a break.")))

(add-hook 'org-pomodoro-break-finished-hook
          (lambda ()
            (notify-osx "Pomodoro Short Break Finished" "Ready for Another?")))

(add-hook 'org-pomodoro-long-break-finished-hook
          (lambda ()
            (notify-osx "Pomodoro Long Break Finished" "Ready for Another?")))

(add-hook 'org-pomodoro-killed-hook    
          (lambda ()
            (notify-osx "Pomodoro Killed" "One does not simply kill a pomodoro!")))

;; add some electric pair for org-mode
;; (defvar org-electric-pairs '((?/ . ?/) (?= . ?=)) "Electric pairs for org-mode.")

;; (defun org-add-electric-pairs ()
;;   (setq-local electric-pair-pairs (append electric-pair-pairs org-electric-pairs))
;;   (setq-local electric-pair-text-pairs electric-pair-pairs))

;; (add-hook 'org-mode-hook 'org-add-electric-pairs)
