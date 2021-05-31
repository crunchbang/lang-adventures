(define (area-of-disk r)
  (* 3.14 (* r r)))

(define (area-of-ring outer inner)
  (- (area-of-disk outer)
     (area-of-disk inner)))

(define (Fahrenheit->Celsius f)
  (* 5.0 (/ (- f 32) 9)))
(define (Celsius->Fahrenheit c)
  (+ (* (/ 9.0 5) c) 32))

(define (triangle  b h)
  (* 0.5 b h))

(define (convert3 a b c)
  (+ a (* 10 b) (* 100 c)))

(define (f n)
  (+ 2 (/ n 3)))

(define (f2 n)
  (+ (sqr n) 10))

(define (f3 n)
  (+ 20 (* 0.5 (sqr n))))

(define (f4 n)
  (- 2 (/ n)))

(define (tax p)
  (* 0.15 p))

(define (netpay h)
  (* 12 h))

(define (total-profit n)
  (- (* 5 n) (+ 20 (* .5 n))))
