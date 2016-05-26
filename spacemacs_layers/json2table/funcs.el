(defun funqiqi (args)
  "nothing"
  (interactive "P")
  (message "this is shit")
  )

(defun json-values (args)
  "docsring"
  (interactive "P")
  (message (list (region-beginning) (region-end)))
  )

(defun readlines ( )
  "docstring"
  (interactive "P")
  (let ((beg (line-beginning-position 1))
        (end (line-beginning-position 2)))
    beg)
  )

