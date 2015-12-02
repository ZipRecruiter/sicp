#lang racket

(require rackunit)

;; from SICP text
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
      x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (sqrt x)
  (sqrt-iter 1.0 x))

;; this version of good-enough? compares relative difference between x and guess**2
(define (good-enough? guess x)
        (< (abs (/ (- (* guess guess) x) x)) 1e-6))

(define t1.7a
    (test-suite "Tests for exercise 1.7a"
    (check-= (sqrt 1) 1 1e-6)
    (check-= (sqrt 4) 2 1e-6)
    (check-= (sqrt 2) 1.414 0.001)
    (check-= (sqrt 100) 10 1e-4)
    (check-= (sqrt 81)  9 1e-4)
    (check-= (sqrt 0.000001) 0.001 1e-9)
    (check-= (sqrt 1e6) 1000 1e-3)
    ))

(require rackunit/text-ui)

(run-tests t1.7a)
