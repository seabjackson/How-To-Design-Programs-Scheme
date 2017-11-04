;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname traffic-light-animation) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;; traffic-light

;Design an animation of a traffic light. 
;
;Your program should show a traffic light that is red, then green, 
;then yellow, then red etc. For this program, your changing world 
;state data definition should be an enumeration.

;; Traffic light simulation program

;; =================
;; Constants:

(define RADIUS 25) ; determines how big each circular light looks
(define SPACING 5) ; defines the space between each light as well as between the background and the lights

(define BACKGROUND (rectangle (+ (* 2 SPACING) (* 2 RADIUS)) ; breadth
                              (+ (* 4 SPACING) (* 6 RADIUS))
                              "solid"
                              "black"))

(define SPACE (square SPACING "solid" "black"))

(define R-LIGHT (above SPACE
                       (circle RADIUS "solid" "red")
                       SPACE
                       (circle RADIUS "outline" "yellow")
                       SPACE
                       (circle RADIUS "outline" "green")))
(define Y-LIGHT (above SPACE
                       (circle RADIUS "outline" "red")
                       SPACE
                       (circle RADIUS "solid" "yellow")
                       SPACE
                       (circle RADIUS "outline" "green")))

(define G-LIGHT (above SPACE
                       (circle RADIUS "outline" "red")
                       SPACE
                       (circle RADIUS "outline" "yellow")
                       SPACE
                       (circle RADIUS "solid" "green")))

(define RED-ON (overlay R-LIGHT BACKGROUND)) ; red light on
(define YELLOW-ON (overlay Y-LIGHT BACKGROUND)) ; yellow light on
(define GREEN-ON (overlay G-LIGHT BACKGROUND)) ; green light on

;; =================
;; Data definitions:

;; Light is one of:
;; - "red"
;; - "yellow"
;; - "green"

;; interp. the current color of the traffic light
;; <examples are redundant for enumeration>

(define (fn-for-light-color lc)
  (cond [(string=? "red" lc) (...)]
        [(string=? "yellow" lc) (...)]
        [(string=? "green" lc) (...)]))
;; Template rules used:
;;  - one of: 3 cases
;;  - atomic distinct: "red"
;;  - atomic distinct: "yellow"
;;  - atomic distinct: "green"


;; =================
;; Functions:

;; Light -> Light
;; to run the animation start with (main "red")
;; 
(define (main lc)
  (big-bang lc                          ; Light
            (on-tick   next-light 5)      ; Light -> Light
            (to-draw   render-light)))  ; Light -> Image

;; Light -> Light
;; produce the next color of light
(check-expect (next-light "red") "green")
(check-expect (next-light "green") "yellow")
(check-expect (next-light "yellow") "red")
#;
(define (next-light lc) "red") ; stub

;<use template from light>

(define (next-light lc)
  (cond [(string=? "red" lc) "green"]
        [(string=? "yellow" lc) "red"]
        [(string=? "green" lc) "yellow"]))

;; Light -> Image
;; render the correct image for the light color that is on
(check-expect (render-light "red") RED-ON)
(check-expect (render-light "green") GREEN-ON)
(check-expect (render-light "yellow") YELLOW-ON)

#;
(define (render-light lc) BACKGROUND); stub
;<use template from light>

(define (render-light lc)
  (cond [(string=? "red" lc) RED-ON]
        [(string=? "yellow" lc) YELLOW-ON]
        [(string=? "green" lc) GREEN-ON]))
