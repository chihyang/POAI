;;; This defines make-name, name-p, name-first, name-middle, name-last
;;; middle has the default value nil
(defstruct name
  first
  (middle nil)
  last)
(setf b (make-name :first 'Barney :last 'Rubble))
(name-p b)
(name-first b)
(name-last b)
(name-middle b)
(setf (name-middle b) 'Q)
b
(defvar x 1)
(case x
  ((list 1 3 5) 10)
  ((list 2 4 6) 20))
(case x
  (1 10)
  (2 20))
(typecase x
  (number (- x))
  (list (length x)))
(ecase x
  (2 20))
(etypecase x
  (number (abs x))
  (list (length x)))