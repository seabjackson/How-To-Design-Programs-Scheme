;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname countdown) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; countdown.rkt
;Consider designing the system for controlling a New Year's Eve
;display. Design a data definition to represent the current state 
;of the countdown, which falls into one of three categories: 
;
; - not yet started
; - from 10 to 1 seconds before midnight
; - complete (Happy New Year!)


;A possible structure definition (not until compound data)
;A type comment that defines a new type name and describes how to form data of that type.
;An interpretation that describes the correspondence between information and data.
;One or more examples of the data.
;A template for a 1 argument function operating on data of this type.


;; CountDown is one of:
;; - False
;; - Natural[1, 10]
;; - "complete"
;; interp.
;; False means countdown has not yet started,
;; Natural[1, 10] means countdown is running and how many seconds left
;; complete means countdown is over

(define CD1 false)
(define CD2 10) ; just started
(define CD3 1) ; almost over
(define CD4 "complete")
#;
(define (fn-for-countdown c)
  (cond [(false? c) (...)]
        [(and (number? c) (<= 1 c) (<= c 10))(... c)]
        [else (...)]))

;; Template rules used:
;; - one of: 3 cases
;; - atomic distinct: false
;; -atomic-non-distinct: Natural[1, 10]
;; -atomic distinct: "complete"