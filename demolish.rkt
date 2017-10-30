;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname demolish) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; demolish

;; =================
;; Data definitions:


;You are assigned to develop a system that will classify 
;buildings in downtown Vancouver based on how old they are. 
;According to city guidelines, there are three different classification levels:
;new, old, and heritage.
;
;Design a data definition to represent these classification levels. 
;Call it BuildingStatus.

;; BuildingStatus is one of:
; - "new"
; - "old"
; - "heritage"

;; interp. the classification level of a building based on its age
; - "new" means the building is new
; - "old" means the building is old
; - "heritage" means the building is a heritage symbol
;; <examples are redundant for enumeration>

#;
(define (fn-for-buildingstatus bs)
  (cond [Q1 A1]
        [Q2 A2]
        [Q3 A3]))
;; Template rules used:
;; - one of: 3 cases




;; =================
;; Functions:


;The city wants to demolish all buildings classified as "old". 
;You are hired to design a function called demolish? 
;that determines whether a building should be torn down or not.


;; BuildingStatus -> Boolean

;; produce true if a building is old and needs to be torn down
(check-expect (demolish? "old") true)
(check-expect (demolish? "new") false)
(check-expect (demolish? "heritage") false)


;(define (demolish? bs) false) ;
;; used template from building status

(define (demolish? bs)
  (cond [(string=?  bs "new") false]
        [(string=? bs "heritage") false]
        [else true]))

;; Templatle rules used:
;; - one of: 3 cases
;; - atomic distinct: "new"
;; - atomic distinct: "old"
;; - atomic distinct: "heritage"