#lang racket

(require rackunit)

(define (last-pair x)
    (if (null? (cdr x))
        x
        (last-pair (cdr x))
    ))

(define t2.17
    (test-suite "Tests for exercise 2.17"
    (check-equal? (last-pair (list 23 72 149 34)) (list 34))
))

(require rackunit/text-ui)

(run-tests t2.17)
