#lang racket

(require rackunit)

(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (fast-mult-iter a b c)
        ;; a*b+c == answer
        (cond ((= b 0) c)
              ((= b 1) (+ a c))
              ((even? b) (fast-mult-iter (double a) (halve b) c))
              (else (fast-mult-iter a (- b 1) (+ c a)))))

(define (fast-mult a b) (fast-mult-iter a b 0))

(define t1.18
    (test-suite "Tests for exercise 1.18"
    (check-equal? (fast-mult 2 2) 4)
    (check-equal? (fast-mult 123 0) 0)
    (check-equal? (fast-mult 0 123) 0)
    (check-equal? (fast-mult 123 1) 123)
    (check-equal? (fast-mult 1 123) 123)
    (check-equal? (fast-mult 2 10) 20)
    (check-equal? (fast-mult 10 2) 20)
    ))

(require rackunit/text-ui)

(run-tests t1.18)


