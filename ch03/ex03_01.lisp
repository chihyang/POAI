((lambda (x)
   (+ x
      ((lambda (x)
         (* x x))
       x)))
 6)