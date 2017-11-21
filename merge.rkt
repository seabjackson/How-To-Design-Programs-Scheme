;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname merge) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; merge
;
;Design the function merge. It consumes two lists of numbers, which it assumes are 
;each sorted in ascending order. It produces a single list of all the numbers, 
;also sorted in ascending order. 

;; ListOfNumber ListOfNumber -> ListOfNumber
;; produce a sorted list of numbers by merging two sorted lists of numbers

; crossproduct

;         l2        empty   (cons Number ListOfNumber)

;         l1        empty   (cons Number ListOfNumber)

(check-expect (merge empty empty) empty)
(check-expect (merge empty (list 1 3 5)) (list 1 3 5))
(check-expect (merge (list 0 2 4) empty) (list 0 2 4))
(check-expect (merge (list 0 2 4) (list 1 3)) (list 0 1 2 3 4))

(define (merge l1 l2)
  (cond [(empty? l1) l2]
        [(empty? l2) l1]
        [else
         (if (<= (first l1) (first l2))
             (cons (first l1)
                   (merge (rest l1) l2))
             (cons (first l2)
                   (merge l1 (rest l2))))]))