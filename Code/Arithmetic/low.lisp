(cl:in-package #:sicl-arithmetic)

(declaim (notinline general-binary-less general-binary-not-greater
		    general-binary-greater general-binary-not-less
		    general-binary-equal general-binary-not-equal))

(declaim (inline binary-less binary-not-greater
		 binary-greater binary-not-less
		 binary-equal binary-not-equal))

(defun binary-add (x y)
  (cond ((and (typep x 'fixnum) (typep y 'fixnum))
	 (cleavir-primop:let-uninitialized (z)
	   (if (cleavir-primop:fixnum-add x y z)
	       z
	       (convert-fixnum-to-bignum z))))
	((and (typep x 'short-float) (typep y 'short-float))
	 (cleavir-primop:short-float-add x y))
	((and (typep x 'single-float) (typep y 'single-float))
	 (cleavir-primop:single-float-add x y))
	((and (typep x 'double-float) (typep y 'double-float))
	 (cleavir-primop:double-float-add x y))
	((and (typep x 'long-float) (typep y 'long-float))
	 (cleavir-primop:long-float-add x y))
	(t
	 (general-binary-add x y))))

(defun binary-less (x y)
  (cond ((and (typep x 'fixnum) (typep y 'fixnum))
	 (cleavir-primop:fixnum-less x y))
	((and (typep x 'short-float) (typep y 'short-float))
	 (cleavir-primop:short-float-less x y))
	((and (typep x 'single-float) (typep y 'single-float))
	 (cleavir-primop:single-float-less x y))
	((and (typep x 'double-float) (typep y 'double-float))
	 (cleavir-primop:double-float-less x y))
	((and (typep x 'long-float) (typep y 'long-float))
	 (cleavir-primop:long-float-less x y))
	(t
	 (general-binary-less x y))))

(defun binary-not-greater (x y)
  (cond ((and (typep x 'fixnum) (typep y 'fixnum))
	 (cleavir-primop:fixnum-not-greater x y))
	((and (typep x 'short-float) (typep y 'short-float))
	 (cleavir-primop:short-float-not-greater x y))
	((and (typep x 'single-float) (typep y 'single-float))
	 (cleavir-primop:single-float-not-greater x y))
	((and (typep x 'double-float) (typep y 'double-float))
	 (cleavir-primop:double-float-not-greater x y))
	((and (typep x 'long-float) (typep y 'long-float))
	 (cleavir-primop:long-float-not-greater x y))
	(t
	 (general-binary-not-greater x y))))

(defun binary-greater (x y)
  (cond ((and (typep x 'fixnum) (typep y 'fixnum))
	 (cleavir-primop:fixnum-greater x y))
	((and (typep x 'short-float) (typep y 'short-float))
	 (cleavir-primop:short-float-greater x y))
	((and (typep x 'single-float) (typep y 'single-float))
	 (cleavir-primop:single-float-greater x y))
	((and (typep x 'double-float) (typep y 'double-float))
	 (cleavir-primop:double-float-greater x y))
	((and (typep x 'long-float) (typep y 'long-float))
	 (cleavir-primop:long-float-greater x y))
	(t
	 (general-binary-greater x y))))

(defun binary-not-less (x y)
  (cond ((and (typep x 'fixnum) (typep y 'fixnum))
	 (cleavir-primop:fixnum-not-less x y))
	((and (typep x 'short-float) (typep y 'short-float))
	 (cleavir-primop:short-float-not-less x y))
	((and (typep x 'single-float) (typep y 'single-float))
	 (cleavir-primop:single-float-not-less x y))
	((and (typep x 'double-float) (typep y 'double-float))
	 (cleavir-primop:double-float-not-less x y))
	((and (typep x 'long-float) (typep y 'long-float))
	 (cleavir-primop:long-float-not-less x y))
	(t
	 (general-binary-not-less x y))))

(defun binary-equal (x y)
  (cond ((and (typep x 'fixnum) (typep y 'fixnum))
	 (cleavir-primop:fixnum-equal x y))
	((and (typep x 'short-float) (typep y 'short-float))
	 (cleavir-primop:short-float-equal x y))
	((and (typep x 'single-float) (typep y 'single-float))
	 (cleavir-primop:single-float-equal x y))
	((and (typep x 'double-float) (typep y 'double-float))
	 (cleavir-primop:double-float-equal x y))
	((and (typep x 'long-float) (typep y 'long-float))
	 (cleavir-primop:long-float-equal x y))
	(t
	 (general-binary-equal x y))))

(defun binary-not-equal (x y)
  (cond ((and (typep x 'fixnum) (typep y 'fixnum))
	 (cleavir-primop:fixnum-not-equal x y))
	((and (typep x 'short-float) (typep y 'short-float))
	 (cleavir-primop:short-float-not-equal x y))
	((and (typep x 'single-float) (typep y 'single-float))
	 (cleavir-primop:single-float-not-equal x y))
	((and (typep x 'double-float) (typep y 'double-float))
	 (cleavir-primop:double-float-not-equal x y))
	((and (typep x 'long-float) (typep y 'long-float))
	 (cleavir-primop:long-float-not-equal x y))
	(t
	 (general-binary-not-equal x y))))
