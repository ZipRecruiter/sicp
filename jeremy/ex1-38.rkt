#lang racket

(require rackunit)

(define (cont-frac-iter n d k)
  (define (cont-frac-inner v left)
    (if (eq? left 0)
        v
        (cont-frac-inner (/ (n left) (+ (d left) v)) (- left 1)))
  )
  (cont-frac-inner 0 k)
)

(define (one x) 1.0)
(define (d x) (if (eq? 2 (remainder x 3))
                  (* 2 (+ 1 (quotient x 3)))
                  1))

(define e (exp 1))

(define t1.38
    (test-suite "Tests for exercise 1.38"
    (check-= (+ 2 (cont-frac-iter one d 12)) e 0.00000001)
    ))

(require rackunit/text-ui)

(run-tests t1.38)
