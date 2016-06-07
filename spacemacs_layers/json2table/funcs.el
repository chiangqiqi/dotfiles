(require 'org)
(require 'json)

(defun getkeys (assl)
    (mapcar '(lambda (x) (car x)) assl))

(defun getvalues (assl)
  (mapcar '(lambda (x) (cdr x)) assl))

(defun json2table (beg end)
  "Prints region start and end positions"
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (not (eobp))
        (let ((cr
              (buffer-substring
               (point)
               (line-end-position)
               )
              ))
          (let ((values (getvalues
                       (json-read-from-string cr))))
            (insert
             (mapconcat 'identity
              values, "| ")))
          )
        (forward-line)
        ))
      (message "Region begin at: %d, end at: %d" beg end)))

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

(defun yay ()
  "Insert “Yay!” at cursor position."
  (interactive)
  (insert "Yay!"))

(defun oowrite-table-convert (col beg end)
  (interactive "nColumns of table: \nr")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (not (eobp))
        (subst-char-in-region
         (point) (progn (forward-line col) (1- (point)))
         ?\n ?\t)))))
