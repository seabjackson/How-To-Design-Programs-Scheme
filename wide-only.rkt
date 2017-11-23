;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname wide-only) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; wide-only


;Use the built in version of filter to design a function called wide-only 
;that consumes a list of images and produces a list containing only those 
;images that are wider than they are tall.

;; (listof Image) -> (listof Image)
;; produce a list containing only the images in the list of images for which wide? is true

(check-expect (wide-only empty) empty)
(check-expect (wide-only (list (rectangle 40 20 "outline" "black")
                               (rectangle 20 40 "outline" "black")))
              (list (rectangle 40 20 "outline" "black")))

(define (wide-only loi)
  (local [(define (wide? img)
            (> (image-width img)
               (image-height img)))]
  (filter wide? loi)))

              