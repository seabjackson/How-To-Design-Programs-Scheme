;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname arrange-images) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; arrange-images

;In this problem imagine you have a bunch of pictures that you would like to 
;store as data and present in different ways. We'll do a simple version of that 
;here, and set the stage for a more elaborate version later.
;
;(A) Design a data definition to represent an arbitrary number of images.
;
;(B) Design a function called arrange-images that consumes an arbitrary number
;    of images and lays them out left-to-right in increasing order of size.

;; ListOfImages is one of: 2 cases
;; - empty
;; - compound: (cons Image ListOfImage)
;; interp. An arbitrary number of images

(define LO1 empty)
(define L02 (cons (rectangle 10 15 "solid" "red")
                  (cons (rectangle 25 15 "solid" "green") empty)))
#;
 (define (fn-for-loi loi)
     (cond [(empty? loi) (...)]
           [else
            (... (first loi)
                 (fn-for-loi (rest loi)))]))
