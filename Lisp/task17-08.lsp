(print
 (let ((L1 `(GOAL FUNC CLAUSE (DATA BASE)))
       (L2 `(2 5 (5 4 6) 8))
       (L3 `(L (K (K I) U))))
   (list
     (cadddr L1)
     (caddr  L2)
     (cadr   L3))))