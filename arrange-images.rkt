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


;; Constants

(define BLANK (square 0 "solid" "white"))

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

;; Functions:

;; ListOfImage -> Image
;; sort images in increasing order of size and display them from left to right
;; sort images in increasing order of size then display them

(check-expect (arrange-images (cons (rectangle 10 15 "solid" "red")
                                    (cons (rectangle 25 15 "solid" "green") empty)))
              (beside (rectangle 10 15 "solid" "red")
                      (rectangle 25 15 "solid" "green")
                      BLANK))

(check-expect (arrange-images (cons (rectangle 25 15 "solid" "green")
                                    (cons (rectangle 10 15 "solid" "red") empty)))
              (beside (rectangle 10 15 "solid" "red")
                      (rectangle 25 15 "solid" "green")
                      BLANK))

;(define (arrange-images loi) BLANK); stub
;; rewriting the puropose suggests this is a function composition problem so we will write the function as such

(define (arrange-images loi)
  (display-images (sort-images loi)))

;; ListOfImage -> Image
;; place images next to each other in order of list
(check-expect (display-images empty) BLANK)
(check-expect (display-images  (cons (rectangle 10 15 "solid" "red")
                                     (cons (rectangle 25 15 "solid" "green") empty)))
              (beside (rectangle 10 15 "solid" "red")
                      (rectangle 25 15 "solid" "green")
                      BLANK))

;(define (display-images loi) BLANK); stub

(define (display-images loi)
     (cond [(empty? loi) BLANK]
           [else
            (beside (first loi)
                 (display-images (rest loi)))]))

;; ListOfImage -> ListOfImage
;; prduce a sorted list of images in increasing order of size
;; !!!
(define (sort-images loi) loi); stub