;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname rocket) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; rocket

;; =================
;; Data definitions:


;You are designing a program to track a rocket's journey as it descends 
;100 kilometers to Earth. You are only interested in the descent from 
;100 kilometers to touchdown. Once the rocket has landed it is done.

;Design a data definition to represent the rocket's remaining descent. 
;Call it RocketDescent.

;A type comment that defines a new type name and describes how to form data of that type.
;An interpretation that describes the correspondence between information and data.
;One or more examples of the data.
;A template for a 1 argument function operating on data of this type.

;; RocketDescent is one of:

;; - Number[0, 100]
;; - false

;; interp. Number[0, 100] meand the rocket is descending and how many kilometers before touchdown
;; false means the rocket descent has ended

(define RD1 0.5) ;; rocket has 0.5km before touchdown
(define RD2 100) ;; rocket is at maximum height of 100km before touchdown
(define RD3 false) ;; rocket has touchdown so the descent has ended

(define (fn-for-rocket-descent rd)
  (cond [(number? rd) (... rd)]
        [(false? rd) (...)]))
;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: false
;;  - atomic non-distinct: Number[0, 100]

;; =================
;; Functions:


;Design a function that will output the rocket's remaining descent distance 
;in a short string that can be broadcast on Twitter. 
;When the descent is over, the message should be "The rocket has landed!".
;Call your function rocket-descent-to-msg.

;; RocketDescent -> String

;; outputs a twitter update message on how far the rocket is from touchdown

(check-expect (rocket-descent->msg 100) "Altitude is 100km")
(check-expect (rocket-descent->msg 50) "Altitude is 50km")
(check-expect (rocket-descent->msg .5) "Altitude is 1/2km")
(check-expect (rocket-descent->msg false) "The rocket has landed!")

;;(define (rocket-descent->msg rd) "") ; stub

;; <template used from RocketDescent>

(define (rocket-descent->msg rd)
  (cond [(number? rd) (string-append "Altitude is "(number->string rd)"km")]
        [else "The rocket has landed!"]))