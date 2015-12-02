#lang racket

(require rackunit)

(define (pascal row col)
  (cond ((= row 0) 1)
        ((= col 0) 1)
        ((= col row) 1)
        (else (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col)))))

(define t1.12
    (test-suite "Tests for exercise 1.12"
    (check-equal? (pascal 0 0) 1)
    (check-equal? (pascal 1 0) 1)
    (check-equal? (pascal 1 1) 1)
    (check-equal? (pascal 2 0) 1)
    (check-equal? (pascal 2 1) 2)
    (check-equal? (pascal 2 2) 1)
    (check-equal? (pascal 3 0) 1)
    (check-equal? (pascal 3 1) 3)
    (check-equal? (pascal 3 2) 3)
    (check-equal? (pascal 3 3) 1)
    (check-equal? (pascal 4 0) 1)
    (check-equal? (pascal 4 1) 4)
    (check-equal? (pascal 4 2) 6)
    (check-equal? (pascal 4 3) 4)
    (check-equal? (pascal 4 4) 1)
    (check-equal? (pascal 5 0) 1)
    (check-equal? (pascal 5 1) 5)
    (check-equal? (pascal 5 2) 10)
    (check-equal? (pascal 5 3) 10)
    (check-equal? (pascal 5 4) 5)
    (check-equal? (pascal 5 5) 1)
    ))

(require rackunit/text-ui)

(run-tests t1.12)
