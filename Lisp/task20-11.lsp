(defun y (N)
    (labels
        ((ij-func (i j)
            (+ (/ (log i) (log 10)) (log j)))
         (y-iter (i j sumSec sumOne)
            (cond ((> i N) sumOne)
                  ((> j N) (y-iter (+ i 1) 1 0 (+ sumOne sumSec)))
                  (T (y-iter i (+ j 1) (+ sumSec (ij-func i j)) sumOne)))))
        (y-iter 1 1 0 0)))