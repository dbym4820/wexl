(in-package :cl-user)
(defpackage wexl.file
  (:use :cl)
  (:import-from :cl-annot
		:enable-annot-syntax)
  (:import-from :trivial-shell
		:shell-command)
  (:import-from :uiop
		:directory-exists-p)
  (:import-from :jonathan
		:to-json :parse)
  (:import-from :alexandria
		:read-file-into-string)
  (:import-from :cl-fad
		:list-directory
		:walk-directory
		:delete-directory-and-files)
  (:import-from :wexl.util
		:make-dirs
		:open-input-stream
		:open-output-stream
		:open-append-stream))
(in-package :wexl.file)
(enable-annot-syntax)

@export
(defclass template-file ()
  ((file-path :type pathname :initarg :path :accessor file-path)
   (file-content :type string :initarg :content :accessor file-content)))

(defun make-template-file-instance (path content)
  (make-instance 'template-file :path (pathname path) :content content))

@export
(defun make-file (path content)
  (generate-file (make-template-file-instance path content)))

@export
(defmethod generate-file ((file template-file))
  (let ((template-file-path (file-path file)))
    (with-open-stream (stream (open-output-stream template-file-path))
      (write-line (file-content file) stream))))

@export
(defun copy-file (source-file-path target-file-path)
  (let ((target-file
	  (make-instance 'template-file :path (pathname target-file-path)
					:content (read-file-into-string source-file-path))))
    (generate-file target-file)))

@export
(defun move-file (source-file-path target-file-path)
  (let ((target-file
	  (make-instance 'template-file :path (pathname target-file-path)
					:content (read-file-into-string source-file-path))))
    (generate-file target-file)
    (delete-file source-file-path)))
