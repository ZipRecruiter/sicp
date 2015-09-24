#lang racket
(define (square x) (* x x))
(define (absolute-error a b)
  (abs (- b a)))
(define (relative-error a b)
  (abs (/ (- b a) a)))

(define (good-enough? guess prev-guess)
  (< (relative-error guess prev-guess) 0.001))
(define (average x y) (/ (+ x y) 2))
(define (improve guess x)
  (* (/ 1.0 3.0) (+ (/ x (square guess)) (* 2 guess))))

(define (cbrt-iter guess x prev-guess n)
  (if (good-enough? guess prev-guess)
      (list guess n)
      (cbrt-iter (improve guess x)
                 x
                 guess
                 (+ n 1))))

(define (cbrt x) (cbrt-iter 1.0 x 2.0 0))
(cbrt 1e60)
(cbrt 1e45)
(cbrt 1e30)
(cbrt 1e12)
(cbrt 1e-12)
(cbrt 1e-30)
(cbrt 1e-45)
(cbrt 1e-60)
