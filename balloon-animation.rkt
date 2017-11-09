;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname balloon-animation) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; water-balloon
;
;In this problem, we will design an animation of throwing a water balloon.  
;When the program starts the water balloon should appear on the left side 
;of the screen, half-way up.  Since the balloon was thrown, it should 
;fly across the screen, rotating in a clockwise fashion. Pressing the 
;space key should cause the program to start over with the water balloon
;back at the left side of the screen. 

(require 2htdp/image)
(require 2htdp/universe)

;; This program animates the throwing of a balloon

;; =================
;; Constants:

(define WIDTH 600) ; width of the screen
(define HEIGHT 400) ; height of the screen
(define MTS (rectangle WIDTH HEIGHT "solid" "white"))

(define CTR-Y (/ HEIGHT 2))
(define LINEAR-SPEED 2)
(define ANGULAR-SPEED 3) ; angular speed is counter-clockwise when positive and negative when moving in a clockwise direction

;; imitate balloon image
(define BIG-CIRCLE (circle 30 "solid" "red"))
(define KNOT (circle 2 "solid" "black"))

(define BALLOON (above BIG-CIRCLE KNOT))

;; =================
;; Data definitions:

(define-struct bs (x a))
;; BalloonState is (make-bs Number Number)
;; interp. The state of a balloon that was thrown
;;     x is the x-coordinate in pixels of the balloon center
;;     a is the angle of rotation in degrees

(define BS1 (make-bs 10 0))
(define BS2 (make-bs 30 15))

#;
(define (fn-for-balloon-state bs)
  (...(bs-x bs)
      (bs-a bs)))

;; Template rules used:
;; - compound: 2 fields



;; =================
;; Functions:

;; BalloonState -> BalloonState
;; start the world with (main (make-bs 0 0))

(define (main bs)
  (big-bang bs                   ; BS
            (on-tick   next-bs)     ; BS -> BS
            (to-draw   render-bs)   ; BS -> Image
            (on-key    restart-bs)))    ; BS KeyEvent -> BS

;; BalloonState -> BalloonState
;; produce the next balloon at location x advanced and angle in degrees advanced, ie linear speed and angular speed

(check-expect (next-bs (make-bs 1 12)) (make-bs (+ 1 LINEAR-SPEED) (- 12 ANGULAR-SPEED)))
;(define (next-bs bs) bs) ; stub
;<Template from BalloonState>

(define (next-bs bs)
  (make-bs (+ (bs-x bs) LINEAR-SPEED)
           (- (bs-a bs) ANGULAR-SPEED)))


;; BS -> Image
;; render the balloon state at a height bs-x rotated (remainder bs-a 360) on the MTS 
(check-expect (render-bs (make-bs 1 12))
              (place-image (rotate 12 BALLOON) 1 CTR-Y MTS))
(check-expect (render-bs (make-bs 10 361))
              (place-image (rotate 1 BALLOON) 10 CTR-Y MTS))

;(define (render-bs bs) MTS); stub
;<Template from BalloonState>

(define (render-bs bs)
  (place-image (rotate (modulo (bs-a bs) 360) BALLOON) (bs-x bs) CTR-Y MTS))

;; BS KeyEvent -> BS
;; Restarts the program so the balloon is back to where it started when space key is pressed
(check-expect (restart-bs (make-bs 1 12) " ") (make-bs 0 0))
(check-expect (restart-bs (make-bs 1 12) "left") (make-bs 1 12))

;(define (restart-bs bs key) bs); stub
;; Template from KeyEvent

(define (restart-bs bs key)
  (cond [(key=? " " key) (make-bs 0 0)]
        [else bs]))