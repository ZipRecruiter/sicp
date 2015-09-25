#lang racket

; add a to absolute value of b
; so either 5 + 3 or 5 - -3
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; Test
(a-plus-abs-b 5 3)
(a-plus-abs-b 5 -3)