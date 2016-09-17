;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname image_primitives) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
(require 2htdp/image)

;(circle 20 "solid" "blue")
;(rectangle 30 60 "solid" "black")
; text produces an image
;(text "Seab" 32 "purple")

(overlay (circle 10 "solid" "red")
       (circle 20 "solid" "orange")
       (circle 30 "solid" "yellow")
       (circle 40 "solid" "green")
       (circle 50 "solid" "blue")
       (circle 60 "solid" "indigo")
       (circle 70 "solid" "violet"))

(beside (square 20 "outline" "blue")
        (above (circle 15 "solid" "red")
               (triangle 20 "solid" "green")))