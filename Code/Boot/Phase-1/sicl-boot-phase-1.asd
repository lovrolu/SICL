(cl:in-package #:asdf-user)

(defsystem #:sicl-boot-phase-1
  :depends-on (#:sicl-boot-base)
  :serial t
  :components
  ((:file "packages")
   (:file "environment")
   (:file "utilities")
   (:file "enable-defgeneric-in-e2")
   (:file "define-accessor-generic-functions-in-e2")
   (:file "enable-defclass-in-e1")
   (:file "define-mop-classes-in-e1")
   (:file "boot-phase-1")))
