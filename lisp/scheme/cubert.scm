(define (croot x)
  (croot-iter 1.0 x))

(define (croot-iter guess x)
  (if (goodenough? guess x)
    guess
    (croot-iter (improve guess x) x)))

(define (goodenough? guess x)
;  (< (/ (abs (- (cube guess) x)) x) 0.001))
  (< (abs (- (cube guess) x)) 0.001))

(define (square x)
  (* x x))

(define (cube x)
  (* x (square x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3.0))
