(trace first)
(first '(John Smith Bradley))
(apply #'+ '(1 2 3 4))
(funcall '+ 1 2)
(lambda (x) (+ x 1))
(symbolp '1)
(defun mappend (fn the-list)
  "Apply fn to each element of list and append the results."
  (apply #'append (mapcar fn the-list)))
