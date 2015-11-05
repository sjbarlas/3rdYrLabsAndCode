(reset)

; rule to get program going
(defrule go-rule-1
    =>
    (printout t "What sort of environment is a trainee dealing with on the job? " crlf)
    (bind ?e (read))
    (assert (environment ?e))
    (run)
)

(defrule go-rule-2
    =>
    (printout t "What sort of job is a trainee dealing with? " crlf)
    (bind ?j (read))
    (assert (job ?j))
    (run)
)

; the simplest and best rule is this one
(defrule env-rule-1
    (environment papers | manuals | documents | textbooks)
     =>
    (assert (stimulus-situation verbal))
)

(defrule rule-2
	(environment pictures | illustrations | photographs | diagrams)
	=>
	(assert (stimulus-situation visual))
)

(defrule env-rule-2
    (job blah | bleh | meh | muh)
     =>
    (assert (stimulus-response worker))
)

(defrule rule-12
	(stimulus-situation verbal)
	(stimulus-response worker)
	(feedback-required TRUE)
	=>
	(assert (medium whatever))
)