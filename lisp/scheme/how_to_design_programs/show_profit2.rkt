;; profit : number -> number
;; to compute the profit as the difference between
;; revenue and costs at some given ticket-price
;; Example:
;; Ticket_price -> Profit
;; $5 -> $415.2
;; $4 -> $889.2
;; $3 -> $1063.2
(define (profit ticket-price) 
  (- (revenue ticket-price)
     (cost ticket-price)))
;; revenue : number -> number
;; to compute the revenue, given the ticket-price
;; Example:
;; Ticket_price     -> Revenue
;; $5               -> $600
;; $4               -> $1080
;; $3               -> $1260
(define (revenue ticket-price) 
  (* (attendees ticket-price)
     ticket-price))
;; cost : number -> number
;; to compute the cost, given the ticket-price
;; Example:
;; Ticket_price -> Cost of show
;; $5           -> $180
;; $4           -> $405
;; $3           -> $630
(define cost_per_person 1.50)
(define (cost ticket-price) 
  (* cost_per_person (attendees ticket-price)))
;; attendees : number -> number
;; to compute the number of attendees, given the 
;; ticket-price
;; Example:
;; $5 -> 120 people
;; $4 -> 270 people
;; $3 -> 420 people
;; For a cost of $x per ticket
;; Number of people = 120 + [((5 - x)/0.10) * 15]
(define (attendees ticket-price) 
  (+ 120
     (* (/ 15 0.10) (- 5 ticket-price))))
