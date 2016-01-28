;;; packages.el --- blog layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: tintin <tintin@localhost>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `blog-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `blog/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `blog/pre-init-PACKAGE' and/or
;;   `blog/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst blog-packages
  '(
    org
    metaweblog
    xml-rpc
    (org2blog :location (recipe
                         :fetcher github
                         :repo "punchagan/org2blog"))))

(defun blog/init-xml-rpc ()
  (use-package xml-rpc))

(defun blog/init-metaweblog ()
  (use-package metaweblog))

(defun blog/init-org2blog ()
  (use-package org2blog
    ;; Do we want to defer how does it know about orgblog in org files then
    :commands (org2blog/wp-mode org2blog/wp-login)
    ))

;;; packages.el ends here
