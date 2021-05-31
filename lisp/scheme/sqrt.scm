(define (improve guess x)
  (average guess (/ x guess)))

(define (average a b)
  (/ (+ a b) 2))

(define (goodenough? guess x)
  (< (/ (abs (- (square guess) x)) x) 0.0001))
    

(define (square x)
  (* x x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (if (goodenough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (sroot x)
  (sqrt-iter 1.0 x))

;(define (sqrt-iter guess x)
;  (new-if (goodenough? guess x)
;    guess
;    (sqrt-iter (improve guess x) x)))
