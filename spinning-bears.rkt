;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname spinning-bears) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; spinning-bears

(require 2htdp/image)
(require 2htdp/universe)
;
;In this problem you will design another world program. In this program the changing 
;information will be more complex - your type definitions will involve arbitrary 
;sized data as well as the reference rule and compound data. But by doing your 
;design in two phases you will be able to manage this complexity. As a whole, this problem 
;will represent an excellent summary of the material covered so far in the course, and world 
;programs in particular.
;
;This world is about spinning bears. The world will start with an empty screen. Clicking
;anywhere on the screen will cause a bear to appear at that spot. The bear starts out upright,
;but then rotates counterclockwise at a constant speed. Each time the mouse is clicked on the 
;screen, a new upright bear appears and starts spinning.
;
;So each bear has its own x and y position, as well as its angle of rotation. And there are an
;arbitrary amount of bears.
;
;To start, design a world that has only one spinning bear. Initially, the world will start
;with one bear spinning in the center at the screen. Clicking the mouse at a spot on the
;world will replace the old bear with a new bear at the new spot. You can do this part 
;with only material up through compound. 
;
;Once this is working you should expand the program to include an arbitrary number of bears.

;; Spinning Bears

;; =======================
;; Constants:

(define WIDTH 600) ; width of the scene
(define HEIGHT 700) ; height of the scene

(define SPEED 3) ; rotational speed
(define MTS (empty-scene WIDTH HEIGHT)) ; background of the empty scene

(define BEAR (text/font "BEAR" 24 "olive"
             "Gill Sans" 'swiss 'normal 'bold #f)) ; since actual image of a bear doesn't load on github used text instead

(define BEAR-IMG BEAR)

;; =========================
;; Data definitions

(define-struct bear (x y r))
;; Bear is (make-bear Number[0, WIDTH] Number[HEIGHT] Number)
;; interp. (make-bear x y r) is the state of a bear, where
;; x is the x-coordinate in pixels on the background
;; y is the y-coordinate in pixels on the background
;; r is the angle of rotation in degrees

(define B1 (make-bear 0 0 0)) ; bear in upper right corner with no rotation
(define B2 (make-bear (/ WIDTH 2) (/ HEIGHT 2) 90)) ; bear lying horizontally and in the center of the background

#; (define (fn-for-bear b)
     (... (bear-x b)     ; Number[0, WIDTH]
          (bear-y b)     ; Number[0, HEIGHT]
          (bear-r b)))   ; Number

;; Template rules used:
;; compound: 3 fields

;; ListOfBear is one of:
;; - empty
;; - (cons Bear ListOfBear)

(define LB0 empty)
(define LB1 (cons B1 empty))
(define LB2 (cons B1 (cons B2 empty)))

#;
(define (fn-for-lob lob)
  (cond [(empty? lob) (...)]
        [else
         (... (fn-for-bear (first lob))
              (fn-for-lob (rest lob)))]))

;; Template Rules Used:
;; - one of: 2 cases
;; - atomic distinct: empty
;; - compound: 2 fields
;; - reference: (first lob) is Bear
;; - self-reference (rest lob) is ListOfBear

;; ===============================

;; Functions

;; ListOfBear -> ListOfBear
;; start the world with (main empty)
;; 
(define (main lob)
  (big-bang lob                    ; ListOfBear
            (on-tick   rotate-bears)       ; ListOfBear -> ListOfBear
            (to-draw   render-bears)     ; ListOfBear -> Image
            (on-mouse  handle-mouse)))      ; ListOfBear Integer Integer MouseEvent -> ListOfBear

;; ListOfBear -> ListOfBear
;; rotate all of the bears by speed degrees in a clockwise direction

(check-expect (rotate-bears empty) empty)
(check-expect (rotate-bears
               (cons (make-bear 0 0 0) empty))
              (cons (make-bear 0 0 (+ 0 SPEED)) empty))
(check-expect (rotate-bears
              (cons (make-bear 0 0 0)
                    (cons (make-bear (/ WIDTH 2) (/ HEIGHT 2) 90) empty)))
              (cons (make-bear 0 0 (+ 0 SPEED))
                    (cons (make-bear (/ WIDTH 2) (/ HEIGHT 2) (+ 90 SPEED)) empty)))
           



;(define (rotate-bears lob) empty) ; stub
;<use template from ListOfBear>

(define (rotate-bears lob)
  (cond [(empty? lob) empty]
        [else
         (cons (rotate-bear (first lob))
              (rotate-bears (rest lob)))]))

;; Bear -> Bear
;; rotate a bear forward by SPEED degrees

(check-expect (rotate-bear (make-bear 0 0 0)) (make-bear 0 0 (+ 0 SPEED)))
(check-expect (rotate-bear (make-bear (/ WIDTH 2) (/ HEIGHT 2) 90))
              (make-bear (/ WIDTH 2) (/ HEIGHT 2) (+ 90 SPEED)))
; (define (rotate-bear b) b); stub
;<use template from bear>

(define (rotate-bear b)
     (make-bear (bear-x b) (bear-y b) (+ (bear-r b) SPEED)))  


;; ListOfBear -> Image
;; render the image of the bears unto the empty scene
(check-expect (render-bears empty) MTS)
(check-expect (render-bears (cons (make-bear 0 0 0) empty))
              (place-image (rotate 0 BEAR-IMG) 0 0 MTS))

(check-expect (render-bears
               (cons (make-bear 0 0 0)
                     (cons (make-bear (/ WIDTH 2) (/ HEIGHT 2) 90) empty)))
              (place-image (rotate 0 BEAR-IMG) 0 0
                           (place-image (rotate 90 BEAR-IMG) (/ WIDTH 2) (/ HEIGHT 2) MTS)))

;(define (render-bears lob) MTS) ; stub
; <used template from ListOfBear>

(define (render-bears lob)
  (cond [(empty? lob) MTS]
        [else
         (render-bear-on (first lob)
                         (render-bears (rest lob)))]))


;; Bear Image -> Image
;; render an image of a bear on the given image/background

(check-expect (render-bear-on (make-bear 0 0 0) MTS) (place-image (rotate 0 BEAR-IMG) 0 0 MTS))
(check-expect (render-bear-on (make-bear (/ WIDTH 2) (/ HEIGHT 2) 90) MTS)
              (place-image (rotate 90 BEAR-IMG) (/ WIDTH 2) (/ HEIGHT 2) MTS))
;<use template from bear>

(define (render-bear-on b img)
  (place-image (rotate (modulo (bear-r b) 360) BEAR-IMG) (bear-x b) (bear-y b) img))


;; ListOfBear Integer Integer MouseEvent -> ListOfBear
;; when the mouse is clicked, add a bear with no rotation to the list of bears at the location x, y of the mouse
(check-expect (handle-mouse empty 5 4 "button-down") (cons (make-bear 5 4 0) empty))
(check-expect (handle-mouse empty 5 4 "move") empty)

; Template with respect to MouseEvent Large enumeration
(define (handle-mouse lob x y mev)
  (cond [(mouse=? mev "button-down") (cons (make-bear x y 0) lob)]
        [else lob]))




























