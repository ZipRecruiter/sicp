#lang racket

(require rackunit)


(define (make-rat n d)
  (letrec ((g (gcd n d))
           (gneg (if (< d 0) (- g) g)))
  (cons (/ n gneg) (/ d gneg))))

(define t2.1
    (test-suite "Tests for exercise 2.1"
    (check-equal? (make-rat  10  10) (cons 1 1))
    (check-equal? (make-rat -10  10) (cons -1 1))
    (check-equal? (make-rat  10 -10) (cons -1 1))
    (check-equal? (make-rat -10 -10) (cons 1 1))
))

(require rackunit/text-ui)

(run-tests t2.1)
