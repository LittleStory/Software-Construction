(print
  (let ((L `(A B (C D) ((X E) F G) H)))
    (caaar (cdddr L))
  ))