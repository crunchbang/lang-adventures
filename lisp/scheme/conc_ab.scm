(define (power base exponent)
  (if (= exponent 0)
    1
    (* (power base (- exponent 1))
       base)))

(define square
  (lambda (n)
    (if (= n 0)
      0
      (if (even? n)
        (+ (square (/ n 2))
           (* 3 (square (/ n 2))))
        (+ (square (- n 1))
           (- (+ n n) 1))))))

(define (my-quotient n d)
  (define quot 
    (lambda (n d)
      (if (< n d)
        0
        (+ 1 (quot (- n d) d)))))
  (cond ((< d 0)
          (- (quot n (- d))))
          ((< n 0)
          (- (quot (- n) d)))
          (else
          (quot n d))))

(define (my-product m n)
  (cond ((< m 0)
         (- (my-product (- m) n)))
        ((< n 0)
         (- (my-product m (- n))))
        ((= n 1)
         m)
        (else
          (+ (my-product m (- n 1))
             m))))
  
(define (no-of-d n d)
  (cond ((< n d)
         0)
        ((= d (remainder n 10))
         (+ 1 (no-of-d (quotient n 10) d)))
        (else
          (no-of-d (quotient n 10) d))))


    
