#lang racket

;;;; 1.31a
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

;;;; 1.31b
(define (product-iter term a next b)
  (define (it a acc)
    (if (> a b)
        acc
        (it (next a) (* acc (term a)))))
  (it a 1))

(define (factorial n)
  (product identity
           1
           add1
           n))

(factorial 8)

;;;; Converges too slowly to be useful
(define (pi-wallis n)
  ;; terms are indexed starting with term 1
  (define (numerator n)   (+ n (if (odd? n) 1 2)))
  (define (denominator n) (+ n (if (odd? n) 2 1)))
  (define (term n) (/ (numerator n) (denominator n)))
  (* 4 (product-iter term 1 add1 n)))

(exact->inexact (pi-wallis 50000))
