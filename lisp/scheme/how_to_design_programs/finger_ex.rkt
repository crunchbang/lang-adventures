(define (inches->cm inch)
  (* inch 2.54))

(define (feet->inches feet)
  (* feet 12))

(define (yards->feet yards)
  (* yards 3))

(define (rods->yards rods)
  (* rods (/ 11 2)))

(define (furlongs->rods furl)
  (* furl 40))

(define (miles->furlong miles)
  (* miles 8))

(define (feet->cm feet)
  (inches->cm (feet->inches feet)))

(define (yards->cm yards)
  (feet->cm (yards->feet yards)))

(define (rods->inches rods)
  (feet->inches (yards->feet (rods->yards rods))))

(define (miles->feet miles)
  (yards->feet (rods->yards (furlongs->rods (miles->furlongs)))))

(define PI 3.1415)
(define (volume-cylinder radius height)
  (* PI (sqr radius) height))

(define (area-cylinder r h)
  (* 2 PI r h))

(define (area-pipe inner thickness l)
  (* 2 PI thickness l))

(define (height t)
  (* 0.5 (speed t) t))
(define g 9.8)
(define (speed t)
  (* g t))

