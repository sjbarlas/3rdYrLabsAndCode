; car 4 exercise

(clear)
(reset)
(deftemplate car (slot name) (slot price) (slot year default 2011))


(assert (car (name toyota) (price 3000)))
(assert (car (name fiat) (price 2000)))
(assert (car (name skoda) (price 5000)))
(assert (car (name ford) (price 8000)))
(assert (car (name ford) (price 12000)))

(assert (min-price 100000))


(defrule cars-from-year1
    (year ?y)
	(car (year ?y) (make ?y))
	=>
	(printout t "Have a" ?m "car from" ?y crlf)
  
)
    
(defrule cars-from-year-rule0
    (initial-fact)
    =>
    (printout t "Input year:" crlf)
	(bind ?y (read))
	(assert (year ?y)))
	
(run)
    

    