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

;; for testing purposes
(define REC1 (rectangle 10 15 "solid" "red"))
(define REC2 (rectangle 25 15 "solid" "green"))
(define REC3 (rectangle 30 40 "solid" "blue"))

;; ListOfImages is one of: 2 cases
;; - empty
;; - compound: (cons Image ListOfImage)
;; interp. An arbitrary number of images

(define LO1 empty)
(define L02 (cons REC1
                  (cons REC2 empty)))
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

(check-expect (arrange-images (cons REC1
                                    (cons REC2 empty)))
              (beside REC1
                      REC2
                      BLANK))

(check-expect (arrange-images (cons REC2
                                    (cons REC1 empty)))
              (beside REC1
                      REC2
                      BLANK))

;(define (arrange-images loi) BLANK); stub
;; rewriting the puropose suggests this is a function composition problem so we will write the function as such

(define (arrange-images loi)
  (display-images (sort-images loi)))

;; ListOfImage -> Image
;; place images next to each other in order of list
(check-expect (display-images empty) BLANK)
(check-expect (display-images  (cons REC1
                                     (cons REC2 empty)))
              (beside REC1
                      REC2
                      BLANK))

;(define (display-images loi) BLANK); stub

(define (display-images loi)
  (cond [(empty? loi) BLANK]
        [else
         (beside (first loi)
                 (display-images (rest loi)))]))


;; ListOfImage -> ListOfImage
;; prduce a sorted list of images in increasing order of size
(check-expect (sort-images empty) empty)
(check-expect (sort-images (cons REC1
                                 (cons REC2 empty)))
              (cons REC1
                    (cons REC2 empty)))

(check-expect (sort-images (cons REC2
                                 (cons REC1 empty)))
              (cons REC1
                    (cons REC2 empty)))

;(define (sort-images loi) loi); stub

(define (sort-images loi)
  (cond [(empty? loi) empty]
        [else
         (insert (first loi)
                 (sort-images (rest loi)))]))

;; Image ListOfImage -> ListOfImage
;; produce a new list of images with image in proper place
;; Assume that loi is already sorted
(check-expect (insert REC1 empty) (cons REC1 empty))
(check-expect (insert REC1 (cons REC2 (cons REC3 empty))) (cons REC1 (cons REC2 (cons REC3 empty))))
(check-expect (insert REC2 (cons REC1 (cons REC3 empty))) (cons REC1 (cons REC2 (cons REC3 empty))))

;(define (insert img loi) loi); stub
(define (insert img loi)
  (cond [(empty? loi) (cons img empty)]
        [else
         (if (larger? img (first loi))
             (cons (first loi)
                   (insert img
                           (rest loi)))
             (cons img loi))]))

;; Image Image -> Boolean
;; produces true if first image is larger than second image by area
(check-expect (larger? (rectangle 3 4 "solid" "red") (rectangle 2 6 "solid" "red")) false)
(check-expect (larger? (rectangle 5 4 "solid" "red") (rectangle 2 6 "solid" "red")) true)
(check-expect (larger? (rectangle 3 5 "solid" "red") (rectangle 2 6 "solid" "red")) true)
(check-expect (larger? (rectangle 3 4 "solid" "red") (rectangle 5 6 "solid" "red")) false)
(check-expect (larger? (rectangle 3 4 "solid" "red") (rectangle 2 7 "solid" "red")) false)

;(define (larger? img1 img2) true) ; stub
(define (larger? img1 img2)
  (> (* (image-width img1) (image-height img1))
     (* (image-width img2) (image-height img2))))
