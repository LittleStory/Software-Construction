(print
(let  ((L1 `(DOG (CAT) FOX ()))
       (L2 `(RET GET PUT OUT IN))
       (L3 `(MOV ADD (MUL DEV))))
  (append
   (list (car L1) (cadr L1))
   (cdddr L1)
   (list (car L2)
         (cadr L2)
         (caddr L2))
   (cddddr L2)
   (list (car L3) (cadr L3))
   (cdddr L3))))