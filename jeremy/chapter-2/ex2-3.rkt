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

;; rectangle defined by its diagonal (hello, TV manufacturers!)
(define (make-rectangle1 p1 p2)
    (let ((x1 (min (x-point p1) (x-point p2)))
          (x2 (max (x-point p1) (x-point p2)))
          (y1 (min (y-point p1) (y-point p2)))
          (y2 (max (y-point p1) (y-point p2))))
      (make-segment (make-point x1 y1) (make-point x2 y2))))

(define (lower-left-rectangle r) (start-segment r))
(define (upper-right-rectangle r) (end-segment r))
(define (upper-left-rectangle r) (make-point (x-point (start-segment r)) (y-point (end-segment r))))
(define (lower-right-rectangle r) (make-point (x-point (end-segment r)) (y-point (start-segment r))))

(define (width-rectangle r) (- (x-point (end-segment r)) (x-point (start-segment r))))
(define (height-rectangle r) (- (y-point (end-segment r)) (y-point (start-segment r))))

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

