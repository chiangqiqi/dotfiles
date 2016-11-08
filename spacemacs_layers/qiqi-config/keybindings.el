;;; funcs.el --- Better Emacs Defaults Layer key bindings File
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(global-set-key (kbd "<C-E>") 'move-end-of-line)
(global-set-key (kbd "<M-enter>") 'indent-new-comment-line)

(spacemacs/set-leader-keys "hsH" 'hs-hide-all)
(spacemacs/set-leader-keys "hsh" 'hs-hide-block)
(spacemacs/set-leader-keys "hsS" 'hs-show-all)
(spacemacs/set-leader-keys "hss" 'hs-show-block)
;; helm imenu
(spacemacs/set-leader-keys "ha" 'helm-imenu)

