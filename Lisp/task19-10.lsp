(print 
 (let ((L1 `(FIR SED (1 2 3) (5) ()))
       (L2 `(H J U (L M N) (D E L)))
       (L3 `(4 5 (6 7))))
   (and
   	(numberp (cadddr L1))
   	(atom (cadddr L2))
   	(listp (caddr L3)))))