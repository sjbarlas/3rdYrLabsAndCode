(clear)

(deftemplate rented-apa (slot street-name) (slot dublin-code) (slot floor-area) (slot monthly-rent) (slot bedrooms) (slot apa-age))

(deftemplate sold-apa (slot street-name) (slot dublin-code) (slot floor-area) (slot selling-price) (slot bedrooms) (slot apa-age))

; renting apartments
(assert rented-apa (street-name "6 The Park") (dublin-code "Dublin 1") (floor-area 110) (monthly-rent 700) (bedrooms 1) (apa-age 5))
(assert rented-apa (street-name "9 The Block") (dublin-code "Dublin 2") (floor-area 200) (monthly-rent 1000) (bedrooms 4) (apa-age 8))
(assert rented-apa (street-name "4 The Green") (dublin-code "Dublin 3") (floor-area 180) (monthly-rent 900) (bedrooms 3) (apa-age 3))
(assert rented-apa (street-name "76 The Haven") (dublin-code "Dublin 4") (floor-area 430) (monthly-rent 2000) (bedrooms 3) (apa-age 3))
(assert rented-apa (street-name "1 The Drive") (dublin-code "Dublin 8") (floor-area 230) (monthly-rent 1000) (bedrooms 2) (apa-age 1))

; selling apartments
(assert sold-apa (street-name "8 Hazlebury") (dublin-code "Dublin 1") (floor-area 180) (selling-price 250000) (bedrooms 3) (apa-age 3))
(assert sold-apa (street-name "10 Woodview") (dublin-code "Dublin 2") (floor-area 200) (selling-price 300000) (bedrooms 2) (apa-age 7))
(assert sold-apa (street-name "77 InitialD") (dublin-code "Dublin 3") (floor-area 300) (selling-price 500000) (bedrooms 4) (apa-age 2))
(assert sold-apa (street-name "102 Hyena Point") (dublin-code "Dublin 4") (floor-area 290) (selling-price 450000) (bedrooms 4) (apa-age 5))
(assert sold-apa (street-name "43 Pheasant Run") (dublin-code "Dublin 8") (floor-area 170) (selling-price 200000) (bedrooms 2) (apa-age 8))

; ****************

; ***** 1. list all 1 bedroom apartments for rent anywhere in Dublin
(assert (min-bedrooms 1))
(assert (max-bedrooms 1))
	
(defrule 1-bedroom-rule
	(street-name ?st)
	(rented-apa (bedrooms ?b) (monthly-rent ?r))
	=>
	(printout t "The apartment at" ?st "has" ?b "bedrooms and" ?r "monthly rent" crlf)
)

; ***** 2. list all 2 bedroom apartments for sale in Dublin 2 or Dublin 8
(assert (min-bedrooms 2))
(assert (max-bedrooms 2))
(assert (dublin-code Dublin 2))
(assert (dublin-code Dublin 8))

(defrule 2-bedroom-rule
	(street-name ?st)
	(sold-apa (bedrooms ?b) (selling-price ?s) (dublin-code ?d))
	=>
	(printout t "The apartment at" ?st "has" ?b "bedrooms and" ?s "selling price in Dublin code" ?d crlf)
)

; ***** 3. list all apartments not in Dublin 1 for sale with floor area > 150 m2 and price < €300,000
(assert (min-dublin-code "Dublin 2"))
(assert (min-floor-area 160))
(assert (max-selling-price 299999))
	
(defrule not-Dublin-1-rule
	(street-name ?st)
	(sold-apa (bedrooms ?b) (selling-price ?s))
	=>
	(printout t "The apartment at" ?st "has" ?b "bedrooms and" ?s "selling price" crlf)
)

; ***** 4. list all apartment not in Dublin 4 which are for sale with price < €300,000 or for rent with rent < €900 per month
(assert (min-selling-price 299999))
(assert (max-monthly-rent 899))
(assert (dublin-code "Dublin 1"))
(assert (dublin-code "Dublin 2"))
(assert (dublin-code "Dublin 3"))
(assert (dublin-code "Dublin 8"))

(defrule not-Dublin-4-rule
	(street-name ?st)
	(sold-apa (bedrooms ?b) (selling-price ?s))
	(rented-apa (bedrooms ?b) (monthly-rent ?r))
	=>
	(printout t "The apartment at" ?st "has" ?b "bedrooms and" ?s "selling price" crlf)
	(printout t "The apartment at" ?st "has" ?b "bedrooms and" ?r "monthly rent" crlf)

; ***** 5. find the cheapest 2 bedroom apartment to rent in Dublin 2 or Dublin 8
(assert (dublin-code "Dublin 2"))
(assert (dublin-code "Dublin 8"))
(assert (min-bedrooms 2))
(assert (max-bedrooms 2))

(defrule cheapest-2-bedroom-rule
	(street-name ?st)
	(rented-apa (bedrooms ?b) (monthly-rent ?r))
	=>
	(printout t "The apartment at" ?st "has" ?b "bedrooms and" ?r "monthly rent" crlf)
)