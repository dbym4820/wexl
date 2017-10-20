(in-package :cl-user)
(defpackage wexl.util
  (:use :cl)
  (:import-from :cl-annot
		:enable-annot-syntax)
  (:import-from :trivial-shell
		:shell-command)
  (:import-from :uiop
		:directory-exists-p)
  (:import-from :jonathan
		:to-json :parse))
(in-package :wexl.util)
(enable-annot-syntax)

@export
(defun make-dirs (&rest pathnames)
  (let ((path (car pathnames)))
    (cond ((null path) t)
    	  (t
    	   (unless (directory-exists-p path)
    	     (shell-command (format nil "mkdir ~A" path)))
	   (eval `(make-dirs ,@(cdr pathnames)))))))

@export
(defun open-input-stream (file &key (element-type 'cl:character) (external-format :utf-8))
  (open file :direction :input
	     :element-type element-type
	     :external-format external-format))

@export
(defun open-output-stream (file &key (element-type 'cl:character) (external-format :utf-8))
  (open file
        :direction :output
        :element-type element-type
        :external-format external-format
        :if-exists :supersede
        :if-does-not-exist :create))

@export
(defun open-append-stream (file &key (element-type 'cl:character) (external-format :utf-8))
  (open file
        :direction :output
        :element-type element-type
        :external-format external-format
        :if-exists :append
        :if-does-not-exist :create))
