;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname fractals) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;
;(require 2htdp/image)
;
;;; fractals
;
;Design a function that consumes a number and produces a Sierpinski
;triangle of that size. Your function should use generative recursion.
 

(define CUTOFF 2)

;; Number -> Image
;; produce a Sierpinski Triangle of the given size
(check-expect (sierp CUTOFF) (triangle CUTOFF "outline" "red"))
(check-expect (sierp (* CUTOFF 2))
              (overlay (triangle (* 2 CUTOFF) "outline" "red")
                       (local [(define sub (triangle CUTOFF "outline" "red"))]
                         (above sub
                                (beside sub sub)))))



(define (sierp s)
  (if (<= s CUTOFF)
      (triangle s "outline" "red")
      (overlay (triangle s "outline" "red")
               (local [(define sub (sierp (/ s 2)))]
                 (above sub
                        (beside sub sub))))))


;Design a function to produce a Sierpinski carpet of size s

;; Number -> Image
;; produce a sierpinksi carpet from a given number
(check-expect (scarpet CUTOFF) (square CUTOFF "outline" "black"))
(check-expect (scarpet (* CUTOFF 3))
              (overlay (square (* CUTOFF 3) "outline" "black")
                       (local [(define sub (square CUTOFF "outline" "black"))
                               (define blank (square CUTOFF "solid" "white"))]
                         (above (beside sub sub sub)
                                (beside sub blank sub)
                                (beside sub sub sub))))) 

;(define (scarpet s) (square 0 "solid" "white"))
(define (scarpet s)
  (if (<= s CUTOFF)
      (square s "outline" "black")
      (overlay (square s "outline" "black")
               (local [(define sub (scarpet (/ s 3)))
                       (define blank (square (/ s 3) "solid" "white"))]
                 (above (beside sub sub sub)
                        (beside sub blank sub)
                        (beside sub sub sub))))))

