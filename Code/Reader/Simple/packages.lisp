(cl:in-package #:common-lisp-user)

(defpackage #:sicl-reader
  (:use #:common-lisp)
  (:shadow
   #:readtable
   #:*readtable*
   #:*read-eval*
   #:read
   #:read-preserving-whitespace
   #:make-dispatch-macro-character
   #:set-dispatch-macro-character
   #:get-dispatch-macro-character
   #:set-macro-character
   #:get-macro-character
   #:set-syntax-from-char
   #:copy-readtable
   #:readtable-case
   )
  (:export
   #:readtable
   #:*readtable*
   #:*read-eval*
   #:read
   #:read-preserving-whitespace
   #:make-dispatch-macro-character
   #:set-dispatch-macro-character
   #:get-dispatch-macro-character
   #:set-macro-character
   #:get-macro-character
   #:set-syntax-from-char
   #:copy-readtable
   #:readtable-case
   ;; Names of additional conditions.
   #:backquote-condition
   #:invalid-context-for-backquote
   #:invalid-context-for-comma
   #:comma-not-inside-backquote
   #:undefined-use-of-backquote
   #:invalid-context-for-consing-dot
   #:consing-dot-most-be-followed-by-object
   #:multiple-objects-following-consing-dot
   #:invalid-context-for-right-parenthesis
   #:sub-char-must-not-be-a-decimal-digit
   #:char-must-be-a-dispatching-character
   #:symbol-name-must-not-end-with-package-marker
   #:symbol-does-not-exist
   #:symbol-is-not-external
   #:two-package-markers-must-be-adjacent
   #:two-package-markers-must-not-be-first
   #:symbol-can-have-at-most-two-package-markers
   ;; Names of macros related to backquote.
   ;; We export them so that the pretty printer
   ;; can use them properly.
   #:quasiquote #:unquote #:unquote-splicing
   ))
