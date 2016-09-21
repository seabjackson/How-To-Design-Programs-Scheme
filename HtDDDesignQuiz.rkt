;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDDDesignQuiz) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; HtDD Design Quiz

;; Age is Natural
;; interp. the age of a person in years
(define A0 18)
(define A1 25)

#;
(define (fn-for-age a)
  (... a))

;; Template rules used:
;; - atomic non-distinct: Natural

;Problem 1:
;
;Consider the above data definition for the age of a person.
;
;Design a function called teenager? that determines whether a person
;of a particular age is a teenager (i.e., between the ages of 13 and 19).

;; Age -> Boolean
;; produces true if an age is between 13 and 19

(check-expect (teenager 10) false)
(check-expect (teenager 13) true)
(check-expect (teenager 19) true)

 (define (teenager a)
   (and (<= 13 a)
        (<= a 19)))


;Problem 2:
;
;Design a data definition called MonthAge to represent a person's age
;in months.

;; Age is Natural
;; interp. The age of aperson in months

(define Age1 200)
(define Age2 4)

#;
(define (fn-for-age a)
  (... a))
;; Template rules used:
;; atomic non-distinct - Natural

;Problem 3:
;
;Design a function called months-old that takes a person's age in years 
;and yields that person's age in months.

;; Number -> Number
;; produces the age of a person in months from the given age in years

(check-expect (age-in-months 1) 12)
(check-expect (age-in-months 2) 24)
(check-expect (age-in-months 12) 144)


(define (age-in-months years)
  (* years 12))



;Problem 4:
;
;Consider a video game where you need to represent the health of your
;character. The only thing that matters about their health is:
;
;  - if they are dead (which is shockingly poor health)
;  - if they are alive then they can have 0 or more extra lives
;
;Design a data definition called Health to represent the health of your
;character.
;
;Design a function called increase-health that allows you to increase the
;lives of a character.  The function should only increase the lives
;of the character if the character is not dead, otherwise the character
;remains dead.

;; Health is one of:
;; - "dead"
;; - Natural
;; interp. "dead" means a dead player, a number represents the extra lives left of the player
(define H1 "dead")
(define H2 3)

#;
(define (fn-for-health h)
  (cond [number? h]....)
  (else ...))

;; Template rules used:
;; - one of:  2 cases
;; - atomic non-distinct: Natural
;; - atomic distinct: "dead"

;; Health -> Health
;; increases the number of lives of the player with one except when the player is already dead

(check-expect (increase-health 0) 1)
(check-expect (increase-health "dead") "dead")
(check-expect (increase-health 1) 2)
#;
(define (increase-health h) 0) ; stub

(define (increase-health h)
  (cond [(number? h) (add1 h)]
        (else h)))

