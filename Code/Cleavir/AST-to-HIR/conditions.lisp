;;; An AST appears in a context inappropriate for it.
;;; This is a fatal compiler error.
(define-condition miscontext (error acclimation:condition)
  ((%ast :initarg :ast :reader ast)
   (%context :initarg :context :reader miscontext-context)
   ;; The AST needs this many results and this many successors.
   ;; NIL is don't-care
   (%ast-results :initarg :ast-results :reader ast-results)
   (%ast-successors :initarg :ast-successors :reader ast-successors)))

(defun assert-context (ast context ast-results ast-successors)
  (when (or (and ast-results (/= ast-results (results context)))
	    (and ast-successors
		 (= ast-successors (successors context))))
    (error 'miscontext :ast ast :context context
		       :ast-results ast-results
		       :ast-successors ast-successors)))
