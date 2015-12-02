#lang racket

(require rackunit)

(define (make-segment p1 p2) (cons p1 p2))

(define (start-segment s) (car s))

(define (end-segment s) (cdr s))

(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (avg x1 x2) (/ (+ x1 x2) 2))

(define (midpoint p1 p2)
  (make-point (avg (x-point p1) (x-point p2))
              (avg (y-point p1) (y-point p2))))

(define (midpoint-segment s)
  (midpoint (start-segment s) (end-segment s)))

;; test scaffolding
(define p1 (make-point 1 3))
(define p2 (make-point 5 -1))
(define s1 (make-segment p1 p2))
(define p3 (midpoint-segment s1))

(define t2.2
    (test-suite "Tests for exercise 2.2"
    (check-equal? (x-point p3) 3)
    (check-equal? (y-point p3) 1)
))

(require rackunit/text-ui)

(run-tests t2.2)
