;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname render-bst) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; render-bst

;;Consider the following data definition for a binary search tree:
;; Data definitions:

(define-struct node (key val l r))
;; A BST (Binary Search Tree) is one of:
;;  - false
;;  - (make-node Integer String BST BST)
;; interp. false means no BST, or empty BST
;;         key is the node key
;;         val is the node val
;;         l and r are left and right subtrees
;; INVARIANT: for a given node:
;;     key is > all keys in its l(eft)  child
;;     key is < all keys in its r(ight) child
;;     the same key never appears twice in the tree

(define BST0 false)
(define BST1 (make-node 1 "abc" false false))
(define BST4 (make-node 4 "dcj" false (make-node 7 "ruf" false false)))
(define BST3 (make-node 3 "ilk" BST1 BST4))
(define BST42 
  (make-node 42 "ily"
             (make-node 27 "wit" (make-node 14 "olp" false false) false)
             (make-node 50 "dug" false false)))
(define BST10
  (make-node 10 "why" BST3 BST42))
#;
(define (fn-for-bst t)
  (cond [(false? t) (...)]
        [else
         (... (node-key t)    ;Integer
              (node-val t)    ;String
              (fn-for-bst (node-l t))
              (fn-for-bst (node-r t)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic-distinct: false
;;  - compound: (make-node Integer String BST BST)
;;  - self reference: (node-l t) has type BST
;;  - self reference: (node-r t) has type BST

;; Functions:

;Design a function that consumes a bst and produces a SIMPLE 
;rendering of that bst. Emphasis on SIMPLE. You might want to 
;skip the lines for example.

;; Constants
(define TEXT-SIZE 14)
(define TEXT-COLOR "red")
(define KEY-VAL-SEPARATOR ":")
(define H-SPACE (rectangle 10 1 "solid" "white"))
(define V-SPACE (rectangle  1  10 "solid" "white"))
(define MTTREE (rectangle 10 20 "solid" "white"))

;; BST -> Image
;; given a Binary Search Tree produce a simple rendering of its structure

(check-expect (render-bst false) MTTREE)
(check-expect (render-bst BST1) (above (text (string-append "1" KEY-VAL-SEPARATOR "abc")
                                             TEXT-SIZE
                                             TEXT-COLOR)
                                       V-SPACE
                                       (beside (render-bst false)
                                               H-SPACE
                                               (render-bst false))))

(check-expect (render-bst BST4) (above (text (string-append "4" KEY-VAL-SEPARATOR "dcj")
                                             TEXT-SIZE
                                             TEXT-COLOR)
                                       V-SPACE
                                       (beside (render-bst false)
                                               H-SPACE
                                               (render-bst (make-node 7 "ruf" false false)))))

(check-expect (render-bst BST3) (above (text (string-append "3" KEY-VAL-SEPARATOR "ilk")
                                             TEXT-SIZE
                                             TEXT-COLOR)
                                       V-SPACE
                                       (beside (render-bst BST1)
                                               H-SPACE
                                               (render-bst BST4))))


;(define (render-bst t) (square 0 "solid" "white"))

(define (render-bst t)
  (cond [(false? t) (...)]
        [else
         (... (node-key t)    ;Integer
              (node-val t)    ;String
              (render-bst (node-l t))
              (render-bst (node-r t)))]))