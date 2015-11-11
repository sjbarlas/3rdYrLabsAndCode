; car 7 exercise

(clear)

(deftemplate car (slot name) (slot price) (slot colour (default red)) (slot year (default 2011)))

(deffacts car-facts ; don't need asserts cause of that
	(car (name toyota) (price 3000) (year 2011))) ; make price year
	(car (name fiat) (price 2000)))
	(car (name skoda) (price 5000)))
	(car (name ford) (price 8000)))
	(car (name ford) (price 12000)))
)

(defrule cars-rule7
    (year ?y)
	(car (year ?x&:(>= ?x ?y)) (make Mer|To) (make ?m) (colour red))
	=>
	(printout t "Have a red" ?m "car from" ?x crlf)
  
)
    
(defrule year-rule
    (initial-fact)
    =>
    (printout t "Input year: " crlf)
	(bind ?y (read))
	(assert (year ?y)))
	
(reset)	; need this though
(run)
    

    