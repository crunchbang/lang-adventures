(define (square x)
  (* x x))
(define (sumsqr x y)
  (+ (square x) (square y)))
(define (lsqr a b c)
  (cond ((and (< a b) (< a c)) (sumsqr b c))
        ((and (< b a) (< b c)) (sumsqr a c))
        ((and (< c b) (< c a)) (sumsqr b a))))



