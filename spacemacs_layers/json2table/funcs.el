(require 'org)

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

(defun org-table-create-or-convert-from-region-json ()
  "Convert region to table, or create an empty table.
If there is an active region, convert it to a table, using the function
`org-table-convert-region'.  See the documentation of that function
to learn how the prefix argument is interpreted to determine the field
separator.
If there is no such region, create an empty table with `org-table-create'."
  (interactive "P")
  (if (org-region-active-p)
      (org-table-convert-region-json (region-beginning) (region-end))
    (org-table-create arg)))

(defun org-table-convert-region-json (beg0 end0)
  "Convert region to a table.
   beginning-of-line is used to go to line header"
  (interactive "r\nP")
  (message "create table from json")
  (let* ((beg (min beg0 end0))
	 (end (max beg0 end0)) re)
    (if
(> (count-lines beg end) 99)
(user-error "Region is longer than `org-table-convert-region-max-lines' (%s) lines; not converting"
            99))
))

