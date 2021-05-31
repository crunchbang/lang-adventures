
(defparameter *nodes* '((living-room
			 (you are in the living-room.
			  A wizard is snoring loudly on the couch))
		        (garden
			 (you are in a beautiful garden.
			  There is a well in front of you))
		        (attic
			 (you are in the attic.
			  There is a giant welding torch in the corner.))))

(defun describe-location (location nodes)
  (cadr (assoc location nodes)))

(defparameter *edges* '((living-room (garden west door)
			             (attic upstairs ladder))
			(garden      (living-room east door))
			(attic       (living-room downstairs ladder))))

(defun describe-path (edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))

(defun describe-paths (location edges)
  (apply #'append (mapcar #'describe-path (cdr (assoc location edges)))))

(defparameter *objects* '(whiskey bucket frog chain))

(defparameter *object-locations* '((whiskey living-room)
				   (bucket living-room)
				   (chain garden)
				   (frog garden)))

;; Chapter Highlights:
;; Use of assoc on associative lists to get the specified entry
;; Use of quasi quoting(`) to display evaluated expression(preceded by comma) within symbols
