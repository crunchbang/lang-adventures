;; Contract: area-of-ring : number number -> number

;; Purpose: to compute the area of a ring whose
;; radius is outer and whose hole has a radius of
;; inner

;; Example: (area-of-ring 5 3) should produce 50.24

;; Definition: [refines the header]

(define (area-of-disk r)
  (* 3.14 (sqr r)))

(define (area-of-ring outer inner)
  (- (area-of-disk outer)
     (area-of-disk inner)))

;; Tests:
(area-of-ring 5 3)
;; expected values
;; 50.24
