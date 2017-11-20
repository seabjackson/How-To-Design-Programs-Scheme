;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname backtracking) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; Data definitions:

(define-struct elt (name data subs))
;; Element is (make-elt String Integer ListOfElement)
;; interp. An element in the file system, with name, and EITHER data or subs.
;;         If data is 0, then subs is considered to be list of sub elements.
;;         If data is not 0, then subs is ignored.

;; ListOfElement is one of:
;;  - empty
;;  - (cons Element ListOfElement)
;; interp. A list of file system Elements

(define F1 (make-elt "F1" 1 empty))
(define F2 (make-elt "F2" 2 empty))
(define F3 (make-elt "F3" 3 empty))
(define D4 (make-elt "D4" 0 (list F1 F2)))
(define D5 (make-elt "D5" 0 (list F3)))
(define D6 (make-elt "D6" 0 (list D4 D5)))
#;
(define (fn-for-element e)
  (... (elt-name e)    ;String
       (elt-data e)    ;Integer
       (fn-for-loe (elt-subs e))))
#;
(define (fn-for-loe loe)
  (cond [(empty? loe) (...)]
        [else
         (... (fn-for-element (first loe))
              (fn-for-loe (rest loe)))])) 


;; Functions:

;Design a function that consumes Element and produces the sum of all the file data in 
;the tree.
;; Element -> Integer
;; ListOfElement -> Integer
;; produce the sum of all the data in element (and its subs)
(check-expect (sum-data--element F1) 1)
(check-expect (sum-data--loe empty) 0)
(check-expect (sum-data--element D5) 3)
(check-expect (sum-data--element D4) 3)
(check-expect (sum-data--element D6) 6)

;; stubs
;(define (sum-data--element e) 0)
;(define (sum-data-loe loe) 0)

(define (sum-data--element e)
  ( if (zero? (elt-data e))    ;Integer
       (sum-data--loe (elt-subs e))
       (elt-data e)))

(define (sum-data--loe loe)
  (cond [(empty? loe) 0]
        [else
         (+ (sum-data--element (first loe))
            (sum-data--loe (rest loe)))])) 


;Design a function that consumes Element and produces a list of the names of all the elements in 
;the tree.

;; Element -> ListOfString
;; ListOfElement -> ListOfString
;; produce the list of names of all the elements in the tree

(check-expect (all-names--loe empty) empty)
(check-expect (all-names--element F1) (list "F1"))
(check-expect (all-names--element D5) (list "D5" "F3"))
(check-expect (all-names--element D4) (list "D4" "F1" "F2"))
(check-expect (all-names--element D6) (cons "D6" (append (list "D4" "F1" "F2") (list "D5" "F3"))))

;stubs
;(define (all-names--element e) empty)
;(define (all-names--loe loe) empty)

(define (all-names--element e)
  (cons (elt-name e) 
       (all-names--loe (elt-subs e))))

(define (all-names--loe loe)
  (cond [(empty? loe) empty]
        [else
         (append (all-names--element (first loe))
              (all-names--loe (rest loe)))]))

;Design a function that consumes String and Element and produces true if there is an element in 
;the tree with the given name.


;; String Element -> Integer or false
;; String ListOfElement -> String or false
;; search the given tree for an element with the given name, produce data if found false otherwise
(check-expect (find--loe "F3" empty) false)
(check-expect (find--element "F3" F1 ) false)
(check-expect (find--element "F3" F3) 3)
(check-expect (find--element "F3" D4) false)
(check-expect (find--element "F1" D4) 1)
(check-expect (find--element "F2" D4) 2)
(check-expect (find--element "D4" D4) 0)
(check-expect (find--element "F3" D6) 3)


(define (find--element n e)
  (if (string=? (elt-name e) n)
       (elt-data e)    
       (find--loe n (elt-subs e))))

(define (find--loe n loe)
  (cond [(empty? loe) false]
        [else
         (if  (not (false? (find--element n (first loe))))
              (find--element n (first loe))
              (find--loe n (rest loe)))])) 


;(define (find--element n e) false) ; stub
;(define (find--loe n loe) false); stubs



