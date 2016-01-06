#lang racket

(require rackunit)


(define (make-interval a b) (cons a b))

(define (lower-bound interval) (car interval))

(define (upper-bound interval) (cdr interval))

(define (sub-interval a b)
  (make-interval (- (lower-bound a) (upper-bound b))
                 (- (upper-bound a) (lower-bound b))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
      (make-interval (min p1 p2 p3 p4)
                         (max p1 p2 p3 p4))))

;; test data
(define x (make-interval 1 2))
(define y (make-interval 3 6))
(define z (sub-interval y x))
x
y
z

(define t2.7
    (test-suite "Tests for exercise 2.7"
    (check-equal? (lower-bound x) 1)
    (check-equal? (upper-bound x) 2)
    (check-equal? (lower-bound z) 1)
    (check-equal? (upper-bound z) 5)
))

(require rackunit/text-ui)

(run-tests t2.7)
