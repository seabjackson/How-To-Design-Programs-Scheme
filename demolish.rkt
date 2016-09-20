;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname demolish) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; demolish.rkt

;; =================
;; Data definitions:

;PROBLEM A:
;
;You are assigned to develop a system that will classify 
;buildings in downtown Vancouver based on how old they are. 
;According to city guidelines, there are three different classification levels:
;new, old, and heritage.
;
;Design a data definition to represent these classification levels. 
;Call it BuildingStatus.

;A possible structure definition (not until compound data)
;A type comment that defines a new type name and describes how to form data of that type.
;An interpretation that describes the correspondence between information and data.
;One or more examples of the data.
;A template for a 1 argument function operating on data of this type.


;; BuildingStatus is one of:
;; - "new"
;; - "old"
;; - "heritage"
;;  interp. "new" means the building is new
;; "old" means the building is old
;; "heritage" means it is a heritage building

;; <examples are redundant for enumeration>

#;
(define (BuildingStatus bs)
  (cond [(string=? "new" bs) (...)]
        [(string=? "old" bs) (...)]
        [(string=? "heritage" bs) (...)]))
;; Template rules used:
;;  - one of: 3 cases
;;  - atomic distinct: "new"
;;  - atomic distinct: "old"
;;  - atomic distinct: "heritage"

;; =================
;; Functions:

;PROBLEM B:
;
;The city wants to demolish all buildings classified as "old". 
;You are hired to design a function called demolish? 
;that determines whether a building should be torn down or not.
;; BuildingStatus -> Boolean
;; produces true if a given building status is old
(check-expect (demolish "new") false)
(check-expect (demolish "old") true)
(check-expect (demolish "heritage") false)

;; (define (demolish bs) false) ; stub

(define (demolish bs)
  (cond [(string=? "new" bs) false]
        [(string=? "old" bs) true]
        [(string=? "heritage" bs) false]))