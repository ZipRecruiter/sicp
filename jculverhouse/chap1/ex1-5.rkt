#lang racket

; this is forever recursive
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))
; in applicative order (p) is calculated first and never returns
; in normal order, 0=0 so 0 is returned and y was never needed, so (p) was never calced