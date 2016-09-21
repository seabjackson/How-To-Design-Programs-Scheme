;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname rocket) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; rocket.rkt

;; =================
;; Data definitions:

;PROBLEM A:
;
;You are designing a program to track a rocket's journey as it descends 
;100 kilometers to Earth. You are only interested in the descent from 
;100 kilometers to touchdown. Once the rocket has landed it is done.
;
;Design a data definition to represent the rocket's remaining descent. 
;Call it RocketDescent.

;A possible structure definition (not until compound data)
;A type comment that defines a new type name and describes how to form data of that type.
;An interpretation that describes the correspondence between information and data.
;One or more examples of the data.
;A template for a 1 argument function operating on data of this type.

;; - Number[0 100]
;; - false
;; interp.
;; Number[0 100] means the rocket is descending and how many seconds before touchdown,
;; false means the rocket descent has ended

;; RocketDescent is one of:
;; - Number[0, 100]
;; - false

(define RD1 0.5) ;; rocket has 0.5km before touchdown
(define RD2 100) ;; rocket has 100 km to go before touchdown
(define RD3 false) ;; rocket has touchdown so the descent has ended

#;
(define (fn-for-countdown cd)
  (cond [(and (number? rd)
              (< 0 rd)
              (<= rd 100))
         (...rd)]
        [else (...)]))

;; Template rules used:
;; - one of: 2 cases
;; - atomic non-distinct: Number[100, 0]
;; - atomic distinct: false
;; =================
;; Functions:

;PROBLEM B:
;
;Design a function that will output the rocket's remaining descent distance 
;in a short string that can be broadcast on Twitter. 
;When the descent is over, the message should be "The rocket has landed!".
;Call your function rocket-descent-to-msg.

;; RocketDescent -> String
;; outputs a Twitter update on the rocket's descent distance

(check-expect (rocket-descent-to-msg 100) "Altitude is 100 kms.")
(check-expect (rocket-descent-to-msg 50) "Altitude is 50 kms.")
(check-expect (rocket-descent-to-msg .5) "Altitude is 1/2 kms.")
(check-expect (rocket-descent-to-msg false) "The rocket has landed")

;; (define (rocket-descent-to-msg rd) "") ; stub

; <template from RocketDescent>

(define (rocket-descent-to-msg rd)
  (cond [(and (number? rd)
              (< 0 rd)
              (<= rd 100))
         (string-append "Altitude is "(number->string rd)" kms.")]
        [else "The rocket has landed"]))













