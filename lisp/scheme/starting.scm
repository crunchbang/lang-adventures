(+ 137 349)
(- 1000 334)
(* 5 9)
(/ 10 5)
(+ 2.7 10)
(+ 21 35 12 7)
(* 25 4 12)
(+ (* 3 5) (- 10 6))
(+ (* 3 (+ (* 2 4) (+ 3 5 ))) (+ (- 10 7) 6))
(+ (* 3
      (+ (* 2 4)
	 (+ 3 5)))
   (+ (- 10 7)
      6))
(define size 2)
(* 5 size)
(define pi 3.14159)
(define radius 10)
(* pi (* radius radius))
(define circumference (* 2 pi radius))
(* (+ 2 (* 4 6))
   (+ 3 5 7))
(define (square x) (* x x))
(square 21)
(square (+ 2 5))
(square (square 3))
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(sum-of-squares 3 4)
(define (f a)
  (sum-of-squares (+ a 1) (* 2 a)))
(f 5)
(define (abs x)
  (cond ((> x 0) x)
	((= x 0) 0)
	((< x 0) (- x))))
(define (abs1 x)
  (cond ((< x 0) (- x))
	(else x)))
(define (abs2 x)
  (if (< x 0) 
    (- x)
    x))
(and (> 3 2) (< 1 3))
(or  (< 3 2) (> 2 3))
(not (> 3 2))
(define (>= x y)
  (not (< x y)))
