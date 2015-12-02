#lang racket

(require rackunit)

(define dx 0.00001)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (lambda (x) (+ c (* x (+ b (* x (+ a x)))))))

(define t1.40
    (test-suite "Tests for exercise 1.40"
    (check-= (newtons-method (cubic 2 2 1) 1.1) -1.0 0.0001)
    (check-= (newtons-method (cubic -6 11 -6) 1.1) 1.0 0.0001)
    (check-= (newtons-method (cubic -6 11 -6) 2.1) 2.0 0.0001)
    (check-= (newtons-method (cubic -6 11 -6) 4.0) 3.0 0.0001)
    ))

(require rackunit/text-ui)

(run-tests t1.40)

