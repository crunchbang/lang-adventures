(define (fact n)
  (define (fact-iter product counter max-count)
    (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))
  (fact-iter 1 1 n))

(define (pascal n)
  (define (C n r)
    (if (> r n)
      0
      (+ (/ (fact n) (* (fact r) (fact (- n r)))) (C n (+ 1 r)))))
  (cond ((= n 0) 1)
        (else 
          ;(C n 0)
          (+ (pascal (- n 1)) (C n 0)))))
    

