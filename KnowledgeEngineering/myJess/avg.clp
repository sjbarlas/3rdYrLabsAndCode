; LAB 2

(clear)


(bind ?l (create$ 1 2 3 4 5))
(bind ?pl (create$ milk 2.40 eggs 1.50 bread 1 specialK 4 sugar 2.30 tea 2 coffee 3)) 

;(deffunction find-price (?item ?price-list)
    
; for a list of numbers    
(deffunction avg (?l)
    (bind ?n (length$ ?l))
    (bind ?i 0)
    (bind ?sum 0)
    (while (< ?i ?n) do
        (bind ?i (+ ?i 1))
        (bind ?sum (+ ?sum 
                       (nth$ ?i ?l))))
    (return (/ ?sum ?n)))
 
 ; for a list of numbers    
(deffunction avg2 (?l)
    (bind ?n (length$ ?l))
    (bind ?sum 0)
    (foreach ?i ?l
        (bind ?sum (+ ?sum ?i)))                   
    (return (/ ?sum ?n)))
    
; for a list of numbers    
(deffunction list-max (?l)
    (bind ?m (nth 1 ?l))
    (foreach ?i ?l 
        (if (> ?i ?m) then
          (bind ?m ?i))                   
    (return ?m))
)    

; for total cost of a grocery list
(deffunction  total-cost(?l)
    (bind ?n (length$ ?l))
    (bind ?i 0)
    (bind ?cost 0)
    (while (< ?i ?n) do
        (bind ?i (+ ?i 2))
        (bind ?cost (+ ?cost 
                       (nth$ ?i ?l))))
    (return ?cost)
 )