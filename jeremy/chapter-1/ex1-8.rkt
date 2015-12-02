#lang racket

(require rackunit)

(define (root-iter guess x improve good-enough?)
        (if (good-enough? guess x)
        guess
        (root-iter (improve guess x)
                   x improve good-enough?)))

(define (cuberoot x)
        (define (cube x) (* x x x))
        (define (improve g x) (/ (+ (/ x (* g g)) (* 2 g)) 3))
        (define (good-enough? g x) (< (abs (/ (- (cube g) x) x)) 1e-6))
        (root-iter 1 x improve
                       good-enough?))

(define t1.8
    (test-suite "Tests for exercise 1.8"
    (check-= (cuberoot 27) 3 1e-5)
    (check-= (cuberoot 1e9) 1000 1e-3)
    (check-= (cuberoot 1e-9) 0.001 1e-8)
    ))

(require rackunit/text-ui)

(run-tests t1.8)
