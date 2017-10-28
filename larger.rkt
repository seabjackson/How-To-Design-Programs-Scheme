;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname larger) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; Design a function that consumes two images and produces true if the first is larger than the second.

;; Complete your design using DrRacket.


;The HtDF recipe consists of the following steps:

;Signature, purpose and stub.
;Define examples, wrap each in check-expect.
;Template and inventory.
;Code the function body.
;Test and debug until correct

;; (Image, Image) -> Boolean

;; produce true if the first image has an area larger than the second


(check-expect (larger? (rectangle 10 15 "solid" "red") (rectangle 15 25 "solid" "red")) false)
(check-expect (larger? (rectangle 10 15 "solid" "red") (rectangle 15 10 "solid" "red")) false)
(check-expect (larger? (rectangle 20 15 "solid" "red") (rectangle 5 10 "solid" "red")) true)

;;(define (larger? img1 img2) false) 

;;(define (larger? img1 img2)   template
;;  (if (...img1 ...img2)))

(define (larger? img1 img2)
  (> (* (image-width img1) (image-height img1))
     ( * (image-width img2) (image-height img2))))