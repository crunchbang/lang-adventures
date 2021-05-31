(defun hello (name)
  (format t "Hello ~a~%" name))

(hello "world")


(mapcar #'car '((1 2) (2 3) (3 50)))

(defun double-item (x) (* x 2))

(double-item 20.234)

;; defun explained
;; (defun double-item (x) (* x 2))
;; is equivalent to
;; (setf (symbol-function 'double-item)
;;    #'(lambda (x) (* x 2)))

;; function application
(+ 1 2)

(apply #'+ '(1 2))

(apply (symbol-function '+) '(1 2))

(apply #'(lambda (x y) (+ x y)) '(1 2))

;; apply applies the fn to the list made by
;; consing the rest of the rest of the arguments
(apply #'+ 1 2 3 '(4))

;; same as apply but the arguments need not be
;; given as a list
(funcall #'+ 1 2 3 4)

;; use of functions as arguments
(mapcar #'(lambda (x) (+ x 10))
        '(1 2 3)))
(mapcar #'+ '(1 2 3)
        '(100 200 300))

;; other functions which takes functions as args
(sort '(1 10 2 13 4 1 9) #'>)
(remove-if #'oddp (sort '(1 10 2 13 4 1 9) #'<))

(defun our-remove-if (fn lst)
  (if (null lst)
      nil
      (if (funcall fn (car lst))
          (our-remove-if fn (cdr lst))
          (cons (car lst) (our-remove-if fn (cdr lst))))))

(our-remove-if #'oddp (sort '(1 10 2 13 4 1 9) #'<))
