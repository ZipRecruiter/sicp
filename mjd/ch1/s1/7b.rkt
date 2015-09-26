#lang racket
(define (square x) (* x x))
(define (relative-error a b)
  (abs (/ (- b a) a)))

(define (good-enough? guess x)
  (< (relative-error (square guess) x) 0.001))
(define (average x y) (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x n)
  (if (good-enough? guess x)
      (list guess n)
      (sqrt-iter (improve guess x)
                 x
                 (+ n 1))))

(define (sqrt x) (sqrt-iter 1.0 x 0))