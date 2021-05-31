(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))
(define lat?
  (lambda (l)
    (cond
      ((null? l) #t)
      ((atom? (car l)) (lat? (cdr l)))
      (else #f))))
(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? a (car lat)) 
		(member? a (cdr lat)))))))
(define rember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      ((eq? a (car lat)) (cdr lat))
      (else (cons (car lat) 
		  (rember a 
			  (cdr lat)))))))
(define firsts
  (lambda (l)
    (cond
      ((null? l) '())
      (else (cons (car (car l))
		  (first (cdr l)))))))
(define insertR
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? old (car lat)) (cons old (cons new (cdr lat))))
      (else (cons (car lat)
		  (insertR new old (cdr lat)))))))
(define insertL
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? old (car lat)) (cons new lat))
      (else (cons (car lat)
		  (insertL new old (cdr lat)))))))
(define subst
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? old (car lat)) (cons new 
				 (cdr lat)))
      (else (cons (car lat)
		  (subst new old (cdr lat)))))))
(define subst2
  (lambda (new o1 o2 lat)
    (cond
      ((null? lat) '())
      ((or (eq? o1 (car lat)) (eq? o2 (car lat))) (cons new 
							(cdr lat)))
      (else (cons (car lat)
		  (subst2 new old (cdr lat)))))))

(define multirember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      ((eq? a (car lat)) (multirember a (cdr lat)))
      (else (cons (car lat) 
		  (multirember a 
			       (cdr lat)))))))
(define multiinsertR
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? old (car lat)) (cons old (cons new 
					   (multiinsertR new old (cdr lat)))))
      (else (cons (car lat)
		  (multiinsertR new old (cdr lat)))))))
(define multiinsertL
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? old (car lat)) (cons new 
				 (cons old (multiinsertL new old (cdr lat)))))
      (else (cons (car lat)
		  (multiinsertL new old (cdr lat)))))))
(define multisubst
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? old (car lat)) (cons new 
				 (multisubst new old (cdr lat))))
      (else (cons (car lat)
		  (multisubst new old (cdr lat)))))))
(define add1
  (lambda (n)
    (+ n 1)))
(define sub1
  (lambda (n)
    (- n 1)))
(define o+
  (lambda (n1 n2)
    (cond
      ((zero? n2) n1)
      (else (add1 (o+ n1 (sub1 n2)))))))
(define o-
  (lambda (n1 n2)
    (cond
      ((zero? n2) n1)
      (else (sub1 (o- n1 (sub1 n2)))))))
(define addtup
  (lambda (tup)
    (cond
      ((null? tup) 0)
      (else (o+ (car tup) 
	        (addtup (cdr tup)))))))
(define x
  (lambda (n m)
    (cond
      ((zero? m) 0)
      (else (o+ n (x n (sub1 m)))))))

(define tup+
  (lambda (tup1 tup2)
    (cond
      ((null? tup1) tup2)
      ((null? tup2) tup1)
      (else 
	(cons (+ (car tup1) (car tup2)) 
		  (tup+ (cdr tup1) (cdr tup2)))))))

(define o>
  (lambda (n m)
    (cond
      ((zero? n) #f)
      ((zero? m) #t)
      (else
	(o> (- n 1) (- m 1))))))

(define o=
  (lambda (n m)
    (cond
      ((zero? n) (zero? m))
      ((zero? m) #f)
      (else (o= (- n 1) (- m 1))))))

(define o1=
  (lambda (n m)
    (cond
      ((> n m) #f)
      ((> m n) #f)
      (else #t))))

(define ^
  (lambda (n m)
    (cond
      ((zero? m) 1)
      (else
	(* n (^ n (sub1 m)))))))

(define length1
  (lambda (lat)
    (cond 
      ((null? lat) 0)
      (else (add1 (length1 (cdr lat)))))))

(define pick
  (lambda (n lat)
    (cond
      ((null? lat) '())
      ((eq? n 1) (car lat))
      (else (pick (sub1 n) (cdr lat))))))

(define rempick
  (lambda (n lat)
    (cond
      ((null? lat) '())
      ((eq? n 1) (cdr lat))
      (else
	(cons (car lat) (rempick (sub1 n) (cdr lat)))))))

(define no-nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      ((number? (car lat)) (no-nums (cdr lat)))
      (else
	(cons (car lat) (no-nums (cdr lat)))))))

(define all-num
  (lambda (lat)
    (cond
      ((null? lat) '())
      (else
	(cond
	  ((not (number? (car lat))) (all-num (cdr lat)))
	  (else
	    (cons (car lat) (all-num (cdr lat)))))))))

(define eqan?
  (lambda (a1 a2)
    (cond
      ((and (number? a1) (number? a2)) (= a1 a2))
      ((or (number? a1) (number? a2)) #f)
      (else (eq? a1 a2)))))
(define occur
  (lambda (a lat)
    (cond
      ((null? lat) 0)
      (else
	(cond
	  ((eq? (car lat) a) (add1 (occur a (cdr lat))))
	  (else (occur a (cdr lat))))))))

(define one?
  (lambda (n)
    (eqan? n 1)))

(define rember*
  (lambda (a l)
    (cond
      ((null? l) '())
      ((atom? l)
       (cond 
	 ((eq? a (car l)) (rember* a (cdr l)))
	 (else
	   (cons (car l) (rember* a (cdr l))))))
      (else
	(cons (rember* a (car l)) (rember* a (cdr l)))))))

(define insertR*
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((atom? (car l))
       (cond
	 ((eq? (car l) old) 
	  (cons (car l) (cons new (insertR* new old (cdr l)))))
	 (else
	   (cons (car l) (insertR* new old (cdr l))))))
      (else
	(cons (insertR* new old (car l)) (insertR* new old (cdr l)))))))

(define occur*
  (lambda (a l)
    (cond
      ((null? l) 0)
      ((atom? (car l))
       (cond
	 ((eq? a (car l))
	  (add1 (occur* a (cdr l))))
	 (else
	   (occur* a (cdr l)))))
      (else
	(+ (occur* a (car l)) (occur* a (cdr l)))))))

(define subst*
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((atom? (car l))
       (cond
	 ((eq? old (car l))
	  (cons new (subst* new old (cdr l))))
	 (else
	   (cons (car l) (subst* new old (cdr l))))))
      (else
	(cons (subst* new old (car l)) (subst* new old (cdr l)))))))

(define insertL*
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((atom? (car l))
       (cond
	 ((eq? (car l) old) 
	  (cons new (cons (car l) (insertL* new old (cdr l)))))
	 (else
	   (cons (car l) (insertL* new old (cdr l))))))
      (else
	(cons (insertL* new old (car l)) (insertL* new old (cdr l)))))))

(define member*
  (lambda (a l)
    (cond
      ((null? l) #f)
      ((atom? (car l))
       (or (eq? a (car l)) 
	   (member* a (cdr l))))
      (else
	(or (member* a (car l)) (member* a (cdr l)))))))

(define leftmost
  (lambda (l)
    (cond
      ((null? l) '())
      (else
	(cond
	  ((atom? (car l)) (car l))
	  (else
	    (leftmost (car l))))))))

(define eqlist?
  (lambda (l1 l2)
    (cond
      ((and (null? l1) (null? l2)) #t)
      ((or (null? l1) (null? l2)) #f)
      ((and (atom? (car l1)) (atom? (car l2)))
       (and (eqan? (car l1) (car l2)) (eqlist? (cdr l1) (cdr l2))))
      ((or (atom? (car l1)) (atom? (car l2))) #f)
      (else
       (and (eqlist? (car l1) (car l2)) (eqlist? (cdr l1) (cdr l2)))))))

(define oequal?
  (lambda (s1 s2)
    (cond
      ((and (atom? s1) (atom? s2)) #t)
      ((or (atom? s1) (atom? s2)) #f)
      (else 
	(eqlist? s1 s2)))))
(define oeqlist?
  (lambda (l1 l2)
    (cond
      ((and (null? l1) (null? l2)) #t)
      ((or (null? l1) (null? l2)) #f)
      (else
	(and (oequal? (car l1) (car l2)) (oeqlist? (cdr l1) (cdr l2)))))))


