;The first program
(begin
  (display "Hello, World!")
  (newline))

(define disp-args
  (lambda (arg1 arg2 arg3)
    (display arg1)
    (display #\space)
    (display arg2)
    (display #\space)
    (display arg3)
    (display #\space)
    (newline)))
;; iteration using named let (or is it recursion)?

(define list-position
  (lambda (obj lst)
    (let loop ((i 0)
               (l lst))
      (if (null? l) #f
        (if (eqv? (car l) obj) i
          (loop (+ i 1) (cdr l)))))))

(define reverseit
  (lambda (lst)
    (let loop ((l lst)
               (r '()))
      (if (null? l) r
        (loop (cdr l) (cons (car l) r))))))

;;(define-macro when
;;              (lambda (test . branch)
;;                (list 'if test
;;                      (cons 'begin branch))))
                      
(define-macro unless
              (lambda (test . branch)
                (list 'if (list 'not test)
                      (cons 'begin branch))))

(define-macro when
              (lambda (test . branch)
                `(if ,test
                     (begin ,@branch))))

(define (my-length lst)
  (cond ((null? lst)
         0)
        (else
          (+ 1 (my-length (cdr lst))))))

(define (my-append lst1 lst2)
  (cond ((null? lst2)
         lst2)
        (cons (car lst1) 
              (my-append (cdr lst1) lst2))))


(define (list-sum lst)
;;  (display "list: ")
;;  (display lst)
;;  (newline)
  (if (null? lst)
    0
    (+ (car lst)
       (list-sum (cdr lst)))))

(define list-display
  (lambda (lst)
    (if (null? lst)
      #f
      (begin
        (display (car lst))
        (list-display (cdr lst))))))

(define (list-each f lst)
  (cond ((null? lst)
         #f)
        (else
          (f (car lst))
          (list-each f (cdr lst)))))
(define display-fs
  (lambda (a b . c)
    (display a)
    (newline)
    (display b)
    (newline)
    (display c)))
