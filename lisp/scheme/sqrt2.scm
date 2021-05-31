(define (average a b)
  (/ (+ a b) 2))

(define (square x)
  (* x x))

(define (sroot x)
  (define (goodenough? guess)
    (< (/ (abs (- (square guess) x)) x) 0.0001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (goodenough? guess)
      guess
      (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))
