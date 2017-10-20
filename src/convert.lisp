(in-package :cl-user)
(defpackage wexl.converter
  (:use :cl :parenscript)
  (:import-from :cl-annot
                :enable-annot-syntax)
  (:import-from :trivial-shell
		:shell-command))
(in-package :wexl.converter)
(enable-annot-syntax)

@export
(defun transpile ()
  (ps:ps (defvar sample "it is a sample")))
