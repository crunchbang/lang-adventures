(defun play (p1 p2)
  (cond
    ((equal p1 'ROCK)     (or (and (equal p2 'PAPER)   'P2-WINS)
			      (and (equal p2 'SCISSORS) 'P1-WINS)))
    ((equal p1 'PAPER)    (or (and (equal p2 'ROCK)   'P1-WINS)
			      (and (equal p2 'SCISSORS) 'P2-WINS)))
    ((equal p1 'SCISSORS) (or (and (equal p2 'ROCK)   'P2-WINS)
			      (and (equal p2 'PAPER) 'P1-WINS)))
    (T
     'TIE)))

(defun throw-die ()
  "Pick a random number from 1 to 6(inclusive)"
  (let ((choice (random 6)))
    (if (zerop choice)
	6
	choice)))
(defun throw-dice ()
  (list (throw-die) (throw-die)))
(defun snake-eyes-p (throw)
  (equal throw '(1 1)))
(defun boxcars-p (throw)
  (equal throw '(6 6)))
(defun instant-win-p (throw)
  (let ((sum (+ (first throw)
		(second throw))))
    (or (equal sum 7)
	(equal sum 11))))
(defun instant-loss-p (throw)
  (let ((sum (+ (first throw)
		(second throw))))
    (or (equal sum 2)
	(equal sum 3)
	(equal sum 12))))
(defun say-throw (throw)
  (let ((sum (+ (first throw)
		(second throw))))
    (cond
      ((snake-eyes-p throw) 'snake-eyes)
      ((boxcars-p throw) 'boxcars)
      (T sum))))
(defun craps ()
  (let* ((throw (throw-dice))
	 (result (list 'THROW (first throw) (second throw) '--)))
    (cond
      ((instant-loss-p throw)
       (append result (list (say-throw throw) '-- 'YOU 'LOSE)))
      ((instant-win-p throw)
       (append result (list (say-throw throw) '-- 'YOU 'WIN)))
      (T
       (append result (list 'YOUR 'POINT 'IS (say-throw throw)))))))
(defun try-for-points (point)
  (let* ((throw (throw-dice))
	 (newpoint (+ (first throw) (second throw)))
	 (result (list 'THROW (first throw) (second throw) '--)))
    (cond
      ((equal newpoint point)
       (append result (list (say-throw throw) '-- 'YOU 'WIN)))
      ((equal newpoint 7)
       (append result (list (say-throw throw) '-- 'YOU 'LOSE)))
      (T
       (append result (list (say-throw throw) '-- 'THROW 'AGAIN))))))
       
       

