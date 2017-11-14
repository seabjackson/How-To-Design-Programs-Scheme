;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname decreasing-image) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; decreasing-image

;Design a function called decreasing-image that consumes a Natural n and produces an image of all the numbers 
; from n to 0 side by side. 
; 
; So (decreasing-image 3) should produce 3 2 1 0

;; =====================
;; Constants
(define TEXT-SIZE 25)
(define TEXT-COLOR "black")
(define SPACE (text " " TEXT-SIZE TEXT-COLOR))

;; Natural -> Image
;; produce an aimage of n, n-1, ... 0 side by side
(check-expect (decreasing-image 0) (text "0" 25 "black"))
(check-expect (decreasing-image 3) (beside (text "3" 25 "black") SPACE
                                           (text "2" 25 "black") SPACE
                                           (text "1" 25 "black") SPACE
                                           (text "0" 25 "black")))

(define (decreasing-image n)
  (cond [(zero? n) (text "0" TEXT-SIZE TEXT-COLOR)]
        [else
         (beside (text (number->string n) TEXT-SIZE TEXT-COLOR)
                 SPACE
                 (decreasing-image (sub1 n)))]))