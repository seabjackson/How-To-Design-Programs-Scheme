;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname largest) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; largest

;; =================
;; Data definitions:

;; ListOfNumber is one of:
;;  - empty
;;  - (cons Number ListOfNumber)
;; interp. a list of numbers
(define LON1 empty)
(define LON2 (cons 60 (cons 42 empty)))
#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Number ListOfNumber)
;;  - self-reference: (rest lon) is ListOfNumber

;; =================
;; Functions:


;Design a function that consumes a list of numbers and produces the largest number 
;in the list. You may assume that all numbers in the list are greater than 0. If
;the list is empty, produce 0.

;; ListOfNumbers -> Number
;; produce the largest number that is in a list of numbers
(check-expect (largest empty) 0)
(check-expect (largest LON2) 60)
(check-expect (largest (cons 40 (cons 60 (cons 56 empty)))) 60)

;(define (largest lon) 0) ; stub
(define (largest lon)
  (cond [(empty? lon) 0]
        [else 
         (if (> (first lon) (largest (rest lon)))
             (first lon)
             (largest (rest lon)))]))