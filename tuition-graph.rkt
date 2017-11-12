;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname tuition-graph) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)


;Eva is trying to decide where to go to university. One important factor for her is 
;tuition costs. Eva is a visual thinker, and has taken Systematic Program Design, 
;so she decides to design a program that will help her visualize the costs at 
;different schools. She decides to start simply, knowing she can revise her design
;later.
;
;The information she has so far is the names of some schools as well as their 
;international student tuition costs. She would like to be able to represent that
;information in bar charts
        
;(A) Design data definitions to represent the information Eva has.
;(B) Design a function that consumes information about schools and their
;    tuition and produces a bar chart.
;(C) Design a function that consumes information about schools and produces
;    the school with the lowest international student tuition.

;========================

;; This program draws bar charts for various universities and their corresponding tuition fees in USD. 

;; Constants

(define TEXT-SIZE 24)
(define TEXT-COLOR "black")
(define Y-SCALE 1/200)
(define BAR-WIDTH 30)
(define BAR-COLOR "lightblue")

;========================

;; Data Definitions

(define-struct school (name tuition))
;; School is (make-school String Natural)
;; interp. name is the school's name, tuition is international student's tuition cost in USD

(define S1 (make-school "Berkeley" 14800))
(define S2 (make-school "Harvard" 52000))
(define S3 (make-school "Stanford" 48000))

(define (fn-for-school s)
  (...(school-name s)
      (school-tuition s)))

;; Template tules used:
;; - compound: (make-school String Natural)

;; ListOfSchool is one of: 
;; - empty
;; - (cons School ListOfSchool)
;; interp. a lisst of schools

(define LOS1 empty)
(define LOS2 (cons S1 (cons S2 (cons S3 empty))))

(define (fn-for-los los)
  (cond [(empty? los) (...)]
        [else
         (... (fn-for-school (first los))
              (fn-for-los (rest los)))]))
;; Template rules used:
;; - one of: 2 cases
;; - atomic distinct: empty
;; - compound: (cons School ListOfSchool)
;; - reference: (first los) is School
;; - self-reference: (rest los) is ListOfSchool

;; Functions

;; ListOfSchool -> Image
;; produce bar char showing names and tuitions of consiumed schools

(check-expect (chart empty) (square 0 "solid" "white"))

(check-expect (chart (cons (make-school "Columbia" 56000) empty))
              (beside/align "bottom"
                            (overlay/align "center" "bottom"
                                           (rotate 90 (text "Columbia" TEXT-SIZE TEXT-COLOR))
                                           (rectangle BAR-WIDTH (* 56000 Y-SCALE) "outline" "black")
                                           (rectangle BAR-WIDTH (* 56000 Y-SCALE) "solid" BAR-COLOR))
                            (square 0 "solid" "white")))

(check-expect (chart (cons (make-school "NTHU" 30000) (cons (make-school "Columbia" 56000) empty)))
              (beside/align "bottom"
                            (overlay/align "center" "bottom"
                                           (rotate 90 (text "NTHU" TEXT-SIZE TEXT-COLOR))
                                           (rectangle BAR-WIDTH (* 30000 Y-SCALE) "outline" "black")
                                           (rectangle BAR-WIDTH (* 30000 Y-SCALE) "solid" BAR-COLOR))
                            (overlay/align "center" "bottom"
                                           (rotate 90 (text "Columbia" TEXT-SIZE TEXT-COLOR))
                                           (rectangle BAR-WIDTH (* 56000 Y-SCALE) "outline" "black")
                                           (rectangle BAR-WIDTH (* 56000 Y-SCALE) "solid" BAR-COLOR))
              (square 0 "solid" "white")))

              (define (chart los) (square 0 "solid" "white"))