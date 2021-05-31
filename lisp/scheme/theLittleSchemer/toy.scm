(define atom?
  (lambda (x)
    (and (not (pair? x))
	 (not (null? x)))))

(define lat?
  (lambda (l)
    (cond
     ((null? l) #t)
     ((atom? (car l)) (lat? (cdr l)))
     (else #f))))

(define member?
  (lambda (ele l)
    (cond
     ((null? l) #f)
     (else (or (equal? (car l) ele)
	       (member? ele (cdr l)))))))

(define firsts
  (lambda (l)
    (cond
     ((null? l) '())
     (else
      (cons (car (car l))
	    (firsts (cdr l)))))))

(define insertR
  (lambda (new old lat)
    (cond
     ((null? lat) '())
     ((eq? (car lat) old)
      (cons old
	    (cons new (cdr lat))))
     (else
      (cons (car lat)
	    (insertR new old (cdr lat)))))))

(define insertL
  (lambda (new old lat)
    (cond
     ((null? lat) '())
     ((eq? (car lat) old)
      (cons new lat)) 
     (else
      (cons (car lat)
	    (insertL new old (cdr lat)))))))

(define subst
  (lambda (new old lat)
    (cond
     ((null? lat) '())
     ((eq? (car lat) old)
      (cons new (cdr lat)))
     (else
      (cons (car lat)
	    (subst new old (cdr lat)))))))

(define subst2
  (lambda (new o1 o2 lat)
    (cond
     ((null? lat) '())
     ((or (eq? (car lat) o1) (eq? (car lat) o2))
      (cons new (cdr lat)))
     (else
      (cons (car lat)
	    (subst2 new o1 o2 (cdr lat)))))))

(define multirember
  (lambda (a lat)
    (cond
     ((null? lat) '())
     ((equal? (car lat) a)
      (multirember a (cdr lat)))
     (else
      (cons (car lat)
	    (multirember a (cdr lat)))))))


(define multiinsertR
  (lambda (new old lat)
    (cond
     ((null? lat) '())
     ((eq? (car lat) old)
      (cons old
	    (cons new (multiinsertR new old (cdr lat)))))
     (else
      (cons (car lat)
	    (multiinsertR new old (cdr lat)))))))

(define multiinsertL
  (lambda (new old lat)
    (cond
     ((null? lat) '())
     ((eq? (car lat) old)
      (cons new
	    (cons old (multiinsertL new old (cdr lat))))) 
     (else
      (cons (car lat)
	    (multiinsertL new old (cdr lat)))))))

(define multisubst
  (lambda (new old lat)
    (cond
     ((null? lat) '())
     ((eq? (car lat) old)
      (cons new (multisubst new old (cdr lat))))
     (else
      (cons (car lat)
	    (multisubst new old (cdr lat)))))))

(define add1
  (lambda (n)
    (+ n 1)))

(define sub1
  (lambda (n)
    (- n 1)))

(define +'
  (lambda (a b)
    (cond
     ((zero? b) a)
     (else
      (add1 (+' a (sub1 b)))))))

(define -'
  (lambda (a b)
    (cond
     ((zero? b) a)
     (else
      (sub1 (-' a (sub1 b)))))))

(define addtup
  (lambda (tup)
    (cond
     ((null? tup) 0)
     (else
      (+ (car tup) (addtup (cdr tup)))))))

(define x
  (lambda (a b)
    (cond
     ((zero? b) 0)
     (else
      (+ a (x a (sub1 b)))))))

(define tup+
  (lambda (tup1 tup2)
    (cond
     ((null? tup1) tup2)
     ((null? tup2) tup1)
     (else
      (cons (+' (car tup1) (car tup2))
	    (tup+ (cdr tup1) (cdr tup2)))))))

(define >'
  (lambda (n m)
    (cond
     ((zero? n) #f)
     ((zero? m) #t)
     (else
      (>' (sub1 n) (sub1 m))))))

(define <'
  (lambda (n m)
    (cond
     ((zero? m) #f)
     ((zero? n) #t)
     (else
      (<' (sub1 n) (sub1 m))))))

(define ='
  (lambda (n m)
    (cond
     ((zero? n) (zero? m))
     ((zero? m) #f)
     (else
      (=' (sub1 n) (sub1 m))))))

(define pow
  (lambda (b e)
    (cond
     ((zero? e) 1)
     (else
      (* b (pow b (sub1 e)))))))

(define quo
  (lambda (n m)
    (cond
     ((< n m) 0)
     (else
      (add1 (quo (- n m) m))))))

(define length'
  (lambda (lat)
    (cond
     ((null? lat) 0)
     (else
      (add1 (length' (cdr lat)))))))

(define pick
  (lambda (n lat)
    (cond
     ((zero? (sub1 n)) (car lat))
     (else
      (pick (sub1 n) (cdr lat))))))

(define rempick
  (lambda (n lat)
    (cond
     ((zero? (sub1 n)) (cdr lat))
     (else
      (cons (car lat)
	    (rempick (sub1 n) (cdr lat)))))))

(define no-nums
  (lambda (lat)
    (cond
     ((null? lat) '())
     ((number? (car lat))
      (no-nums (cdr lat)))
     (else
      (cons (car lat)
	    (no-nums (cdr lat)))))))

(define all-nums
  (lambda (lat)
    (cond
     ((null? lat) '())
     ((number? (car lat))
      (cons (car lat)
	    (all-nums (cdr lat))))
     (else
      (all-nums (cdr lat))))))

(define eqan?
  (lambda (a1 a2)
    (cond
     ((and (number? a1) (number? a2)) (= a1 a2))
     ((or (number? a1) (number? a2)) #f)
     (else
      (eq? a1 a2)))))
(define occur
  (lambda (a lat)
    (cond
     ((null? lat) 0)
     ((eqan? a (car lat))
      (add1 (occur a (cdr lat))))
     (else
      (occur a (cdr lat))))))

(define one?
  (lambda (n)
    (= n 1)))

(define rempick
  (lambda (n lat)
    (cond
     ((one? n) (cdr lat))
     (else
      (cons (car lat)
	    (rempick (sub1 n) (cdr lat)))))))

(define rember*
  (lambda (a l)
    (cond
     ((null? l) '())
     ((atom? (car l))
      (cond
       ((eq? a (car l))
	(rember* a (cdr l)))
       (else
	(cons (car l)
	      (rember* a (cdr l))))))
     (else
      (cons (rember* a (car l))
	    (rember* a (cdr l)))))))

(define insertR*
  (lambda (new old l)
    (cond
     ((null? l) '())
     ((atom? (car l))
      (cond
       ((eq? old (car l))
	(cons old (cons new
			(insertR* new old (cdr l)))))
       (else
	(cons (car l)
	      (insertR* new old (cdr l))))))
     (else
      (cons (insertR* new old (car l))
	    (insertR* new old (cdr l)))))))


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
      (+ (occur* a (car l))
	 (occur* a (cdr l)))))))

(define subst*
  (lambda (new old l)
    (cond
     ((null? l) '())
     ((atom? (car l))
      (cond
       ((eq? old (car l))
	(cons new (subst* new old (cdr l))))
       (else
	(cons (car l)
	      (subst* new old (cdr l))))))
     (else
      (cons (subst* new old (car l))
	    (subst* new old (cdr l)))))))

(define insertL*
  (lambda (new old l)
    (cond
     ((null? l) '())
     ((atom? (car l))
      (cond
       ((eq? (car l) old)
	(cons new (cons old (insertL* new old (cdr l)))))
       (else
	(cons (car l)
	      (insertL* new old (cdr l))))))
     (else
      (cons (insertL* new old (car l))
	    (insertL* new old (cdr l)))))))

(define member*
  (lambda (a l)
    (cond
     ((null? l) #f)
     ((atom? (car l))
      (or (eq? a (car l))
	  (member* a (cdr l))))
     (else
      (or (member* a (car l))
	  (member* a (cdr l)))))))

(define leftmost
  (lambda (l)
    (cond
     ((atom? (car l)) (car l))
     (else
      (leftmost (car l))))))

;; (and a b) == (cond (a b) (else #f))
;; (or a b) == (cond (a #t) (else b))

;;(define eqlist?
;;  (lambda (l1 l2)
;;    (cond
;;     ((and (null? l1) (null? l2)) #t)
;;     ((or  (null? l1) (null? l2)) #f)
;;     ((and (atom? (car l1)) (atom? (car l2)))
;;       (and (eqan?   (car l1) (car l2))
;;	    (eqlist? (cdr l1) (cdr l2))))
;;     ((or  (atom? (car l1)) (atom? (car l2))) #f)
;;     (else
;;      (and (eqlist? (car l1) (car l2))
;;	   (eqlist? (cdr l1) (cdr l2)))))))

(define equal?'
  (lambda (s1 s2)
    (cond
     ((and (atom? s1) (atom? s2))
      (eqan? s1 s2))
     ((or  (atom? s1) (atom? s2))
      #f)
     (else
      (eqlist? s1 s2)))))

(define eqlist?
  (lambda (l1 l2)
    (cond
     ((and (null? l1) (null? l2)) #t)
     ((or  (null? l1) (null? l2)) #f)
     (else
      (and (equal?' (car l1) (car l2))
	   (equal?' (cdr l1) (cdr l2)))))))

(define rember
  (lambda (s l)
    (cond
     ((null? l) '())
     ((equal?' (car l) s) (cdr l))
     (else
      (cons (car l)
	    (rember s (cdr l)))))))


;;(define numbered?
;;  (lambda (aexp)
;;    (cond
;;     ((atom? aexp) (number? aexp))
;;     ((or (eq? (car (cdr aexp)) '+)
;;	  (eq? (car (cdr aexp)) 'x)
;;	  (eq? (car (cdr aexp)) '^))
;;      (and (numbered? (car aexp))
;;	   (numbered? (car (cdr (cdr aexp))))))
;;     (else
;;      #f))))

;; Checks to see if aexp is composed of only numbers
(define numbered?
  (lambda (aexp)
    (cond
     ((atom? aexp) (number? aexp))
     (else
      (and (numbered? (car aexp))
	   (numbered? (car (cdr (cdr aexp)))))))))

(define 1st-sub-exp
  (lambda (aexp)
    (car (cdr aexp))))

(define 2nd-sub-exp
  (lambda (aexp)
    (car (cdr (cdr aexp)))))

(define operator
  (lambda (aexp)
    (car aexp)))

(define sero?
  (lambda (n)
    (null? n)))

(define edd1
  (lambda (n)
    (cons '() n)))

(define zub1
  (lambda (n)
    (cdr n)))

(define z+
  (lambda (a b)
    (cond
     ((sero? b) a)
     (else
      (edd1 (z+ a (zub1 b)))))))

(define set?
  (lambda (s)
    (cond
     ((null? s) #t)
     ((member? (car s) (cdr s)) #f)
     (else
      (set? (cdr s))))))

(define makeset
  (lambda (l)
    (cond
     ((null? l) '())
     (else
      (cons (car l)
	    (makeset (multirember (car l)
				  (cdr l))))))))

(define subset?
  (lambda (set1 set2)
    (cond
     ((null? set1) #t)
     (else
      (and (member? (car set1) set2)
	   (subset? (cdr set1) set2))))))

(define eqset?
  (lambda (set1 set2)
    (and (subset? set1 set2)
	 (subset? set2 set1))))

(define intersect?
  (lambda (set1 set2)
    (cond
     ((null? set1) #f)
     (else (or (member? (car set1) set2)
	       (intersect? (cdr set1) set2))))))

(define intersect
  (lambda (set1 set2)
    (cond
     ((null? set1) '())
     ((member? (car set1) set2)
      (cons (car set1) (intersect (cdr set1) set2)))
     (else
      (intersect (cdr set1) set2)))))

(define union
  (lambda (set1 set2)
    (cond
     ((null? set1) set2)
     ((member (car set1) set2)
      (union (cdr set1) set2))
     (else
      (cons (car set1)
	    (union (cdr set1) set2))))))

(define intersectall
  (lambda (l-set)
    (cond
     ((null? (cdr l-set)) (car l-set))
     (else
      (intersect (car l-set)
		 (intersectall (cdr l-set)))))))

(define a-pair?
  (lambda (l)
    (cond
     ((atom? l) #f)
     ((null? l) #f)
     ((null? (cdr l)) #f)
     ((null? (cddr l)) #t)
     (else
      #f))))

(define first
  (lambda (p)
    (car p)))
(define second
  (lambda (p)
    (car (cdr p))))
(define build
  (lambda (s1 s2)
    (cons s1 (cons s2 '()))))
(define third
  (lambda (p)
    (car (cdr (cdr p)))))
(define revpair
  (lambda (p)
    (build (second p) (first p))))
(define fun?
  (lambda (rel)
    (set? (firsts rel))))
(define revrel
  (lambda (rel)
    (cond
     ((null? rel) '())
     (else
      (cons (revpair (car rel))
	    (revrel (cdr rel)))))))
(define seconds
  (lambda (lp)
    (cond
     ((null? lp) '())
     (else
      (cons (second (car lp))
	    (seconds (cdr lp)))))))
(define fullfun?
  (lambda (f)
    (set? (seconds f))))
;; (fun? (revrel f))

(define rember-f
  (lambda (test?)
    (lambda (a l)
      (cond
       ((null? l) '())
       ((test? a (car l)) (cdr l))
       (else
	(cons (car l)
	      ((rember-f test?) a (cdr l))))))))

(define insertL-f
  (lambda (test?)
    (lambda (new old l)
      (cond
       ((null? l) '())
       ((test? old (car l))
	(cons new (cons old (cdr l))))
       (else
	(cons (car l)
	      ((insertL-f test?) new old (cdr l))))))))

(define insertR-f
  (lambda (test?)
    (lambda (new old l)
      (cond
       ((null? l) '())
       ((test? old (car l))
	(cons old (cons new (cdr l))))
       (else
	(cons (car l)
	      ((insertR-f test?) new old (cdr l))))))))

(define seqL
  (lambda (a b c)
    (cons a (cons b c))))
(define seqR
  (lambda (a b c)
    (cons b (cons a c))))
(define insert-g
  (lambda (seq)
    (lambda (new old l)
      (cond
       ((null? l) '())
       ((eq? old (car l))
	(seq new old (cdr l)))
       (else
	(cons (car l)
	      ((insert-g seq) new old (cdr l))))))))
(define seqS
  (lambda (new old l)
    (cons new l)))

(define nsubst (insert-g seqS))

(define atom-to-function
  (lambda (y)
    (cond
     ((eq? y '+) +)
     ((eq? y 'x) *)
     (else
      pow))))

;;(define value
;;  (lambda (nexp)
;;    (cond
;;     ((atom? nexp) nexp)
;;     (else
;;      ((atom-to-function (operator nexp))
;;       (value (1st-sub-exp nexp))
;;       (value (2nd-sub-exp nexp)))))))

(define multirember&co
  (lambda (a lat col)
    (cond
     ((null? lat)
      (col '() '()))
     ((eq? a (car lat))
      (multirember&co a (cdr lat)
		      (lambda (newlat seen)
			(col newlat
			     (cons (car lat) seen)))))
     (else
      (multirember&co a (cdr lat)
		      (lambda (newlat seen)
			(col (cons (car lat) newlat)
			     seen)))))))

(define a-friend
  (lambda (x y)
    (null? y)))

(define multiinsertLR
  (lambda (new oldL oldR lat)
    (cond
     ((null? lat) '())
     ((eq? (car lat) oldL)
      (cons new
	    (cons oldL (multiinsertLR new oldL oldR (cdr lat)))))
     ((eq? (car lat) oldR)
      (cons oldR
	    (cons new (multiinsertLR new oldL oldR (cdr lat)))))
     (else
      (cons (car lat)
	    (multiinsertLR new oldL oldR (cdr lat)))))))

(define multiinsertLR&co
  (lambda (new oldL oldR lat col)
    (cond
     ((null? lat) (col '() 0 0))
     ((eq? (car lat) oldL)
      (multiinsertLR&co new oldL oldR (cdr lat)
			(lambda (newlat nl nr)
			  (col (cons new (cons oldL newlat))
			       (add1 nl)
			       nr))))
     ((eq? (car lat) oldR)
      (multiinsertLR&co new oldL oldR (cdr lat)
			(lambda (newlat nl nr)
			  (col (cons oldR (cons new newlat))
			       nl
			       (add1 nr)))))
     (else
      (multiinsertLR&co new oldL oldR (cdr lat)
			(lambda (newlat nl nr)
			  (col (cons (car lat) newlat)
			       nl nr)))))))


(define n-col
  (lambda (lat nl nr)
    nr))

(define even?
  (lambda (n)
    (zero? (modulo n 2))))

(define evens-only*
  (lambda (l)
    (cond
     ((null? l) '())
     ((atom? (car l))
      (cond
       ((even? (car l))
	(cons (car l)
	      (evens-only* (cdr l))))
       (else
	(evens-only* (cdr l)))))
     (else
      (cons (evens-only* (car l))
	    (evens-only* (cdr l)))))))


(define evens-only*&co
  (lambda (l col)
    (cond
     ((null? l) (col '() 1 0))
     ((atom? (car l))
      (cond
       ((even? (car l))
	(evens-only*&co (cdr l)
			(lambda (newl evp ods)
			  (col (cons (car l) newl)
			       (* (car l) evp)
			       ods))))
       (else
	(evens-only*&co (cdr l)
			(lambda (newl evp ods)
			  (col newl evp
			       (+ (car l) ods)))))))
     (else
      (evens-only*&co (car l)
		      (lambda (newla evpa odsa)
			(evens-only*&co (cdr l)
					(lambda (newld evpd odsd)
					  (col (cons newla newld)
					       (* evpa evpd)
					       (+ odsa odsd))))))))))

(define t-col
  (lambda (l p s)
    (cons s
	  (cons p l))))


(define looking
  (lambda (a lat)
    (keep-looking a (pick 1 lat) lat)))
(define keep-looking
  (lambda (a sorn lat)
    (cond
     ((number? sorn)
      (keep-looking a (pick sorn lat) lat))
     (else
      (eq? sorn a)))))
(define shift
  (lambda (pair)
    (build (first (first pair))
	   (build (second (first pair)) (second pair)))))

(define length*
  (lambda (l)
    (cond
     ((atom? l) 1)
     (else
      (+ (length* (first l))
	 (length* (second l)))))))

(define align
  (lambda (pora)
    (cond
     ((atom? pora) pora)
     ((a-pair? (first pora))
      (align (shift pora)))
     (else
      (build (first pora)
	     (align (second pora)))))))

(define A
  (lambda (n m)
    (cond
     ((zero? n) (add1 m))
     ((zero? m) (A (sub1 n) 1))
     (else (A (sub1 n)
	      (A n (sub1 m)))))))

(define eternity
  (lambda (x)
    (eternity x)))

(define length0
  (lambda (l)
    (cond
     ((null? l) 0)
     (else (add1 (eternity (cdr l)))))))

(define length1
  (lambda (l)
    (cond
     ((null? l) 0)
     (else (add1 (length0 (cdr l)))))))

(((lambda (mk-length)
    (mk-length mk-length))
  (lambda (mk-length)
    (lambda (l)
      (cond
       ((null? l) 0)
       (else
	(add1 ((mk-length mk-length) (cdr l))))))))
 '(2 3 4 23 23))

(((lambda (mk-length)
    (mk-length mk-length))
  (lambda (mk-length)
    ((lambda (length)
       (lambda (l)
	 (cond
	  ((null?  l) 0)
	  (else
	   (add1 (length (cdr l)))))))
     (lambda (x)
       ((mk-length mk-length) x)))))
 '(1 2 3))

(define new-entry build)

(define lookup-in-entry
  (lambda (name entry entry-f)
    (lookup-in-entry-help name
			  (first entry)
			  (second entry)
			  entry-f)))

(define lookup-in-entry-help
  (lambda (name names values entry-f)
    (cond
     ((null? names) (entry-f name))
     ((eq? name (car names))
      (car values))
     (else
      (lookup-in-entry-help name
			    (cdr names)
			    (cdr values)
			    entry-f)))))
	  
(define extend-table cons)

(define lookup-in-table
  (lambda (name table table-f)
    (cond
     ((null? table) (table-f name))
     (else
      (lookup-in-entry name
		       (car table)
		       (lambda (name)
			 (lookup-in-table name
					  (cdr table)
					  table-f)))))))
;; *lambda, *const, *identifier, *quote, *application, *cond

(define expression-to-action
  (lambda (e)
    (cond
     ((atom? e) (atom-to-action e))
     (else (list-to-action e)))))

(define atom-to-action
  (lambda (e)
    (cond
     ((number? e) *const)
     ((eq? e #t) *const)
     ((eq? e #f) *const)
     ((eq? e 'cons) *const)
     ((eq? e 'car) *const)
     ((eq? e 'cdr) *const)
     ((eq? e 'null?) *const)
     ((eq? e 'eq?) *const)
     ((eq? e 'zero?) *const)
     ((eq? e 'atom?) *const)
     ((eq? e 'add1) *const)
     ((eq? e 'sub1) *const)
     ((eq? e 'number?) *const)
     (else *identifier))))

(define list-to-action
  (lambda (e)
    (cond
     ((atom? (car e))
      (cond
       ((eq? (car e) 'quote) *quote)
       ((eq? (car e) 'lambda) *lambda)
       ((eq? (car e) 'cond) *cond)
       (else *application)))
      (else *application))))

(define value
  (lambda (e)
    (meaning e '())))
(define meaning
  (lambda (e table)
    ((expression-to-action e) e table)))

(define *const
  (lambda (e table)
    (cond
     ((number? e) e)
     ((eq? e #t) #t)
     ((eq? e #f) #t)
     (else (build 'primitive e)))))

(define *quote
  (lambda (e table)
    (text-of e)))
(define text-of second)
     
(define *identifiers
  (lambda (e table)
    (lookup-in-table e table initial-table)))
(define initial-table
  (lambda (name)
    (car '())))

(define *lambda
  (lambda (e table)
    (build 'non-primitive
	   (cons table (cdr e)))))
(define table-of first)
(define formals-of second)
(define body-of third)

(define evcon
  (lambda (lines table)
    (cond
     ((else? (question-of (car lines)))
      (meaning (answer-of (car lines)) table))
     ((meaning (question-of (car lines))
	       table)
      (meaning (answer-of (car lines))
	       table))
     (else
      (evcon (cdr lines) table)))))

(define question-of first)
(define answer-of second)
(define else?
  (lambda (x)
    (cond
     ((atom? x) (eq? x 'else))
     (else #f))))

(define *cond
  (lambda (e table)
    ((evcon (cond-lines-of e) table))))
(define cond-lines-of cdr)

(define evlis
  (lambda (args table)
    (cond
     ((null? args) '())
     (else
      (cons (meaning (car args) table)
	    (evlis (cdr args) table))))))

(define *application
  (lambda (e table)
    (apply
     (meaning (function-of e) table)
     (meaning (arguments-of e) table))))
(define function-of car)
(define arguments-of cdr)

(define primitive?
  (lambda (l)
    (eq? (first l) 'primitive)))
(define non-primitive?
  (lambda (l)
    (eq? (first l) 'non-primitive)))    

(define apply
  (lambda (fun vals)
    (cond
     ((primitive? fun)
      (apply-primitive (second fun) vals))
     ((non-primitive? fun)
      (apply-closure (second fun) vals)))))

(define apply-primitive
  (lambda (name vals)
    (cond
     ((eq? name 'cons)
      (cons (first vals) (second vals)))
     ((eq? name 'car)
      (car (first vals)))
     ((eq? name 'cdr)
      (cdr (first vals)))
     ((eq? name 'null?)
      (null? (first vals)))
     ((eq? name 'eq?)
      (eq? (first vals) (second vals)))
     ((eq? name 'atom?)
      (:atom? (first vals)))
     ((eq? name 'zero?)
      (zero? (first vals)))
     ((eq? name 'number?)
      (number? (first vals)))
     ((eq? name 'add1)
      (add1 (first vals)))
     ((eq? name 'sub1)
      (sub1 (first vals))))))
	   
(define :atom?
  (lambda (x)
    (cond
     ((atom? x) #t)
     ((null? x) #f)
     ((eq? (car x) 'primitive)
      #t)
     ((eq? (car x) 'non-primitive)
      #t)
     (else #f))))
  
	      
	  
