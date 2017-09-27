(defun combine-all (xlist ylist)
  "Return a list of lists formed by appending a y to an x.  
E.g., (combine-all '((a) (b)) '((1) (2)))
-> ((A 1) (B 1) (A 2) (B 2))."
  (combine xlist ylist #'append))
(defun combine (xlist ylist func)
  (mappend #'(lambda (y)
               (mapcar #'(lambda (x) (funcall func x y))
                       xlist))
           ylist))
(combine-all '((1) (2)) '((3) (4)))
