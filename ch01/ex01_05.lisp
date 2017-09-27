(defun dot-product (list1 list2)
  (apply #'+ (mapcar #'* list1 list2)))
(dot-product '(1 2 3) '(4 5 6))
