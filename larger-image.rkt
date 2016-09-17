;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname larger-image) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;Design a function that consumes two images and produces true if the first is larger than the second.
;
;Complete your design using DrRacket. When you are done, you must submit something in this box in order
;to unlock the assessment rubric, but when you are doing your assessment, grade your submission in DrRacket
;where indentation and formatting will be preserved.

(require 2htdp/image)

;; (Image, Image) -> Boolean

;; purpose produce true if the first image's height is greater than the second image provided

;; examples and tests
(check-expect (larger-image? (rectangle 30 50 "solid" "green") (rectangle 40 10 "solid" "red")) true)
(check-expect (larger-image? (rectangle 30 50 "solid" "green") (rectangle 40 70 "solid" "red")) false)
(check-expect (larger-image? (rectangle 30 50 "solid" "green") (rectangle 40 50 "solid" "red")) false)

;; stub
;; (define (larger-image? img1 img2) false)

;; template
;;(define (larger-image? img1 img2)
;; (...img1 img2))

(define (larger-image? img1 img2)
  (> (image-height img1) (image-height img2)))

