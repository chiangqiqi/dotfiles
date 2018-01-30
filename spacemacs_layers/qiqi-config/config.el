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


(defun rand-theme ()
  "Randomly pick a theme from `rand-theme-unwanted' or if non-nil from `rand-theme-wanted'.
Will raise error if both of these variables are nil."
  (interactive)
  (let ((available-themes (custom-available-themes))
        (theme nil))
    ;; Randomly choose a theme
    (setq theme (nth (random (length available-themes)) available-themes))
    ;; Now load it
    (load-theme theme t)
    (message "choose theme: %s" (symbol-name theme))))
