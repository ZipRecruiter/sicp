#lang racket

(require rackunit)

(define tolerance 0.00001)

(define (average x1 x2)
  (/ (+ x1 x2) 2))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display guess)
      (newline)
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess)
  )

(define fp (fixed-point (lambda (x) (/ (log 1000) (log x))) 2))
(define fp2 (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2))

(define t1.36
    (test-suite "Tests for exercise 1.36"
    (check-= fp 4.5555 0.0001)
    (check-= fp2 4.5555 0.0001)
    ))

(require rackunit/text-ui)

(run-tests t1.36)
