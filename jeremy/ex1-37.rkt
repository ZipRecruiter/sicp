#lang racket

(require rackunit)

(define (cont-frac n d k)
  (define (cont-frac-recur i)
    (if (> i k)
      0
      (/ (n i) (+ (d i) (cont-frac-recur (+ i 1))))))
  (cont-frac-recur 1)
)

(define (cont-frac-iter n d k)
  (define (cont-frac-inner v left)
    (if (eq? left 0)
        v
        (cont-frac-inner (/ (n left) (+ (d left) v)) (- left 1)))
  )
  (cont-frac-inner 0 k)
)

(define (one x) 1.0)
(define phi-closed (/ (+ 1 (sqrt 5)) 2))

(define t1.37
    (test-suite "Tests for exercise 1.37"
    (check-= (cont-frac one one 12) (/ 1 phi-closed) 0.00001)
    (check-= (cont-frac-iter one one 12) (/ 1 phi-closed) 0.00001)
    ))

(require rackunit/text-ui)

(run-tests t1.37)

