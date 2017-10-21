#|
  This file is a part of wexl project.
  Copyright (c) 2017 Tomoki ABURATANI (aburatanitomoki@gmail.com)
|#

(in-package :cl-user)
(defpackage wexl-test-asd
  (:use :cl :asdf))
(in-package :wexl-test-asd)

(defsystem wexl-test
  :author "Tomoki ABURATANI"
  :license "MIT"
  :depends-on (:wexl
               :rove)
  :components ((:module "t"
                :components
                ((:test-file "wexl"))))
  :description "Test system for wexl"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
