;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname sum-of-natural-numbers) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; naturals

;; Natural is one of:
;;  - 0
;;  - (add1 Natural)
;; interp. a natural number
(define N0 0)         ;0
(define N1 (add1 N0)) ;1
(define N2 (add1 N1)) ;2

(define (fn-for-natural n)
  (cond [(zero? n) (...)]
        [else
         (... ;n                           ;template rules wouldn't normally put this
          ;                            ;here, but we will see that we end up coming
          ;                            ;back to add it
          (fn-for-natural (sub1 n)))]))

;; Template rules used:
;;  - one-of: two cases
;;  - atomic distinct: 0
;;  - compound: (add1 Natural)
;;  - self-reference: (sub1 n) is Natural


;; (A) Design a function that consumes Natural number n and produces the sum of all
;;    the naturals in [0, n].

;; Natural -> Natural
;; produce the sum of all Natural[0, n]

(check-expect (sum-to-n 0) 0)
(check-expect (sum-to-n 1) 1)
(check-expect (sum-to-n 3) (+ 0 1 2 3))

(define (sum-to-n n)
  (cond [(zero? n) 0]
        [else
         (+ n
           (sum-to-n (sub1 n)))]))

;; (B) Design a function that consumes Natural number n and produces a list of all
;;    the naturals of the form (cons n (cons n-1 ... empty)) not including 0.

;; Natural -> ListOfNatural
;; produce (cons n (cons n-1... empty)), not including 0
(check-expect (list-natural 0) empty)
(check-expect (list-natural 1) (cons 1 empty))
(check-expect (list-natural 2) (cons 2 (cons 1 empty)))

;(define (list-natural n) empty) ; stub

(define (list-natural n)
  (cond [(zero? n) empty]
        [else
         (cons n                     
          (list-natural (sub1 n)))]))
