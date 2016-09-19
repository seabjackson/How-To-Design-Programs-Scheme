;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname best-city) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; best.rkt


;Using the CityName data definition below design a function
;that produces true if the given city is the best in the world. 
;(You are free to decide for yourself which is the best city 
;in the world.)

;; Data definitions:


;; CityName is String
;; interp. the name of a city
(define CN1 "Boston")
(define CN2 "Vancouver")
#;
(define (fn-for-city-name cn)
  (... cn))

;; Template rules used:              For the first part of the course
;;   atomic non-distinct: String     we want you to list the template
;;                                   rules used after each template.
;;

;; Functions:

;; CityName -> Boolean
;; produce true if the given city is the best in the world
(check-expect (best? "Boston") false)
(check-expect (best? "Hogsmeade") true)

;; stub
;(define (best? cn) false)

; took template from CityName

(define (best? cn)
  (string=? cn "Hogsmeade"))

