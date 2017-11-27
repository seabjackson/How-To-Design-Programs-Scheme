;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname skipn) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; skipn

;Design a function that consumes a list of elements lox and a natural number
;n and produces the list formed by including the first element of lox, then 
;skipping the next n elements, including an element, skipping the next n 
;and so on.
;
; (skipn (list "a" "b" "c" "d" "e" "f") 2) should produce (list "a" "d")

;; (listof X) Natural -> (listof X)
;; produce a list that includes the first element and skips each n element afterwards

(check-expect (skipn  empty 2) empty)
(check-expect (skipn (list "a" "b" "c" "d" "e" "f") 2) (list "a" "d"))
(check-expect (skipn (list "a" "b" "c" "d" "e" "f") 1) (list "a" "c" "e"))


; stub (define (skipn lox n) empty);

(define (skipn lox0 n)
  ;; acc: Natural; the number of elements to skip before including the next one
  (local [(define (skipn lox acc)
            (cond [(empty? lox) empty]
                  [else
                   (if (zero? acc)
                       (cons (first lox)
                             (skipn (rest lox)
                                    n))
                       
                       (skipn (rest lox)
                              (sub1 acc)))]))]
    (skipn lox0 0)))