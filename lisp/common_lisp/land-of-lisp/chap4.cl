;; () == nil (false) == '() == 'nil

(defun my-length (list)
  (if list
      (1+ (my-length (cdr list)))
      0))

(defvar *arch-enemy* nil)
(defun pudding-eater (person)
  (cond ((eq person 'henry)
	 (setf *arch-enemy* 'stupid-lisp-alien)
	 '(curse you alien - you ate my pudding))
	((eq person 'johny)
	 (setf *arch-enemy* 'useless-old-johny)
	 '(i hope you choked on my pudding johny))
	(t
	 '(why you eat my pudding stranger ?))))

(defun case-pudding-eater (person)
  (case person
    ((henry)
     (setf *arch-enemy* 'stupid-lisp-alien)
     '(curse you alien - you ate my pudding))
    ((johny)
     (setf *arch-enemy* 'useless-old-johny)
     '(i hope you choked on my pudding johny))
    (otherwise
     '(why you eat my pudding stranger ?))))
    
	 

;; if, progn, when, unless, cond, case, member, eq, eql, equal, equalp
;; Compare symbols with eq. For everything else there's equal.
;; equal checks for isomorphism - when two things look the same
;; 
