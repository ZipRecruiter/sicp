#lang racket

(require rackunit)

(define (square x) (* x x))

(define (f g)
 (g 2))

(define t1.34
    (test-suite "Tests for exercise 1.34"
    (check-equal? (f square) 4)
    (check-equal? (f (lambda (z) (* z (+ z 1)))) 6)
    ))

(require rackunit/text-ui)

(run-tests t1.34)
