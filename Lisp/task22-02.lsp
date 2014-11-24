(defmacro for (parm-iter (continue-expr &body cont-parm) &body body)
  (let* ((iter-value (gensym))
            (func-name (gensym))) 
    `(let (,@parm-iter ,iter-value)
       (labels ((,func-name ()
                      (if ,continue-expr
                          (progn (setq ,iter-value (progn ,@body))
                                      ,@cont-parm
                                      (,func-name))
                          ,iter-value)))
                   (,func-name)))))
 
 (defun y (N)
    (labels ((ij-func (i j)
                  (+ (/ (log i) (log 10)) (log j)))
                (double-sum (End sum)
                  (for ((in 1)) ((<= in End) (incf in)) 
                      (for ((jn 1)) ((<= jn End) (incf jn)) 
                          (incf sum (ij-func in jn))))
                    sum))
                (double-sum N 0)))
                
