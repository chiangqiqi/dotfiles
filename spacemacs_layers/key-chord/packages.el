;;; packages.el --- key-chord Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar key-chord-packages
  '(
    key-chord 
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar key-chord-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function key-chord/init-<package-key-chord>
;;
(defun key-chord/init-key-chord ()
  "Initialize my package"
  (use-package key-chord
    :init
    (key-chord-mode 1)
    (key-chord-define-global "jj" 'ace-jump-word-mode)
    (key-chord-define-global "jj" 'ace-jump-word-mode)
    (key-chord-define-global "jl" 'ace-jump-line-mode)
    (key-chord-define-global "jk" 'ace-jump-char-mode)
    (key-chord-define-global "uu" 'undo-tree-visualize)
    (key-chord-define-global "xx" 'execute-extended-command)))
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
