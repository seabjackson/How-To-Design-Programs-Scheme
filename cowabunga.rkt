;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cowabunga) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))


;Cows on the other hand are docile creatures. They stay inside the fence, walking
;back and forth nicely.
;
;Design a world program with the following behaviour:
;   - A cow walks back and forth across the screen.
;   - When it gets to an edge it changes direction and goes back the other way
;   - When you start the program it should be possible to control how fast a
;     walker your cow is.
;   - Pressing space makes it change direction right away.
;   
;To help you here are two pictures of the right and left sides of a lovely cow that 
;was raised for us at Brown University.
;
   
;
;Once your program works here is something you can try for fun. If you rotate the
;images of the cow slightly, and you vary the image you use as the cow moves, you
;can make it appear as if the cow is waddling as it walks across the screen.
;
;Also, to make it look better, arrange for the cow to change direction when its
;nose hits the edge of the window, not the center of its body.


;; A cow meandering  back and forth across the screen
(require 2htdp/image)
(require 2htdp/universe)

;; Constants

(define WIDTH 400)
(define HEIGHT 200)

(define CTR-Y (/ HEIGHT 2))
(define RCOW (rectangle 10 20 "solid" "black"))
(define LCOW (rectangle 20 10 "solid" "black"))
(define MTS (empty-scene WIDTH HEIGHT))

;; Data Definitions

(define-struct cow (x dx))

;; Cow is (make-cow Natural[0, WIDTH] Integer)
;; interp. (make-cow x dx) is a cow with x coordinate x and velocity dx
;; the x is the center of the cow
;; x is in screen coordinates (pixels)
;; dx is pixels per tick

(define C1 (make-cow 10 3)) ; at 10, moving left to right, ie East
(define C2 (make-cow 25 -6))    ; at 25, moving right to left, ie West

(define (fn-for-cow c)
  (... (cow-x c)      ;Natural[0, WIDTH]
       (cow-dx c)))   ;Integer
;; Template rules used:
;;- compount: 2 fields

;; Functions

;; Cow -> Cow
;; start the world with (main 0 10)
;; 
(define (main c)
  (big-bang c                   ; Cow
            (on-tick   next-cow)    ; Cow -> Cow
            (to-draw   render-cow)  ; Cow -> Image
            (on-key    handle-key)))   ; Cow KeyEvent -> Cow

;; Cow -> Cow
;; increase the cow x by dx; bounce off edges
(check-expect (next-cow (make-cow 20 3)) (make-cow (+ 20 3) 3)) ; within the background window
(check-expect (next-cow (make-cow 20 -3)) (make-cow (- 20 3) -3))

(check-expect (next-cow (make-cow (- WIDTH 3) 3)) (make-cow WIDTH 3)) ; reaches edge
(check-expect (next-cow (make-cow 3 -3)) (make-cow 0 -3))

(check-expect (next-cow (make-cow (- WIDTH 2) 3)) (make-cow WIDTH -3)) ;cow trying to pass edge
(check-expect (next-cow (make-cow 2 -3)) (make-cow 0 3))
  
;(define (next-cow c) c); stub
;<use template from Cow>

(define (next-cow c)
  (cond [(> (+ (cow-x c) (cow-dx c)) WIDTH) (make-cow WIDTH (- (cow-dx c)))]
        [(< (+ (cow-x c) (cow-dx c)) 0)     (make-cow 0 (- (cow-dx c)))]
        [else (make-cow (+ (cow-x c) (cow-dx c)) (cow-dx c))]))


;; Cow -> Image
;; place appropriate cow image on MTS at (cow-x c) and CTR-Y 
(check-expect (render-cow (make-cow 99 3))
              (place-image RCOW 99 CTR-Y MTS))
(check-expect (render-cow (make-cow 99 -3))
              (place-image LCOW 99 CTR-Y MTS))
              
;(define (render-cow c) MTS); stub
(define (render-cow c)
  (place-image (choose-image c) (cow-x c) CTR-Y MTS))

;; Cow -> Image
;; produce RCOW or LCOW depending on direction cow is going
(check-expect (choose-image (make-cow 10 3)) RCOW)
(check-expect (choose-image (make-cow 10 -3)) LCOW)
(check-expect (choose-image (make-cow 11 0)) LCOW)
;(define (choose-image c) RCOW) ; stub

(define (choose-image c)
  (if (> (cow-dx c) 0)
      RCOW
      LCOW))


;; Cow KeyEvent -> Cow
;; reverse the direction that the cow moves in when space bar is pressed.
(check-expect (handle-key (make-cow (/ WIDTH 2) -3) " ") (make-cow (/ WIDTH 2) 3))
(check-expect (handle-key (make-cow (/ WIDTH 2) 3) " ") (make-cow (/ WIDTH 2) -3))
(check-expect (handle-key (make-cow (/ WIDTH 2) 3) "a") (make-cow (/ WIDTH 2) 3))

;(define (handle-key c ke) c) ; stub
;<template according to key event>

(define (handle-key c ke)
  (cond [(key=? ke " ") (make-cow (cow-x c) (- (cow-dx c)))]
        [else c] ))