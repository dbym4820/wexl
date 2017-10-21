(in-package :cl-user)
(defpackage wexl
  (:use :cl :parenscript)
  (:import-from :cl-annot
		:enable-annot-syntax)
  (:import-from :parenscript
		:ps)
  (:import-from :trivial-shell
		:shell-command)
  (:import-from :alexandria
		:read-file-into-string)
  (:import-from :uiop
		:directory-exists-p)
  (:import-from :cl-fad
		:list-directory
		:walk-directory
		:delete-directory-and-files)
  (:import-from :wexl.util
		:make-dirs
		:open-input-stream
		:open-output-stream
		:open-append-stream)
  (:import-from :wexl.file
		:template-file
		:make-file
		:generate-file
		:copy-file
		:move-file)
  (:export :directory-exists-p
	   :ps
           :init
           :make-dirs
	   :make-file	   
	   :generate-file
	   :copy-file :move-file))
(in-package :wexl)
(enable-annot-syntax)

@export
(defun init ()
  (unless (directory-exists-p "~/.wexl")
    (make-dirs "~/.wexl/" "~/.wexl/tmp/" "~/.wexl/js/" "~/.wexl/tmp/icons/")
    (with-open-file (manifest-json "~/.wexl/tmp/manifest.json" :direction :output :if-exists :t :if-does-not-exist :create)
      (write-line "" manifest-json))))

@export
(defun make-manifest (manifest-version addon-name addon-version &key description icons content-scripts)
  (format t "{~%~%~t2\"manifest_version\": ~A,~%~t2\"name\": ~A,~%~t\"version\": ~A,~%~%~t\"descritption\": \"~A\"~%~%~t\"icons\": {~%~t\"48\": \"~A\"~%~t},~%~t\"content_scripts\":[~%~t{~%~t\"matches\": [\"http://localhost/\"],~%~t\"js\": [\"~A\"]~%~t}~%~t]~%~%~t}"
	  manifest-version addon-name addon-version (or description "") (or icons 0) (or content-scripts "")))


@export
(defun transpile (source-file-path target-file-path target-block)
  (load source-file-path)
  (make-file target-file-path
	     (funcall (read-from-string target-block))))

