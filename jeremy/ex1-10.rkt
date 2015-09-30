#lang racket

(require rackunit)

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define t1.10
    (test-suite "Tests for exercise 1.10"
    (check-equal? (A 1 10) 1024)
    (check-equal? (A 2  4) 65536)
    (check-equal? (A 3  3) 65536)
    ))

(require rackunit/text-ui)

(run-tests t1.10)
