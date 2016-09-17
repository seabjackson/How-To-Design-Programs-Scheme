;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname less-than-five-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; less-than-five-starter.rkt


; DESIGN function that consumes a string and determines whether its length is
; less than 5.  Follow the HtDF recipe and leave behind commented out versions 
; of the stub and template.

;; signature
;; String -> Boolean

;; purpose
;; given a string, produce true if it's length is less than 5, and false otherwise

;; examples and tests
(check-expect (string-length-less-than-five? "hellooo") false)
(check-expect (string-length-less-than-five? "hell") true)
(check-expect (string-length-less-than-five? "hello") false)

;; stub
;(define (string-length-less-than-five? word) false)

;; template
;;(define (string-length-less-than-five? word)
;;  (...word))

(define (string-length-less-than-five? word)
   (< (string-length word) 5))
