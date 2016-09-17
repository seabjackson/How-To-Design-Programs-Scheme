;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname tall-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;; tall-starter.rkt

;; signature
;; Image -> Bool

;; purpose
;; produce true if the image is tall ie height is greater than the width

;; stub
;(define (tall? img) false)

;; examples
(check-expect (tall? (rectangle 10 20 "solid" "red")) true)
(check-expect (tall? (rectangle 20 10 "solid" "red")) false)
(check-expect (tall? (rectangle 20 20 "solid" "red")) false)

;; template
;(define (tall? img)
 ; (...img))

(define (tall? img)
  (> (image-height img) (image-width img)))
  





