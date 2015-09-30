#lang racket
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (printf "(sine ~a)~n" angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))))

(sine 12.15)
(sin 12.15)

;;;; The procedure (sine a) recurses n times
;;;; where n is the smallest non-negative integer such that
;;;;   a/3^n < 0.1,
;;;; or equivalently
;;;;   n = ceil(log_3 (a/0.1)).
;;;; Thus the order of growth in both space and time is logarithmic.
