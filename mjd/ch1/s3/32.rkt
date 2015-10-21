#lang racket

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (it a acc)
    (if (> a b)
        acc
        (it (next a) (combiner acc (term a)))))
  (it a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(sum identity 1 add1 100) ; 5050
(product identity 1 add1 8) ; 40320
