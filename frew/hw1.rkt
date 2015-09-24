#lang racket
(provide (all-defined-out)) ;; so we can put tests in a second file

(define a 3)
(define b (+ a 1))

(define (sq a) (* a a))
(define (guts a b) (+ (sq a) (sq b)))
(define (min a b c) (and (<= a b) (<= a c)))
(define (sumsqr a b c)
  (cond (min a b c) (guts b c)
        (min b a c) (guts a c)
        (min c a b) (guts a b)))
