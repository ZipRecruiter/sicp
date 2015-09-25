#lang racket

(define (larger x y)
  (if (> x y) x y))

(define (square x)
  (* x x))

(define (sum_of_squares x y)
  (+ (square x) (square y)))

(define (sum_of_largest x y z)
  (if (= x (larger x y))
         (sum_of_squares x (larger y z))
         (sum_of_squares y (larger x z))
  ))
        
; Test
(+ (* 7 7) (* 6 6))
(sum_of_largest 7 6 5)
(sum_of_largest 5 6 7)
(sum_of_largest 7 5 6)

(+ (* 7 7) (* 7 7))
(sum_of_largest 7 7 7)
