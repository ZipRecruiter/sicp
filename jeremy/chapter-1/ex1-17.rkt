#lang racket

(require rackunit)

(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (fast-mult a b)
        (cond ((= b 0) 0)
              ((= b 1) a)
              ((even? b) (fast-mult (double a) (halve b)))
              (else (+ a (fast-mult a (- b 1))))))

(define t1.17
    (test-suite "Tests for exercise 1.17"
    (check-equal? (fast-mult 2 2) 4)
    (check-equal? (fast-mult 123 0) 0)
    (check-equal? (fast-mult 0 123) 0)
    (check-equal? (fast-mult 123 1) 123)
    (check-equal? (fast-mult 1 123) 123)
    (check-equal? (fast-mult 2 10) 20)
    (check-equal? (fast-mult 10 2) 20)
    ))

(require rackunit/text-ui)

(run-tests t1.17)

