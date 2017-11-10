;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname all-true?) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; boolean-list
;; =================
;; Data definitions:

;Design a data definition to represent a list of booleans. Call it ListOfBoolean.

;; ListOfBoolean is one of:
;; - empty
;; - (cons Boolean ListOfBoolean)
;; interp. a list of boolean values

(define LOB1 empty)
(define LOB2 (cons false empty))
(define LOB3 (cons false (cons true empty)))
(define LOB4 (cons false (cons true (cons false empty))))
(define LOB5 (cons true (cons true (cons true empty))))
#;
(define (fn-for-lob lob)
  (cond [(empty? lob) (...)]
        [else
         (... (first lob)
              (fn-for-lob (rest lob)))]))
;; Template rules used:
;; - one of: 2 cases
;; - atomic distinct: empty
;; - compound: (cons Boolean ListOfBoolean)
;; - self-reference: (rest lob) is ListOfBoolean


;; =================
;; Functions:
 
;Design a function that consumes a list of boolean values and produces true 
;if every value in the list is true. If the list is empty, your function 
;should also produce true. Call it all-true?

;; ListOfBoolean -> Boolean
;; produce true if all values in the list is true of if the list is empty
(check-expect (all-true? empty) true)
(check-expect (all-true? LOB2) false)
(check-expect (all-true? LOB3) false)
(check-expect (all-true? LOB4) false)
(check-expect (all-true? LOB5) true)

;(define (all-true? empty) true) ; stub

(define (all-true? lob)
  (cond [(empty? lob) true]
        [else
         (and (first lob)
              (all-true? (rest lob)))]))

