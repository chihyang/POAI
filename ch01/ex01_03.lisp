(defun count-atoms (l)
  (cond ((null l) 0)
        ((atom l) 1)
        (t (+ 1 (count-atoms (cdr l))))))
(count-atoms '(a 'b (c d e) c))
