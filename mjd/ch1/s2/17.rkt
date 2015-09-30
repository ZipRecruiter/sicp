#lang racket
(define (double x) (* x 2))
(define (halve b)
  (cond ((odd? b) (error "argument must be even")))
  (/ b 2))

(define (fast-* a b)
  (cond ((zero? b) 0)
        ((even? b) (fast-* (double a) (halve b)))
        (else (+ a (fast-* a (sub1 b))))))

(map fast-* '(0 1 2 3 4 5 6) '(2 4 6 8 10 12 14))
