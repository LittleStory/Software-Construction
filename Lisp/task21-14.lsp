(defun delInList (cDepth cList)
  (labels
    ((depth-checker (checkList)
      (if (atom checkList) 0
          ((lambda (firstNum lastNum) 
             (if (> firstNum lastNum) 
                 firstNum
                 lastNum))
             (1+ (depth-checker (car checkList)))
             (depth-checker (cdr checkList)))))
      (depth-delete (chList chDepth)
        (cond
        ((null chList) nil)
        ((atom chList) chList)
        (T
          ((lambda (headList resultList)
             (if (= (depth-checker headList) chDepth)
                 resultList
                 (cons headList resultList)))
             (car chList)
             (depth-delete (cdr chList) chDepth))))))
    (depth-delete cList cDepth)))
        
(print (delInList 3 '( A B (C ((D E) F (G) H) I (J (K () L))) 
                 (M ( N ((O P ())) Q ((R) (S T))) (U ((V) W))) 
                 ((X) ()) (((((() Y))))) )))
(print (delInList 1 '(() (()))))