(define (plus a b)
  (define (inc x)
    (+ x 1))
  (define (dec x)
    (- x 1))
  (if (= a 0)
    b
    (inc (plus (dec a) b))))
