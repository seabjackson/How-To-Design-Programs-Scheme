;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname countdown-animation) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; countdown-animation 

;Design an animation of a simple countdown. 
;
;Your program should display a simple countdown, that starts at ten, and
;decreases by one each clock tick until it reaches zero, and stays there.
;
;To make your countdown progress at a reasonable speed, you can use the 
;rate option to on-tick. If you say, for example, 
;(on-tick advance-countdown 1) then big-bang will wait 1 second between 
;calls to advance-countdown.
;
;Remember to follow the HtDW recipe! Be sure to do a proper domain 
;analysis before starting to work on the code file.
;
;Once you are finished the simple version of the program, you can improve
;it by reseting the countdown to ten when you press the spacebar.

;; Countdown animation that moves from 10 to 0

;; =================
;; Constants:
(define WIDTH 200)
(define HEIGHT 200)

(define CTR-Y (/ HEIGHT 2))
(define CTR-X (/ WIDTH 2))

(define MTS (empty-scene WIDTH HEIGHT))

(define TEXT-SIZE 80)
(define TEXT-COLOR "blue")

(define START 10)
(define END 0)

;; =================
;; Data definitions:

;; Count is Natural[0, 10]
;; interp. the current number of seconds remaining in the countdown from 10 to 0
(define  CD1 10) ; starting number
(define CD2 5) ; half way through the count down
(define CD3 0) ; end of the countdown
#;
(define (fn-for-countdown cd)
  (... cd))

;; Template rules used:
;;  - atomic non-distinct: Natural[0, 10]


;; =================
;; Functions:

;; Count -> Count
;; start the world with (main 10) or (main START)
;; 
(define (main cd)
  (big-bang cd                        ; Count
            (on-tick   decrement 1)     ; Count -> Count
            (to-draw   render)))      ; Count -> Image
            
;; Count -> Count
;; produce the next number in the countdown by decrementing it by 1 or keep
;; at 0 if already at 0
(check-expect (decrement 5) 4)
(check-expect (decrement 10) 9)
(check-expect (decrement 0) 0)

;;(define (decrement cd) 0); stub

;<use template from Count>
(define (decrement cd)
  (if (= END cd)
      0
      (sub1 cd)))

;; Count -> Image
;; render the image of the number on the empty background, MTS
(check-expect (render 10) (place-image (text "10" TEXT-SIZE TEXT-COLOR) CTR-X CTR-Y MTS))
(check-expect (render 0) (place-image (text "0" TEXT-SIZE TEXT-COLOR) CTR-X CTR-Y MTS))

;(define (render cd) MTS) ; stub
;<use template from Count>

(define (render cd)
  (place-image (text (number->string cd) TEXT-SIZE TEXT-COLOR) CTR-X CTR-Y MTS))