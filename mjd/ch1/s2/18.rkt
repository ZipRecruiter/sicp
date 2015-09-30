#lang racket
(define (double x) (* x 2))
(define (halve b)
  (cond ((odd? b) (error "argument must be even")))
  (/ b 2))

(define (fast-* a b)
  ;; invariant: a*b+acc is constant
  (define (it a b acc)
    (cond ((zero? b) acc)
          ((even? b) (it (double a) (halve b) acc))
          (else (it a (sub1 b) (+ acc a)))))
  (it a b 0))


(map fast-* '(0 1 2 3 4 5 6) '(2 4 6 8 10 12 14))
