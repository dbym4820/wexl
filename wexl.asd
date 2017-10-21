(in-package :cl-user)
(defpackage wexl-asd
  (:use :cl :asdf))
(in-package :wexl-asd)

(defsystem wexl
  :version "0.1"
  :author "Tomoki ABURATANI"
  :license "MIT"
  :depends-on (:parenscript
	       :cl-annot
	       :uiop
	       :dexador
	       :cl-ppcre
	       :alexandria
	       :trivial-shell
	       :local-time
	       :cl-fad
	       :jonathan
	       :cl-json
	       :cl-who
               :rove)
  :components ((:module "src"
                :components
                ((:file "wexl" :depends-on ("util" "file"))
		 (:file "util")
		 (:file "file" :depends-on ("util")))))
  :description "Parenscript transpiler"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.md"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op wexl-test))))
