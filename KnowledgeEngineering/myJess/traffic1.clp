(reset)

(assert (car moving))

(defrule traffic-stop-rule
	(traffic-light red)
	?c <- (car moving)
	=>
	(printout t "Stop car as light has changed to red" crlf)
	(retract ?c)
	(assert (car stopped))
)