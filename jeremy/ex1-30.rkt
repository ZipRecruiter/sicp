#lang racket

(require rackunit)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define t1.30
    (test-suite "Tests for exercise 1.30"
    (check-equal? (sum (lambda (x) x) 1 (lambda (x) (+ x 1)) 100) 5050)
    ))

(require rackunit/text-ui)

(run-tests t1.30)
