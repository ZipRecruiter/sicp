#lang racket

(require rackunit)

(define (product-recur term a next b)
  (if (> a b)
      1
      (* (term a) (product-recur term (next a) next b))))

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (inc x) (+ 1 x))

(define (pi-approx b)
  (product (lambda (x) (/ (* 2 (floor (/ (+ 2 x) 2))) (+ 1 (* 2 (floor (/ (+ 1 x) 2)))))) 1 inc b))

"pi after 3 factors"
(* 4 (pi-approx 3))

"pi after 10 factors"
(* 4 (pi-approx 10))
(exact->inexact (* 4 (pi-approx 10)))

"pi after 100 factors"
(* 4 (pi-approx 100))
(exact->inexact (* 4 (pi-approx 100)))

(define t1.31
    (test-suite "Tests for exercise 1.31"
    (check-equal? (product (lambda (x) 2) 1 inc 5) 32)
    (check-equal? (product-recur (lambda (x) 2) 1 inc 5) 32)
    ))

(require rackunit/text-ui)

(run-tests t1.31)
