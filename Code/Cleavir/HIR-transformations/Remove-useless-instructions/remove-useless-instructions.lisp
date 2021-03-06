(cl:in-package #:cleavir-remove-useless-instructions)

(defgeneric instruction-may-be-removed-p (instruction))

(defmethod instruction-may-be-removed-p (instruction)
  (and (= (length (cleavir-ir:successors instruction)) 1)
       (loop for output in (cleavir-ir:outputs instruction)
	     always (null (cleavir-ir:using-instructions output)))))

(defmethod instruction-may-be-removed-p
    ((instruction cleavir-ir:side-effect-mixin))
  nil)

(defmethod instruction-may-be-removed-p
    ((instruction cleavir-ir:enter-instruction))
  nil)

(defmethod instruction-may-be-removed-p
    ((instruction cleavir-ir:catch-instruction))
  ;; using-instructions will be incorrect, therefore
  nil)

(defun remove-useless-instructions (initial-instruction)
  (cleavir-meter:with-meter (m *remove-useless-instructions-meter*)
    (loop do (let ((useless-instructions '()))
	       (cleavir-ir:map-instructions-arbitrary-order
		(lambda (instruction)
		  (cleavir-meter:increment-size m)
		  (when (instruction-may-be-removed-p instruction)
		    (push instruction useless-instructions)))
		initial-instruction)
	       (when (null useless-instructions)
		 (loop-finish))
	       (mapc #'cleavir-ir:delete-instruction useless-instructions)))))
