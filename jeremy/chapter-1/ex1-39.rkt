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

(define (tan-cf x k)
  (define (n i) (* -1 (if (eq? i 1) x (expt x 2))))
  (define (d i) (- (* 2 i) 1))
  (* -1 (cont-frac-iter n d k)))

(define e (exp 1))

(define (test-tan-cf x k) (check-= (tan-cf x k) (tan x) 0.00001))

(define t1.39
    (test-suite "Tests for exercise 1.39"
    (test-tan-cf (/ pi 4) 100)
    (test-tan-cf (/ pi 3) 100)
    (test-tan-cf 1 10)
    ))

(require rackunit/text-ui)

(run-tests t1.39)

