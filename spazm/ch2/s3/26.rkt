#lang racket

;;  What will append, cons and list return given x and y as follows

(define x (list 1 2 3))
(define y (list 4 5 6))

;; one flat list:
(append x y) ;; => '(1 2 3 4 5 6)

;; first item a list, then flat:
(cons x y) ;; => '((1 2 3) 4 5 6)

;; list of two lists
(list x y) ;; => '((1 2 3) (4 5 6))
