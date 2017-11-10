;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname image-sum-areas) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; image-list-starter.rkt

;; =================
;; Data definitions:

;; Design a data definition to represent a list of images. Call it ListOfImage.
;; ListOfImage is one of:
;; - empty
;; - (cons Image ListOfImage)
;; interp. a list of images

(define IMG1 empty)
(define IMG2 (cons (square 20 "solid" "blue") empty))
(define IMG3 (cons (rectangle 10 20 "solid" "green") (cons (rectangle 5 10 "solid" "red") empty)))

#;
(define (fn-for-loi loi)
  (cond [(empty? loi) (...)]
        [else
         (... (first loi)
              (fn-for-loi (rest loi)))]))
;; Template rules used: 
;; - one of: 2 cases
;; - atomic distinct: empty
;; - compound: (cons Image ListOfImage)
;; - atomic non-distinct: (first loi) is Image
;; - self-reference: (rest loi) is ListOfImage


;; =================
;; Functions:

;Design a function that consumes a list of images and produces a number 
;that is the sum of the areas of each image. For area, just use the image's 
;width times its height.

;; ListOfImage -> Number
;; produce the sum of the areas of a list of images
(check-expect (areas-sum IMG1) 0)
(check-expect (areas-sum IMG3) 250)

;(define (areas-sum loi) 0); STUB

(define (areas-sum loi)
  (cond [(empty? loi) 0]
        [else
         (+ (* (image-height (first loi))
               (image-width (first loi)))
            (areas-sum (rest loi)))]))