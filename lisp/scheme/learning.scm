;;; normal recursive function
(define fact
  (lambda (n)
    (cond ((zero? n)
           1)
          (else
            (* n (fact (- n 1)))))))

;;; a tail call optimized factorial
;; since the calling function "does nothing"
;; after calling itself, this function is an
;; apt candidate for tail call optimization.
;; This is an example of tail recursion.
;; The final result is returned to the top caller
;; instead of the immediate parent.
(define (fact2 n)
  (letrec
    ((fact 
       (lambda (n r)
         (cond ((zero? n)
                r)
               (else
                 (fact (- n 1) (* r n)))))))
    (fact n 1)))

(define (append2 a b)
  (cond ((null? a)
         b)
        (else
          (cons (car a)
                (append2 (cdr a) b)))))

;; tail recursive version
(define (append22 a b)
  (letrec
    ((app2 
       (lambda (a b)
         (cond ((null? a)
                b)
               (else
                 (app2 (cdr a)
                       (cons (car a) b)))))))
    (app2 (reverse a) b)))

;; use of closures
(define (compose2 f g)
  (lambda (x)
    (f (apply g x))))

(define (filter2 p a)
  (cond ((null? a)
         '())
        ((p (car a))
         (cons (car a)
               (filter2 p (cdr a))))
        (else
          (filter2 p (cdr a)))))

(define (complement2 p)
  (lambda (x)
    (not (p x))))

(define (remove p x)
  (filter2 (complement2 p) x))

(define (distance-between-points x y x2 y2)
  (let ((dx (abs (- x2 x)))
        (dy (abs (- y2 y))))
    (sqrt (+ (* dx dx)
             (* dy dy)))))

;; let evaluates all the expressions and then
;; binds them to the variables in an unspecified
;; order

(define (depth lst)
  (cond ((atom? lst)
         0)
        (else
          (max (+ 1 (depth (car lst)))
               (depth (cdr lst))))))

;; a procedure which accept variable number
;; of arguments
(define (max-list lst)
  (cond ((null? (cdr lst)) 
         (car lst))
        ((> (car lst) (cadr lst))
         (max-list (cons (car lst) (cddr lst))))
        (else
          (max-list (cdr lst)))))
(define (my-max a . b)
  (max-list (cons a b)))

;; variadic procedure using lambda
(define variadic
  (lambda x
    (display x)
    (newline)))

;; code for `list` procedure
;; (lambda x x) 
(define my-list
  (lambda x x))

(define limits
  (lambda a
    (list (apply min a)
          (apply max a))))

;; code for `not`
(define my-not
  (lambda (p)
    (eq? p #f)))

(define (my-mapcar f a)
  (cond ((null? a) 
         '())
        (else
          (cons (f (car a))
                (my-mapcar f (cdr a) )))))

(define (sum-of-squares . x)
  (apply + (my-mapcar (lambda (y)
                        (* y y))
                      x)))

(define (least-abs x)
  (apply min (my-mapcar abs x)))

(define (v* a b)
  (apply + (map * a b)))

(define (v+ a b)
  (map + a b))

;; `apply` is variadic and takes more than two 
;; arguments. When more than two arguments are 
;; supplied, the second through second-to-last
;; arguments are consed to the last argument
;; (apply map + a) -> (map + a)
;; (apply map + '((1 22 3) (3 5 2)))
;;          -> (map + '(1 22 3) '(3 5 2))
(define (vector+ . a)
  (apply map + a))

(define (my-any? p a)
  (cond ((null? a) #f)
        ((p (car a)) #t)
        (else
          (my-any? p (cdr a)))))

(define (any-null? a)
  (my-any? null? a))

(define (car-of1 a) (my-mapcar car a))

(define (cdr-of1 a) (my-mapcar cdr a))

(define (my-map f . a)
  (letrec
    ((map2 
       (lambda (a b)
         (cond ((any-null? a)
                (reverse b))
               (else
                 (map2 (cdr-of1 a)
                       (cons (apply f (car-of1 a))
                             b)))))))
    (map2 a '())))

                       
    (map2 a '())))

;; alternate version of depth using
;; higher order functions
(define (depth2 a)
  (if (pair? a)
    (+ 1 (apply max (map depth2 a)))
    0))
