#lang racket

(require rackunit)

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess)
  )

(define phi-fp (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1))
(define phi-closed (/ (+ 1 (sqrt 5)) 2))

(define t1.35
    (test-suite "Tests for exercise 1.35"
    (check-= phi-fp phi-closed 0.00001)
    ))

(require rackunit/text-ui)

(run-tests t1.35)
