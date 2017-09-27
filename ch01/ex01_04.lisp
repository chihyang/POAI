(defun count-anywhere (item l)          ; l must be a list
  (cond ((null l)
         (if (equal item l)
             1
             0))
        ((atom l) 1)
        ((atom (car l))
         (if (equal item (car l))
             (+ 1 (count-anywhere item (cdr l)))
             (count-anywhere item (cdr l))))
        (t (+ (count-anywhere item (car l))
              (count-anywhere item (cdr l))))))
(count-anywhere '+ '(+ (+ (car a) b) a))
(count-anywhere 'a '())
