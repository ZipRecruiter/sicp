#lang racket

(require rackunit)

;; same as in ex1-7a.rkt and SICP text
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-iter guess g2 x)
        (if (good-enough? guess g2)
            guess
            (sqrt-iter (improve guess x) guess x)))

(define (sqrt x)
        (sqrt-iter 1 0 x))

;; this version of good-enough? compares relative difference between guess1 and guess2
(define (good-enough? g1 g2)
        (< (abs (/ (- g1 g2) g1)) 1e-6))

(define t1.7b
    (test-suite "Tests for exercise 1.7b"
    (check-= (sqrt 1) 1 1e-6)
    (check-= (sqrt 4) 2 1e-6)
    (check-= (sqrt 2) 1.414 0.001)
    (check-= (sqrt 100) 10 1e-4)
    (check-= (sqrt 81)  9 1e-4)
    (check-= (sqrt 0.000001) 0.001 1e-9)
    (check-= (sqrt 1e6) 1000 1e-3)
    ))

(require rackunit/text-ui)

(run-tests t1.7b)

