;01
(define lbox
  (lambda (l)
    (if (null? l) 
      '()
      (if (null? (cdr l))
	l
	(lbox (cdr l))))))

