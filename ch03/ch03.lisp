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
(defstruct player (score 0) (wins 0))
(defun determine-winner (players)
  "Increment the WINS for the player with highest score."
  (incf (player-wins (first (sort players #'> :key #'player-score)))))
(defparameter football-players
  (list (make-player :score 2 :wins 4)
        (make-player :wins 1)t
        (make-player :score 39 :wins 2)))
(determine-winner football-players)
(car football-players)
(defun determine-winner (players)
  "Increment the WINS for the player with highest score."
  (let ((temp (first (sort players #'> :key #'player-score))))
    (setf (player-wins temp) (+ (player-wins temp) 1))))
(defun length3 (list)
  (do ((len 0 (+ len 1))
       (l list (rest l)))
      ((null l) len)))
(length3 '(1 2 3 4 5 6 7 8 9 0))
(remove 1 '(1 2 3 2 1 0 -1) :test #'<)
(setf x '(a b c))
(setf y '(1 2 3))
(some #'evenp y)
(mapcar #'- y)
(defmacro while (test &rest body)
  "Repeat body while test is true."
  (list* 'loop
         (list 'unless test '(return nil))
         body))
(macroexpand-1 '(while (< i 10)
                 (print (* i i))
                 (setf i (+ i 1))))
(setf i 7)
(while (< i 10)
       (print (* i i))
       (setf i (+ i 1)))
(defmacro while (test &rest body)
  "Repeat body while test is true."
  (let ((code '(loop (unless test (return nil)) . body)))
    (subst test 'test (subst body 'body code))))
(macroexpand-1 '(while (< i 10)
                 (print (* i i))
                 (setf i (+ i 1))))
(defmacro while (test &rest body)
  "Repeat body while test is true."
  `(loop (unless ,test (return nil))
      ,@body))
;;; 3.6
(setf table (make-hash-table))
(setf (gethash 'AL table) 'Alabama)
(setf (gethash 'AK table) 'Alaska)
(setf (gethash 'AL table) 'Arizona)
(setf (gethash 'AL table) 'Arkansas)
(setf (get 'AL 'state) 'Alabama)
(setf (get 'AK 'state) 'Alaska)
(setf (get 'AL 'state) 'Arizona)
(setf (get 'AL 'state) 'Arkansas)
(setf tree '((a b) ((c)) (d e)))
(tree-equal (copy-tree tree) tree)
(defun same-shape-tree (a b)
  "Are two trees the same except for the leaves?"
  (tree-equal a b :test #'true))
(defun true (&rest ignore) t)
(same-shape-tree tree '((1 2) ((3)) (4 5)))
(same-shape-tree tree '((1 2) (3) (4 5)))
(subst 'new 'old '(old ((very old))))
(sublis '((old . new)) '(old ((very old))))
(defun english->french (words)
  (sublis '((are . va) (book . libre) (friend . ami)
            (hello . bonjour) (how . comment) (my . mon)
            (red . rouge) (you . tu))
          words))
(english->french '(hello my friend - how are you today?))
(min 2 3 4)
(round 4.8)
(setf r '(a b c d))
(setf s '(c d e))
(intersection r s)
(adjoin 'd s)
(setq bit-set1 #*11001)
(setq bit-set2 #*00101)
(bit-and bit-set1 bit-set2)
(bit-ior bit-set1 bit-set2)
(bit-andc2 bit-set1 bit-set2)
(logand #b11110 #b11001)
;;; 3.10
(setf x '(a b c))
(setf y '(d e f))
(append x y)
(nconc x y)
