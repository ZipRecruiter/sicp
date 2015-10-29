#lang racket

(require rackunit)

(define (accum-recur combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accum-recur combiner null-value term (next a) next b))))

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (inc x) (+ 1 x))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define t1.32
    (test-suite "Tests for exercise 1.32"
    (check-equal? (product (lambda (x) 2) 1 inc 5) 32)
    (check-equal? (accum-recur * 1 (lambda (x) 2) 1 inc 5) 32)
    (check-equal? (sum (lambda (x) x) 1 inc 100) 5050)
    (check-equal? (accum-recur + 0 (lambda (x) x) 1 inc 100) 5050)
    ))

(require rackunit/text-ui)

(run-tests t1.32)

