#lang racket

(require rackunit)

(define (ssq a b) (+ (* a a) (* b b)))

(define (ssqmax a b c)
    (cond ((> a b) (cond ((> b c) (ssq a b))
                         (else (ssq a c))))
          (else (cond ((> a c) (ssq a b))
                         (else (ssq b c))))))

(define t1.3
    (test-suite "Tests for exercise 1.3"
    (check-equal? (ssqmax 1 2 3) 13)
    (check-equal? (ssqmax 1 3 2) 13)
    (check-equal? (ssqmax 2 1 3) 13)
    (check-equal? (ssqmax 2 3 1) 13)
    (check-equal? (ssqmax 3 1 2) 13)
    (check-equal? (ssqmax 3 2 1) 13)
    (check-equal? (ssqmax 1 1 2) 5)
    (check-equal? (ssqmax 1 2 1) 5)
    (check-equal? (ssqmax 2 1 1) 5)
    (check-equal? (ssqmax 1 2 2) 8)
    (check-equal? (ssqmax 2 1 2) 8)
    (check-equal? (ssqmax 2 2 1) 8)
    (check-equal? (ssqmax 1 1 1) 2)
    ))

(require rackunit/text-ui)

(run-tests t1.3)
