#lang racket

(require rackunit)

(define t1.2
    (test-suite "Tests for exercise 1.2"
    (check-equal? (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))
                  (/ -37 150))
    ))

(require rackunit/text-ui)

(run-tests t1.2)
